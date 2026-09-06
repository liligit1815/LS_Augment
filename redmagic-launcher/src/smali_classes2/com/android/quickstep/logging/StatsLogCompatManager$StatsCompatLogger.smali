.class Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;
.super Ljava/lang/Object;
.source "StatsLogCompatManager.java"

# interfaces
.implements Lcom/android/launcher3/logging/StatsLogManager$i;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/logging/StatsLogCompatManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StatsCompatLogger"
.end annotation


# static fields
.field private static final DEFAULT_ITEM_INFO:Lcom/android/launcher3/model/data/y;


# instance fields
.field private final mActivityContext:Ljava/util/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Optional<",
            "Lcom/android/launcher3/views/k;",
            ">;"
        }
    .end annotation
.end field

.field private mCardinality:Ljava/util/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Optional<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mContainerInfo:Ljava/util/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Optional<",
            "Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;

.field private final mDisplayRotation:I

.field private mDstState:I

.field private mEditText:Ljava/util/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Optional<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mFeatures:Ljava/util/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Optional<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mFromState:Ljava/util/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Optional<",
            "Lcom/android/launcher3/logger/LauncherAtom$FromState;",
            ">;"
        }
    .end annotation
.end field

.field private mInputType:I

.field private mInstanceId:Lcom/android/launcher3/logging/d;

.field private mItemInfo:Lcom/android/launcher3/model/data/y;

.field private mPackageName:Ljava/util/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Optional<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mRank:Ljava/util/OptionalInt;

.field private mSlice:Lcom/android/launcher3/logger/LauncherAtom$Slice;

.field private mSliceItem:Landroidx/slice/SliceItem;

.field private mSrcState:I

.field private mToState:Ljava/util/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Optional<",
            "Lcom/android/launcher3/logger/LauncherAtom$ToState;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/model/data/y;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->DEFAULT_ITEM_INFO:Lcom/android/launcher3/model/data/y;

    .line 7
    .line 8
    const/4 v1, -0x1

    .line 9
    iput v1, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 10
    .line 11
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/android/launcher3/views/k;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->DEFAULT_ITEM_INFO:Lcom/android/launcher3/model/data/y;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 7
    .line 8
    invoke-static {}, Lcom/android/quickstep/logging/StatsLogCompatManager;->b()Lcom/android/launcher3/logging/d;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mInstanceId:Lcom/android/launcher3/logging/d;

    .line 13
    .line 14
    invoke-static {}, Ljava/util/OptionalInt;->empty()Ljava/util/OptionalInt;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mRank:Ljava/util/OptionalInt;

    .line 19
    .line 20
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mContainerInfo:Ljava/util/Optional;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mSrcState:I

    .line 28
    .line 29
    iput v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mDstState:I

    .line 30
    .line 31
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iput-object v1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mFromState:Ljava/util/Optional;

    .line 36
    .line 37
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-object v1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mToState:Ljava/util/Optional;

    .line 42
    .line 43
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iput-object v1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mEditText:Ljava/util/Optional;

    .line 48
    .line 49
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iput-object v1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mCardinality:Ljava/util/Optional;

    .line 54
    .line 55
    iput v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mInputType:I

    .line 56
    .line 57
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iput-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mFeatures:Ljava/util/Optional;

    .line 62
    .line 63
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mPackageName:Ljava/util/Optional;

    .line 68
    .line 69
    iput-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mContext:Landroid/content/Context;

    .line 70
    .line 71
    invoke-static {p2}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    iput-object p2, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mActivityContext:Ljava/util/Optional;

    .line 76
    .line 77
    sget-object p2, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 78
    .line 79
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    check-cast p1, Lcom/android/launcher3/util/Z;

    .line 84
    .line 85
    invoke-virtual {p1}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iget p1, p1, Lcom/android/launcher3/util/Z$c;->b:I

    .line 90
    .line 91
    iput p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mDisplayRotation:I

    .line 92
    .line 93
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;Lcom/android/launcher3/logging/StatsLogManager$d;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->lambda$log$0(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private applyOverwrites(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/y;->toBuilder()Lcom/google/protobuf/y$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mRank:Ljava/util/OptionalInt;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    new-instance v1, Lcom/android/quickstep/logging/r;

    .line 13
    .line 14
    invoke-direct {v1, p1}, Lcom/android/quickstep/logging/r;-><init>(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/util/OptionalInt;->ifPresent(Ljava/util/function/IntConsumer;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mContainerInfo:Ljava/util/Optional;

    .line 21
    .line 22
    new-instance v1, Lcom/android/quickstep/logging/s;

    .line 23
    .line 24
    invoke-direct {v1, p1}, Lcom/android/quickstep/logging/s;-><init>(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mActivityContext:Ljava/util/Optional;

    .line 31
    .line 32
    new-instance v1, Lcom/android/quickstep/logging/t;

    .line 33
    .line 34
    invoke-direct {v1, p1}, Lcom/android/quickstep/logging/t;-><init>(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mFromState:Ljava/util/Optional;

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/util/Optional;->isPresent()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    iget-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mToState:Ljava/util/Optional;

    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/util/Optional;->isPresent()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_0

    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mEditText:Ljava/util/Optional;

    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/util/Optional;->isPresent()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->getFolderIcon()Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Lcom/google/protobuf/y;->toBuilder()Lcom/google/protobuf/y$a;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;

    .line 73
    .line 74
    iget-object v1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mFromState:Ljava/util/Optional;

    .line 75
    .line 76
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    new-instance v2, Lcom/android/quickstep/logging/u;

    .line 80
    .line 81
    invoke-direct {v2, v0}, Lcom/android/quickstep/logging/u;-><init>(Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1, v2}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mToState:Ljava/util/Optional;

    .line 88
    .line 89
    new-instance v2, Lcom/android/quickstep/logging/v;

    .line 90
    .line 91
    invoke-direct {v2, v0}, Lcom/android/quickstep/logging/v;-><init>(Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1, v2}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mEditText:Ljava/util/Optional;

    .line 98
    .line 99
    new-instance v1, Lcom/android/quickstep/logging/m;

    .line 100
    .line 101
    invoke-direct {v1, v0}, Lcom/android/quickstep/logging/m;-><init>(Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, v1}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, v0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setFolderIcon(Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 108
    .line 109
    .line 110
    :cond_1
    invoke-virtual {p1}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 115
    .line 116
    return-object p0
.end method

.method public static synthetic b(Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;Lcom/android/launcher3/logging/StatsLogManager$d;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->lambda$log$1(Lcom/android/launcher3/logging/StatsLogManager$d;Lz1/o3;Lz1/y0;Lz1/m;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->k(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->e(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic e(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->g(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic f(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;Lcom/android/launcher3/views/k;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lcom/android/launcher3/views/k;->applyOverwritesToLogItem(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getDisplayRotation()I
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mDisplayRotation:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-eq p0, v0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_0
    return v0
.end method

.method private getRecentsOrientationHandler(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getTaskSwitcherContainer()Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer;->getOrientationHandler()Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer$OrientationHandler;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object p1, Lcom/android/quickstep/logging/StatsLogCompatManager$1;->$SwitchMap$com$android$launcher3$logger$LauncherAtom$TaskSwitcherContainer$OrientationHandler:[I

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    aget p0, p1, p0

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    if-eq p0, p1, :cond_2

    .line 23
    .line 24
    const/4 v0, 0x2

    .line 25
    if-eq p0, v0, :cond_1

    .line 26
    .line 27
    const/4 p1, 0x3

    .line 28
    if-ne p0, p1, :cond_0

    .line 29
    .line 30
    return v0

    .line 31
    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    .line 32
    .line 33
    const/4 p1, 0x0

    .line 34
    invoke-direct {p0, p1, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    throw p0

    .line 38
    :cond_1
    return p1

    .line 39
    :cond_2
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method private synthetic lambda$log$0(Lcom/android/launcher3/logging/StatsLogManager$d;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mSlice:Lcom/android/launcher3/logger/LauncherAtom$Slice;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setSlice(Lcom/android/launcher3/logger/LauncherAtom$Slice;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mContainerInfo:Ljava/util/Optional;

    .line 12
    .line 13
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    new-instance v2, Lcom/android/quickstep/logging/s;

    .line 17
    .line 18
    invoke-direct {v2, v0}, Lcom/android/quickstep/logging/s;-><init>(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 29
    .line 30
    invoke-direct {p0, v0}, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->applyOverwrites(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->write(Lcom/android/launcher3/logging/StatsLogManager$d;Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private synthetic lambda$log$1(Lcom/android/launcher3/logging/StatsLogManager$d;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    iget-object p3, p3, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 4
    .line 5
    iget p4, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 6
    .line 7
    invoke-virtual {p3, p4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    check-cast p3, Lcom/android/launcher3/model/data/m;

    .line 12
    .line 13
    iget-object p4, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mContext:Landroid/content/Context;

    .line 14
    .line 15
    invoke-virtual {p2, p3, p4}, Lcom/android/launcher3/model/data/y;->buildProto(Lcom/android/launcher3/model/data/m;Landroid/content/Context;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-direct {p0, p2}, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->applyOverwrites(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->write(Lcom/android/launcher3/logging/StatsLogManager$d;Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private write(Lcom/android/launcher3/logging/StatsLogManager$d;Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)V
    .locals 36

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iget-object v3, v0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mInstanceId:Lcom/android/launcher3/logging/d;

    .line 8
    .line 9
    iget v6, v0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mSrcState:I

    .line 10
    .line 11
    iget v7, v0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mDstState:I

    .line 12
    .line 13
    iget v4, v0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mInputType:I

    .line 14
    .line 15
    iget-object v5, v0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mPackageName:Ljava/util/Optional;

    .line 16
    .line 17
    new-instance v8, Lcom/android/quickstep/logging/l;

    .line 18
    .line 19
    invoke-direct {v8, v2}, Lcom/android/quickstep/logging/l;-><init>(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v5, v8}, Ljava/util/Optional;->orElseGet(Ljava/util/function/Supplier;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    move-object v14, v5

    .line 27
    check-cast v14, Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {}, Lcom/android/quickstep/logging/StatsLogCompatManager;->c()Z

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    if-eqz v5, :cond_6

    .line 34
    .line 35
    instance-of v5, v1, Ljava/lang/Enum;

    .line 36
    .line 37
    if-eqz v5, :cond_0

    .line 38
    .line 39
    move-object v5, v1

    .line 40
    check-cast v5, Ljava/lang/Enum;

    .line 41
    .line 42
    invoke-virtual {v5}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-interface {v1}, Lcom/android/launcher3/logging/StatsLogManager$d;->getId()I

    .line 53
    .line 54
    .line 55
    move-result v8

    .line 56
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v8, ""

    .line 60
    .line 61
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    :goto_0
    new-instance v8, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    const-string v9, "\n"

    .line 71
    .line 72
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Lcom/android/quickstep/logging/StatsLogCompatManager;->b()Lcom/android/launcher3/logging/d;

    .line 76
    .line 77
    .line 78
    move-result-object v10

    .line 79
    if-eq v3, v10, :cond_1

    .line 80
    .line 81
    const-string v10, "InstanceId:%s "

    .line 82
    .line 83
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v11

    .line 87
    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v10

    .line 91
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    :cond_1
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    if-nez v6, :cond_2

    .line 98
    .line 99
    if-eqz v7, :cond_3

    .line 100
    .line 101
    :cond_2
    invoke-static {v6}, Lcom/android/quickstep/logging/StatsLogCompatManager;->o(I)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    invoke-static {v7}, Lcom/android/quickstep/logging/StatsLogCompatManager;->o(I)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v10

    .line 109
    filled-new-array {v5, v10}, [Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    const-string v10, "(State:%s->%s)"

    .line 114
    .line 115
    invoke-static {v10, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    :cond_3
    invoke-virtual {v2}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->hasContainerInfo()Z

    .line 123
    .line 124
    .line 125
    move-result v5

    .line 126
    if-eqz v5, :cond_4

    .line 127
    .line 128
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    :cond_4
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 135
    .line 136
    .line 137
    move-result v5

    .line 138
    if-nez v5, :cond_5

    .line 139
    .line 140
    const-string v5, "\nPackage name: %s"

    .line 141
    .line 142
    filled-new-array {v14}, [Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v9

    .line 146
    invoke-static {v5, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v5

    .line 150
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    :cond_5
    const-string v5, "StatsLog"

    .line 154
    .line 155
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v8

    .line 159
    invoke-static {v5, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    .line 161
    .line 162
    :cond_6
    sget-object v5, Lcom/android/quickstep/logging/StatsLogCompatManager;->LOGS_CONSUMER:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 163
    .line 164
    invoke-virtual {v5}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 165
    .line 166
    .line 167
    move-result-object v5

    .line 168
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 169
    .line 170
    .line 171
    move-result v8

    .line 172
    if-eqz v8, :cond_7

    .line 173
    .line 174
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object v8

    .line 178
    check-cast v8, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsLogConsumer;

    .line 179
    .line 180
    invoke-interface {v8, v1, v2}, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsLogConsumer;->consume(Lcom/android/launcher3/logging/StatsLogManager$d;Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)V

    .line 181
    .line 182
    .line 183
    goto :goto_1

    .line 184
    :cond_7
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 185
    .line 186
    .line 187
    move-result v5

    .line 188
    if-eqz v5, :cond_8

    .line 189
    .line 190
    return-void

    .line 191
    :cond_8
    iget-object v5, v0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mCardinality:Ljava/util/Optional;

    .line 192
    .line 193
    new-instance v8, Lcom/android/quickstep/logging/n;

    .line 194
    .line 195
    invoke-direct {v8, v2}, Lcom/android/quickstep/logging/n;-><init>(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v5, v8}, Ljava/util/Optional;->orElseGet(Ljava/util/function/Supplier;)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v5

    .line 202
    check-cast v5, Ljava/lang/Integer;

    .line 203
    .line 204
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 205
    .line 206
    .line 207
    move-result v28

    .line 208
    iget-object v5, v0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mFeatures:Ljava/util/Optional;

    .line 209
    .line 210
    new-instance v8, Lcom/android/quickstep/logging/o;

    .line 211
    .line 212
    invoke-direct {v8, v2}, Lcom/android/quickstep/logging/o;-><init>(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v5, v8}, Ljava/util/Optional;->orElseGet(Ljava/util/function/Supplier;)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v5

    .line 219
    check-cast v5, Ljava/lang/Integer;

    .line 220
    .line 221
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 222
    .line 223
    .line 224
    move-result v29

    .line 225
    invoke-interface {v1}, Lcom/android/launcher3/logging/StatsLogManager$d;->getId()I

    .line 226
    .line 227
    .line 228
    move-result v10

    .line 229
    invoke-virtual {v2}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getItemCase()Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$ItemCase;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    invoke-virtual {v1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$ItemCase;->getNumber()I

    .line 234
    .line 235
    .line 236
    move-result v11

    .line 237
    invoke-virtual {v3}, Lcom/android/launcher3/logging/d;->b()I

    .line 238
    .line 239
    .line 240
    move-result v12

    .line 241
    invoke-static {v2}, Lcom/android/quickstep/logging/StatsLogCompatManager;->f(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v15

    .line 245
    const/4 v1, 0x0

    .line 246
    invoke-static {v2, v1}, Lcom/android/quickstep/logging/StatsLogCompatManager;->h(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Z)I

    .line 247
    .line 248
    .line 249
    move-result v16

    .line 250
    invoke-static {v2, v1}, Lcom/android/quickstep/logging/StatsLogCompatManager;->i(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Z)I

    .line 251
    .line 252
    .line 253
    move-result v17

    .line 254
    invoke-static {v2}, Lcom/android/quickstep/logging/StatsLogCompatManager;->l(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 255
    .line 256
    .line 257
    move-result v18

    .line 258
    const/4 v1, 0x1

    .line 259
    invoke-static {v2, v1}, Lcom/android/quickstep/logging/StatsLogCompatManager;->h(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Z)I

    .line 260
    .line 261
    .line 262
    move-result v19

    .line 263
    invoke-static {v2, v1}, Lcom/android/quickstep/logging/StatsLogCompatManager;->i(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Z)I

    .line 264
    .line 265
    .line 266
    move-result v20

    .line 267
    invoke-static {v2}, Lcom/android/quickstep/logging/StatsLogCompatManager;->m(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 268
    .line 269
    .line 270
    move-result v21

    .line 271
    invoke-static {v2}, Lcom/android/quickstep/logging/StatsLogCompatManager;->j(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 272
    .line 273
    .line 274
    move-result v22

    .line 275
    invoke-virtual {v2}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getRank()I

    .line 276
    .line 277
    .line 278
    move-result v24

    .line 279
    invoke-virtual {v2}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getFolderIcon()Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 280
    .line 281
    .line 282
    move-result-object v1

    .line 283
    invoke-virtual {v1}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->getFromLabelState()Lcom/android/launcher3/logger/LauncherAtom$FromState;

    .line 284
    .line 285
    .line 286
    move-result-object v1

    .line 287
    invoke-virtual {v1}, Lcom/android/launcher3/logger/LauncherAtom$FromState;->getNumber()I

    .line 288
    .line 289
    .line 290
    move-result v25

    .line 291
    invoke-virtual {v2}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getFolderIcon()Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 292
    .line 293
    .line 294
    move-result-object v1

    .line 295
    invoke-virtual {v1}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->getToLabelState()Lcom/android/launcher3/logger/LauncherAtom$ToState;

    .line 296
    .line 297
    .line 298
    move-result-object v1

    .line 299
    invoke-virtual {v1}, Lcom/android/launcher3/logger/LauncherAtom$ToState;->getNumber()I

    .line 300
    .line 301
    .line 302
    move-result v26

    .line 303
    invoke-virtual {v2}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getFolderIcon()Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 304
    .line 305
    .line 306
    move-result-object v1

    .line 307
    invoke-virtual {v1}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->getLabelInfo()Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v27

    .line 311
    invoke-static {v2}, Lcom/android/quickstep/logging/StatsLogCompatManager;->n(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 312
    .line 313
    .line 314
    move-result v30

    .line 315
    invoke-static {v2}, Lcom/android/quickstep/logging/StatsLogCompatManager;->d(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)[B

    .line 316
    .line 317
    .line 318
    move-result-object v31

    .line 319
    invoke-virtual {v2}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getUserType()I

    .line 320
    .line 321
    .line 322
    move-result v33

    .line 323
    invoke-direct {v0}, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->getDisplayRotation()I

    .line 324
    .line 325
    .line 326
    move-result v34

    .line 327
    invoke-direct {v0, v2}, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->getRecentsOrientationHandler(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 328
    .line 329
    .line 330
    move-result v35

    .line 331
    move/from16 v32, v4

    .line 332
    .line 333
    const/16 v4, 0x13

    .line 334
    .line 335
    const/4 v5, 0x0

    .line 336
    const/4 v8, 0x0

    .line 337
    const/4 v9, 0x0

    .line 338
    const/4 v13, 0x0

    .line 339
    const/16 v23, 0x0

    .line 340
    .line 341
    invoke-static/range {v4 .. v35}, Lcom/android/systemui/shared/system/SysUiStatsLog;->write(IIII[BZIIIILjava/lang/String;Ljava/lang/String;IIIIIIIZIIILjava/lang/String;III[BIIII)V

    .line 342
    .line 343
    .line 344
    return-void
.end method


# virtual methods
.method public log(Lcom/android/launcher3/logging/StatsLogManager$d;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/quickstep/logging/StatsLogCompatManager;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    instance-of v0, p1, Ljava/lang/Enum;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    move-object v0, p1

    .line 12
    check-cast v0, Ljava/lang/Enum;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-interface {p1}, Lcom/android/launcher3/logging/StatsLogManager$d;->getId()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, ""

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    :goto_0
    const-string v1, "StatsLog"

    .line 41
    .line 42
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mSlice:Lcom/android/launcher3/logger/LauncherAtom$Slice;

    .line 46
    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mSliceItem:Landroidx/slice/SliceItem;

    .line 50
    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$Slice;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$Slice$Builder;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object v1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mSliceItem:Landroidx/slice/SliceItem;

    .line 58
    .line 59
    invoke-virtual {v1}, Landroidx/slice/SliceItem;->n()Landroidx/slice/Slice;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Landroidx/slice/Slice;->e()Landroid/net/Uri;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Lcom/android/launcher3/logger/LauncherAtom$Slice$Builder;->setUri(Ljava/lang/String;)Lcom/android/launcher3/logger/LauncherAtom$Slice$Builder;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$Slice;

    .line 80
    .line 81
    iput-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mSlice:Lcom/android/launcher3/logger/LauncherAtom$Slice;

    .line 82
    .line 83
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mSlice:Lcom/android/launcher3/logger/LauncherAtom$Slice;

    .line 84
    .line 85
    if-eqz v0, :cond_3

    .line 86
    .line 87
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 88
    .line 89
    new-instance v1, Lcom/android/quickstep/logging/p;

    .line 90
    .line 91
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/logging/p;-><init>(Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_3
    iget-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 99
    .line 100
    if-nez v0, :cond_4

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_4
    iget v0, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 104
    .line 105
    if-gez v0, :cond_5

    .line 106
    .line 107
    sget-object v0, Lcom/android/launcher3/P2;->h:Lcom/android/launcher3/util/I;

    .line 108
    .line 109
    iget-object v1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mContext:Landroid/content/Context;

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Lcom/android/launcher3/P2;

    .line 116
    .line 117
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    new-instance v1, Lcom/android/quickstep/logging/q;

    .line 122
    .line 123
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/logging/q;-><init>(Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v1}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 127
    .line 128
    .line 129
    :cond_5
    :goto_1
    return-void
.end method

.method public sendToInteractionJankMonitor(Lcom/android/launcher3/logging/StatsLogManager$d;Landroid/view/View;)V
    .locals 4

    .line 1
    instance-of p0, p1, Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-object p0, Lcom/android/quickstep/logging/StatsLogCompatManager$1;->$SwitchMap$com$android$launcher3$logging$StatsLogManager$LauncherEvent:[I

    .line 7
    .line 8
    check-cast p1, Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    aget p0, p0, p1

    .line 15
    .line 16
    const/16 p1, 0x1a

    .line 17
    .line 18
    const/16 v0, 0x66

    .line 19
    .line 20
    const/16 v1, 0x67

    .line 21
    .line 22
    const/16 v2, 0x7e

    .line 23
    .line 24
    const/16 v3, 0x7f

    .line 25
    .line 26
    packed-switch p0, :pswitch_data_0

    .line 27
    .line 28
    .line 29
    :goto_0
    return-void

    .line 30
    :pswitch_0
    invoke-static {v3}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :pswitch_1
    invoke-static {p2, v3}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :pswitch_2
    invoke-static {v2}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :pswitch_3
    invoke-static {p2, v2}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;I)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :pswitch_4
    invoke-static {v1}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :pswitch_5
    invoke-static {p2, v1}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;I)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :pswitch_6
    invoke-static {v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :pswitch_7
    invoke-static {p2, v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;I)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :pswitch_8
    invoke-static {p1}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :pswitch_9
    invoke-static {p2, p1}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;I)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    nop

    .line 71
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public withCardinality(I)Lcom/android/launcher3/logging/StatsLogManager$i;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mCardinality:Ljava/util/Optional;

    .line 10
    .line 11
    return-object p0
.end method

.method public withContainerInfo(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)Lcom/android/launcher3/logging/StatsLogManager$i;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->DEFAULT_ITEM_INFO:Lcom/android/launcher3/model/data/y;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    const-string v1, "ItemInfo and ContainerInfo are mutual exclusive; cannot log both."

    .line 11
    .line 12
    invoke-static {v0, v1}, LI/h;->h(ZLjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mContainerInfo:Ljava/util/Optional;

    .line 20
    .line 21
    return-object p0
.end method

.method public withDstState(I)Lcom/android/launcher3/logging/StatsLogManager$i;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mDstState:I

    .line 2
    .line 3
    return-object p0
.end method

.method public withEditText(Ljava/lang/String;)Lcom/android/launcher3/logging/StatsLogManager$i;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mEditText:Ljava/util/Optional;

    .line 6
    .line 7
    return-object p0
.end method

.method public withFeatures(I)Lcom/android/launcher3/logging/StatsLogManager$i;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mFeatures:Ljava/util/Optional;

    .line 10
    .line 11
    return-object p0
.end method

.method public withFromState(Lcom/android/launcher3/logger/LauncherAtom$FromState;)Lcom/android/launcher3/logging/StatsLogManager$i;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mFromState:Ljava/util/Optional;

    .line 6
    .line 7
    return-object p0
.end method

.method public withInputType(I)Lcom/android/launcher3/logging/StatsLogManager$i;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mInputType:I

    .line 2
    .line 3
    return-object p0
.end method

.method public withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mInstanceId:Lcom/android/launcher3/logging/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mContainerInfo:Ljava/util/Optional;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/Optional;->isPresent()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 13
    .line 14
    const-string p1, "ItemInfo and ContainerInfo are mutual exclusive; cannot log both."

    .line 15
    .line 16
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw p0
.end method

.method public withPackageName(Ljava/lang/String;)Lcom/android/launcher3/logging/StatsLogManager$i;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mPackageName:Ljava/util/Optional;

    .line 6
    .line 7
    return-object p0
.end method

.method public withRank(I)Lcom/android/launcher3/logging/StatsLogManager$i;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/util/OptionalInt;->of(I)Ljava/util/OptionalInt;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mRank:Ljava/util/OptionalInt;

    .line 6
    .line 7
    return-object p0
.end method

.method public withSlice(Lcom/android/launcher3/logger/LauncherAtom$Slice;)Lcom/android/launcher3/logging/StatsLogManager$i;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->DEFAULT_ITEM_INFO:Lcom/android/launcher3/model/data/y;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mSliceItem:Landroidx/slice/SliceItem;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    :goto_0
    const-string v1, "ItemInfo, Slice and SliceItem are mutual exclusive; cannot set more than one of them."

    .line 15
    .line 16
    invoke-static {v0, v1}, LI/h;->h(ZLjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string v0, "expected valid slice but received null"

    .line 20
    .line 21
    invoke-static {p1, v0}, LI/h;->g(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/android/launcher3/logger/LauncherAtom$Slice;->getUri()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "expected valid slice uri but received null"

    .line 29
    .line 30
    invoke-static {v0, v1}, LI/h;->g(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mSlice:Lcom/android/launcher3/logger/LauncherAtom$Slice;

    .line 34
    .line 35
    return-object p0
.end method

.method public withSliceItem(Landroidx/slice/SliceItem;)Lcom/android/launcher3/logging/StatsLogManager$i;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->DEFAULT_ITEM_INFO:Lcom/android/launcher3/model/data/y;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mSlice:Lcom/android/launcher3/logger/LauncherAtom$Slice;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    :goto_0
    const-string v1, "ItemInfo, Slice and SliceItem are mutual exclusive; cannot set more than one of them."

    .line 15
    .line 16
    invoke-static {v0, v1}, LI/h;->h(ZLjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string v0, "expected valid sliceItem but received null"

    .line 20
    .line 21
    invoke-static {p1, v0}, LI/h;->g(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Landroidx/slice/SliceItem;

    .line 26
    .line 27
    iput-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mSliceItem:Landroidx/slice/SliceItem;

    .line 28
    .line 29
    return-object p0
.end method

.method public withSrcState(I)Lcom/android/launcher3/logging/StatsLogManager$i;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mSrcState:I

    .line 2
    .line 3
    return-object p0
.end method

.method public withToState(Lcom/android/launcher3/logger/LauncherAtom$ToState;)Lcom/android/launcher3/logging/StatsLogManager$i;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;->mToState:Ljava/util/Optional;

    .line 6
    .line 7
    return-object p0
.end method
