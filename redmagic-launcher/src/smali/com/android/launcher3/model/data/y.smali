.class public Lcom/android/launcher3/model/data/y;
.super Ljava/lang/Object;
.source "ItemInfo.java"


# static fields
.field public static final DEBUG:Z = true

.field private static final NAV_BAR_KIDS_MODE:Landroid/net/Uri;

.field public static final NO_ID:I = -0x1

.field private static final TAG:Ljava/lang/String; = "ItemInfo"


# instance fields
.field public animationType:I

.field public appTitle:Ljava/lang/CharSequence;

.field public cellX:I

.field public cellY:I

.field public container:I

.field public contentDescription:Ljava/lang/CharSequence;

.field public iconArrangeInfo:Ljava/lang/String;

.field public id:I

.field public isAppLimited:Z

.field public isAppVdmcLimited:Z

.field public isChecked:Z

.field public isCollisionInWorkspace:Z

.field public isHistoryItemForHotseat:Z

.field public isNewApp:Z

.field public isShowAppName:Z

.field public isShowCheckbox:Z

.field public itemType:I

.field private mAttributeList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/logger/LauncherAtom$Attribute;",
            ">;"
        }
    .end annotation
.end field

.field private mComponentName:Landroid/content/ComponentName;

.field private mExtendedContainers:Lcom/android/launcher3/logger/d;

.field public minSpanX:I

.field public minSpanY:I

.field public pinyinFull:Ljava/lang/String;

.field public pinyinHeader:Ljava/lang/String;

.field public rank:I

.field public screenId:I

.field private shortcutAddFromOtherApp:Z

.field public spanX:I

.field public spanY:I

.field public title:Ljava/lang/CharSequence;

.field public user:Landroid/os/UserHandle;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "nav_bar_kids_mode"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/android/launcher3/model/data/y;->NAV_BAR_KIDS_MODE:Landroid/net/Uri;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/android/launcher3/model/data/y;->id:I

    const/4 v1, 0x0

    .line 3
    iput v1, p0, Lcom/android/launcher3/model/data/y;->animationType:I

    .line 4
    iput v0, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 5
    iput v0, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 6
    iput v0, p0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 7
    iput v0, p0, Lcom/android/launcher3/model/data/y;->cellY:I

    const/4 v0, 0x1

    .line 8
    iput v0, p0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 9
    iput v0, p0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 10
    iput v0, p0, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 11
    iput v0, p0, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 12
    iput v1, p0, Lcom/android/launcher3/model/data/y;->rank:I

    .line 13
    invoke-static {}, Lcom/android/launcher3/logger/d;->c()Lcom/android/launcher3/logger/d;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher3/model/data/y;->mExtendedContainers:Lcom/android/launcher3/logger/d;

    .line 14
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object v0, p0, Lcom/android/launcher3/model/data/y;->mAttributeList:Ljava/util/List;

    .line 15
    iput-boolean v1, p0, Lcom/android/launcher3/model/data/y;->isShowCheckbox:Z

    .line 16
    iput-boolean v1, p0, Lcom/android/launcher3/model/data/y;->isChecked:Z

    .line 17
    iput-boolean v1, p0, Lcom/android/launcher3/model/data/y;->isShowAppName:Z

    .line 18
    iput-boolean v1, p0, Lcom/android/launcher3/model/data/y;->isNewApp:Z

    .line 19
    iput-boolean v1, p0, Lcom/android/launcher3/model/data/y;->isHistoryItemForHotseat:Z

    .line 20
    iput-boolean v1, p0, Lcom/android/launcher3/model/data/y;->isCollisionInWorkspace:Z

    .line 21
    iput-boolean v1, p0, Lcom/android/launcher3/model/data/y;->isAppLimited:Z

    .line 22
    iput-boolean v1, p0, Lcom/android/launcher3/model/data/y;->isAppVdmcLimited:Z

    .line 23
    iput-boolean v1, p0, Lcom/android/launcher3/model/data/y;->shortcutAddFromOtherApp:Z

    .line 24
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    return-void
.end method

.method protected constructor <init>(Lcom/android/launcher3/model/data/y;)V
    .locals 2

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 26
    iput v0, p0, Lcom/android/launcher3/model/data/y;->id:I

    const/4 v1, 0x0

    .line 27
    iput v1, p0, Lcom/android/launcher3/model/data/y;->animationType:I

    .line 28
    iput v0, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 29
    iput v0, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 30
    iput v0, p0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 31
    iput v0, p0, Lcom/android/launcher3/model/data/y;->cellY:I

    const/4 v0, 0x1

    .line 32
    iput v0, p0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 33
    iput v0, p0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 34
    iput v0, p0, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 35
    iput v0, p0, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 36
    iput v1, p0, Lcom/android/launcher3/model/data/y;->rank:I

    .line 37
    invoke-static {}, Lcom/android/launcher3/logger/d;->c()Lcom/android/launcher3/logger/d;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher3/model/data/y;->mExtendedContainers:Lcom/android/launcher3/logger/d;

    .line 38
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object v0, p0, Lcom/android/launcher3/model/data/y;->mAttributeList:Ljava/util/List;

    .line 39
    iput-boolean v1, p0, Lcom/android/launcher3/model/data/y;->isShowCheckbox:Z

    .line 40
    iput-boolean v1, p0, Lcom/android/launcher3/model/data/y;->isChecked:Z

    .line 41
    iput-boolean v1, p0, Lcom/android/launcher3/model/data/y;->isShowAppName:Z

    .line 42
    iput-boolean v1, p0, Lcom/android/launcher3/model/data/y;->isNewApp:Z

    .line 43
    iput-boolean v1, p0, Lcom/android/launcher3/model/data/y;->isHistoryItemForHotseat:Z

    .line 44
    iput-boolean v1, p0, Lcom/android/launcher3/model/data/y;->isCollisionInWorkspace:Z

    .line 45
    iput-boolean v1, p0, Lcom/android/launcher3/model/data/y;->isAppLimited:Z

    .line 46
    iput-boolean v1, p0, Lcom/android/launcher3/model/data/y;->isAppVdmcLimited:Z

    .line 47
    iput-boolean v1, p0, Lcom/android/launcher3/model/data/y;->shortcutAddFromOtherApp:Z

    .line 48
    invoke-virtual {p0, p1}, Lcom/android/launcher3/model/data/y;->copyFrom(Lcom/android/launcher3/model/data/y;)V

    return-void
.end method

.method public static createNewItemInfoForGroupOtherWidget(ILcom/android/launcher3/widget/U;)Lcom/android/launcher3/model/data/y;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/model/data/y;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p0, v0, Lcom/android/launcher3/model/data/y;->id:I

    .line 7
    .line 8
    const/4 p0, 0x4

    .line 9
    iput p0, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 10
    .line 11
    const/16 p0, -0x83

    .line 12
    .line 13
    iput p0, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 14
    .line 15
    iget-object p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 16
    .line 17
    iput-object p0, v0, Lcom/android/launcher3/model/data/y;->mComponentName:Landroid/content/ComponentName;

    .line 18
    .line 19
    iget-object p0, p1, Lcom/android/launcher3/widget/U;->v:Ljava/lang/String;

    .line 20
    .line 21
    iput-object p0, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 22
    .line 23
    return-object v0
.end method

.method public static synthetic e(Lcom/android/launcher3/model/data/y;Landroid/content/ComponentName;)Lcom/android/launcher3/logger/LauncherAtom$Shortcut$Builder;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/model/data/y;->lambda$buildProto$2(Landroid/content/ComponentName;)Lcom/android/launcher3/logger/LauncherAtom$Shortcut$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic g(Landroid/content/Intent;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "shortcut_id"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private getUserType(Lcom/android/launcher3/util/N2;)I
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/util/N2;->c()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_1
    invoke-virtual {p1}, Lcom/android/launcher3/util/N2;->d()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    const/4 p0, 0x4

    .line 20
    return p0

    .line 21
    :cond_2
    invoke-virtual {p1}, Lcom/android/launcher3/util/N2;->e()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_3

    .line 26
    .line 27
    const/4 p0, 0x2

    .line 28
    return p0

    .line 29
    :cond_3
    invoke-virtual {p1}, Lcom/android/launcher3/util/N2;->b()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_4

    .line 34
    .line 35
    const/4 p0, 0x3

    .line 36
    :cond_4
    return p0
.end method

.method public static synthetic j(Lcom/android/launcher3/model/data/y;Landroid/content/ComponentName;)Lcom/android/launcher3/logger/LauncherAtom$Task$Builder;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/model/data/y;->lambda$buildProto$4(Landroid/content/ComponentName;)Lcom/android/launcher3/logger/LauncherAtom$Task$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private synthetic lambda$buildProto$2(Landroid/content/ComponentName;)Lcom/android/launcher3/logger/LauncherAtom$Shortcut$Builder;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$Shortcut;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$Shortcut$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$Shortcut$Builder;->setShortcutName(Ljava/lang/String;)Lcom/android/launcher3/logger/LauncherAtom$Shortcut$Builder;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v0, Lcom/android/launcher3/model/data/r;

    .line 22
    .line 23
    invoke-direct {v0}, Lcom/android/launcher3/model/data/r;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ljava/util/Optional;->map(Ljava/util/function/Function;)Ljava/util/Optional;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    new-instance v0, Lcom/android/launcher3/model/data/s;

    .line 34
    .line 35
    invoke-direct {v0, p1}, Lcom/android/launcher3/model/data/s;-><init>(Lcom/android/launcher3/logger/LauncherAtom$Shortcut$Builder;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 39
    .line 40
    .line 41
    return-object p1
.end method

.method private synthetic lambda$buildProto$4(Landroid/content/ComponentName;)Lcom/android/launcher3/logger/LauncherAtom$Task$Builder;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$Task;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$Task$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$Task$Builder;->setComponentName(Ljava/lang/String;)Lcom/android/launcher3/logger/LauncherAtom$Task$Builder;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget p0, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Lcom/android/launcher3/logger/LauncherAtom$Task$Builder;->setIndex(I)Lcom/android/launcher3/logger/LauncherAtom$Task$Builder;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic t(Landroid/content/ComponentName;)Lcom/android/launcher3/logger/LauncherAtom$Application$Builder;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$Application;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$Application$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/logger/LauncherAtom$Application$Builder;->setComponentName(Ljava/lang/String;)Lcom/android/launcher3/logger/LauncherAtom$Application$Builder;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Lcom/android/launcher3/logger/LauncherAtom$Application$Builder;->setPackageName(Ljava/lang/String;)Lcom/android/launcher3/logger/LauncherAtom$Application$Builder;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static synthetic u(Landroid/content/ComponentName;)Lcom/android/launcher3/logger/LauncherAtom$Widget$Builder;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$Widget;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$Widget$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/logger/LauncherAtom$Widget$Builder;->setComponentName(Ljava/lang/String;)Lcom/android/launcher3/logger/LauncherAtom$Widget$Builder;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Lcom/android/launcher3/logger/LauncherAtom$Widget$Builder;->setPackageName(Ljava/lang/String;)Lcom/android/launcher3/logger/LauncherAtom$Widget$Builder;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method


# virtual methods
.method public addLogAttributes(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/logger/LauncherAtom$Attribute;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/model/data/y;->mAttributeList:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/launcher3/model/data/y;->mAttributeList:Ljava/util/List;

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->mAttributeList:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public buildProto(Landroid/content/Context;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/model/data/y;->buildProto(Lcom/android/launcher3/model/data/m;Landroid/content/Context;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    move-result-object p0

    return-object p0
.end method

.method public buildProto(Lcom/android/launcher3/model/data/m;Landroid/content/Context;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;
    .locals 3

    .line 2
    invoke-virtual {p0, p2}, Lcom/android/launcher3/model/data/y;->getDefaultItemInfoBuilder(Landroid/content/Context;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    move-result-object p2

    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    move-result-object v0

    .line 4
    iget v1, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    if-eqz v1, :cond_3

    const/4 v2, 0x4

    if-eq v1, v2, :cond_2

    const/4 v2, 0x6

    if-eq v1, v2, :cond_1

    const/4 v2, 0x7

    if-eq v1, v2, :cond_0

    goto :goto_0

    .line 5
    :cond_0
    new-instance v1, Lcom/android/launcher3/model/data/w;

    invoke-direct {v1, p0}, Lcom/android/launcher3/model/data/w;-><init>(Lcom/android/launcher3/model/data/y;)V

    .line 6
    invoke-virtual {v0, v1}, Ljava/util/Optional;->map(Ljava/util/function/Function;)Ljava/util/Optional;

    move-result-object v0

    .line 7
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$Task;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$Task$Builder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$Task$Builder;

    .line 8
    invoke-virtual {p2, v0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setTask(Lcom/android/launcher3/logger/LauncherAtom$Task$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    goto :goto_0

    .line 9
    :cond_1
    new-instance v1, Lcom/android/launcher3/model/data/u;

    invoke-direct {v1, p0}, Lcom/android/launcher3/model/data/u;-><init>(Lcom/android/launcher3/model/data/y;)V

    .line 10
    invoke-virtual {v0, v1}, Ljava/util/Optional;->map(Ljava/util/function/Function;)Ljava/util/Optional;

    move-result-object v0

    .line 11
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$Shortcut;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$Shortcut$Builder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$Shortcut$Builder;

    .line 12
    invoke-virtual {p2, v0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setShortcut(Lcom/android/launcher3/logger/LauncherAtom$Shortcut$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    goto :goto_0

    .line 13
    :cond_2
    new-instance v1, Lcom/android/launcher3/model/data/v;

    invoke-direct {v1}, Lcom/android/launcher3/model/data/v;-><init>()V

    .line 14
    invoke-virtual {v0, v1}, Ljava/util/Optional;->map(Ljava/util/function/Function;)Ljava/util/Optional;

    move-result-object v0

    .line 15
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$Widget;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$Widget$Builder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$Widget$Builder;

    iget v1, p0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/logger/LauncherAtom$Widget$Builder;->setSpanX(I)Lcom/android/launcher3/logger/LauncherAtom$Widget$Builder;

    move-result-object v0

    iget v1, p0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 17
    invoke-virtual {v0, v1}, Lcom/android/launcher3/logger/LauncherAtom$Widget$Builder;->setSpanY(I)Lcom/android/launcher3/logger/LauncherAtom$Widget$Builder;

    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setWidget(Lcom/android/launcher3/logger/LauncherAtom$Widget$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    goto :goto_0

    .line 19
    :cond_3
    new-instance v1, Lcom/android/launcher3/model/data/t;

    invoke-direct {v1}, Lcom/android/launcher3/model/data/t;-><init>()V

    .line 20
    invoke-virtual {v0, v1}, Ljava/util/Optional;->map(Ljava/util/function/Function;)Ljava/util/Optional;

    move-result-object v0

    .line 21
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$Application;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$Application$Builder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher3/logger/LauncherAtom$Application$Builder;

    .line 22
    invoke-virtual {p2, v0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setApplication(Lcom/android/launcher3/logger/LauncherAtom$Application$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    :goto_0
    if-eqz p1, :cond_6

    .line 23
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$Builder;

    move-result-object v0

    .line 24
    iget v1, p0, Lcom/android/launcher3/model/data/y;->cellX:I

    invoke-virtual {v0, v1}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$Builder;->setGridX(I)Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$Builder;

    move-result-object v1

    iget v2, p0, Lcom/android/launcher3/model/data/y;->cellY:I

    invoke-virtual {v1, v2}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$Builder;->setGridY(I)Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$Builder;

    move-result-object v1

    iget p0, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    invoke-virtual {v1, p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$Builder;->setPageIndex(I)Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$Builder;

    .line 25
    iget p0, p1, Lcom/android/launcher3/model/data/y;->container:I

    const/16 v1, -0x67

    if-eq p0, v1, :cond_5

    const/16 v1, -0x65

    if-eq p0, v1, :cond_5

    const/16 v1, -0x64

    if-eq p0, v1, :cond_4

    goto :goto_1

    .line 26
    :cond_4
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;

    move-result-object p0

    iget v1, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 27
    invoke-virtual {p0, v1}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;->setPageIndex(I)Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;

    move-result-object p0

    iget v1, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 28
    invoke-virtual {p0, v1}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;->setGridX(I)Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;

    move-result-object p0

    iget p1, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    invoke-virtual {p0, p1}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;->setGridY(I)Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;

    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$Builder;->setWorkspace(Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$Builder;

    goto :goto_1

    .line 30
    :cond_5
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer$Builder;

    move-result-object p0

    iget p1, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 31
    invoke-virtual {p0, p1}, Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer$Builder;->setIndex(I)Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer$Builder;

    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$Builder;->setHotseat(Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$Builder;

    .line 33
    :goto_1
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setFolder(Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    move-result-object p0

    invoke-virtual {p2, p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setContainerInfo(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    goto :goto_2

    .line 34
    :cond_6
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getContainerCase()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    move-result-object p1

    sget-object v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;->CONTAINER_NOT_SET:Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    invoke-virtual {p1, v0}, Ljava/lang/Enum;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7

    .line 36
    invoke-virtual {p2, p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setContainerInfo(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 37
    :cond_7
    :goto_2
    invoke-virtual {p2}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    move-result-object p0

    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    return-object p0
.end method

.method public copyFrom(Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    iget v0, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 2
    .line 3
    iput v0, p0, Lcom/android/launcher3/model/data/y;->id:I

    .line 4
    .line 5
    iget-object v0, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 8
    .line 9
    iget v0, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 10
    .line 11
    iput v0, p0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 12
    .line 13
    iget v0, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 14
    .line 15
    iput v0, p0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 16
    .line 17
    iget v0, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 18
    .line 19
    iput v0, p0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 20
    .line 21
    iget v0, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 22
    .line 23
    iput v0, p0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 24
    .line 25
    iget v0, p1, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 26
    .line 27
    iput v0, p0, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 28
    .line 29
    iget v0, p1, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 30
    .line 31
    iput v0, p0, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 32
    .line 33
    iget v0, p1, Lcom/android/launcher3/model/data/y;->rank:I

    .line 34
    .line 35
    iput v0, p0, Lcom/android/launcher3/model/data/y;->rank:I

    .line 36
    .line 37
    iget v0, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 38
    .line 39
    iput v0, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 40
    .line 41
    iget v0, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 42
    .line 43
    iput v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 44
    .line 45
    iget v0, p1, Lcom/android/launcher3/model/data/y;->animationType:I

    .line 46
    .line 47
    iput v0, p0, Lcom/android/launcher3/model/data/y;->animationType:I

    .line 48
    .line 49
    iget v0, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 50
    .line 51
    iput v0, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 52
    .line 53
    iget-object v0, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 54
    .line 55
    iput-object v0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 56
    .line 57
    iget-object v0, p1, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 58
    .line 59
    iput-object v0, p0, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, p0, Lcom/android/launcher3/model/data/y;->mComponentName:Landroid/content/ComponentName;

    .line 66
    .line 67
    return-void
.end method

.method protected dumpProperties()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "id="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget v1, p0, Lcom/android/launcher3/model/data/y;->id:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, " type="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget v1, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 22
    .line 23
    invoke-static {v1}, Lcom/android/launcher3/S3;->h(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, " container="

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget v1, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v1, " targetComponent="

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v1, " screen="

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget v1, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v1, " cell("

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    iget v1, p0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v1, ","

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget v2, p0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 78
    .line 79
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v2, ") span("

    .line 83
    .line 84
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    iget v2, p0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 88
    .line 89
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    iget v2, p0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 96
    .line 97
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string v2, ") minSpan("

    .line 101
    .line 102
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    iget v2, p0, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 106
    .line 107
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    iget v1, p0, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string v1, ") rank="

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    iget v1, p0, Lcom/android/launcher3/model/data/y;->rank:I

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    const-string v1, " user="

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    iget-object v1, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    const-string v1, " title="

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 144
    .line 145
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    return-object p0
.end method

.method public final getComponentKey()Lcom/android/launcher3/util/E;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    new-instance v1, Lcom/android/launcher3/util/E;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 12
    .line 13
    invoke-direct {v1, v0, p0}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 14
    .line 15
    .line 16
    return-object v1
.end method

.method public getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 2
    .line 3
    const/16 v1, -0x82

    .line 4
    .line 5
    if-eq v0, v1, :cond_2

    .line 6
    .line 7
    const/16 v1, -0x72

    .line 8
    .line 9
    if-eq v0, v1, :cond_1

    .line 10
    .line 11
    packed-switch v0, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    packed-switch v0, :pswitch_data_1

    .line 15
    .line 16
    .line 17
    const/16 v1, -0xc8

    .line 18
    .line 19
    if-gt v0, v1, :cond_0

    .line 20
    .line 21
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->mExtendedContainers:Lcom/android/launcher3/logger/d;

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setExtendedContainers(Lcom/android/launcher3/logger/d;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_0
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getDefaultInstance()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :pswitch_0
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iget v2, p0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;->setGridX(I)Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iget v2, p0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 58
    .line 59
    invoke-virtual {v1, v2}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;->setGridY(I)Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iget p0, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 64
    .line 65
    invoke-virtual {v1, p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;->setPageIndex(I)Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v0, p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setWorkspace(Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 78
    .line 79
    return-object p0

    .line 80
    :pswitch_1
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;->getDefaultInstance()Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {p0, v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setPredictionContainer(Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 97
    .line 98
    return-object p0

    .line 99
    :pswitch_2
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer$Builder;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    iget p0, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 108
    .line 109
    invoke-virtual {v1, p0}, Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer$Builder;->setIndex(I)Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer$Builder;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {v0, p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setPredictedHotseatContainer(Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 122
    .line 123
    return-object p0

    .line 124
    :pswitch_3
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer;->getDefaultInstance()Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {p0, v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setAllAppsContainer(Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 141
    .line 142
    return-object p0

    .line 143
    :pswitch_4
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$WidgetsContainer;->getDefaultInstance()Lcom/android/launcher3/logger/LauncherAtom$WidgetsContainer;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-virtual {p0, v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setWidgetsContainer(Lcom/android/launcher3/logger/LauncherAtom$WidgetsContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 160
    .line 161
    return-object p0

    .line 162
    :pswitch_5
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ShortcutsContainer;->getDefaultInstance()Lcom/android/launcher3/logger/LauncherAtom$ShortcutsContainer;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-virtual {p0, v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setShortcutsContainer(Lcom/android/launcher3/logger/LauncherAtom$ShortcutsContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 179
    .line 180
    return-object p0

    .line 181
    :pswitch_6
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$SettingsContainer;->getDefaultInstance()Lcom/android/launcher3/logger/LauncherAtom$SettingsContainer;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-virtual {p0, v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setSettingsContainer(Lcom/android/launcher3/logger/LauncherAtom$SettingsContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 198
    .line 199
    return-object p0

    .line 200
    :pswitch_7
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer;->getDefaultInstance()Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-virtual {p0, v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setTaskSwitcherContainer(Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 217
    .line 218
    return-object p0

    .line 219
    :cond_1
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$WallpapersContainer;->getDefaultInstance()Lcom/android/launcher3/logger/LauncherAtom$WallpapersContainer;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-virtual {p0, v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setWallpapersContainer(Lcom/android/launcher3/logger/LauncherAtom$WallpapersContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 236
    .line 237
    return-object p0

    .line 238
    :cond_2
    :pswitch_8
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer$Builder;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    iget p0, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 247
    .line 248
    invoke-virtual {v1, p0}, Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer$Builder;->setIndex(I)Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer$Builder;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    invoke-virtual {v0, p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setHotseat(Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 253
    .line 254
    .line 255
    move-result-object p0

    .line 256
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 261
    .line 262
    return-object p0

    .line 263
    :pswitch_data_0
    .packed-switch -0x6d
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch

    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    .line 272
    .line 273
    :pswitch_data_1
    .packed-switch -0x69
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_8
        :pswitch_0
    .end packed-switch
.end method

.method protected getDefaultItemInfoBuilder(Landroid/content/Context;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;
    .locals 4

    .line 1
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/android/launcher3/util/p2;->n:Lcom/android/launcher3/util/I;

    .line 6
    .line 7
    invoke-virtual {v1, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lcom/android/launcher3/util/p2;

    .line 12
    .line 13
    sget-object v2, Lcom/android/launcher3/model/data/y;->NAV_BAR_KIDS_MODE:Landroid/net/Uri;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-virtual {v1, v2, v3}, Lcom/android/launcher3/util/p2;->g(Landroid/net/Uri;I)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setIsKidsMode(Z)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 21
    .line 22
    .line 23
    sget-object v1, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 24
    .line 25
    invoke-virtual {v1, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, LD1/t;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 32
    .line 33
    invoke-virtual {p1, v1}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-direct {p0, p1}, Lcom/android/launcher3/model/data/y;->getUserType(Lcom/android/launcher3/util/N2;)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-virtual {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setUserType(I)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 42
    .line 43
    .line 44
    iget p1, p0, Lcom/android/launcher3/model/data/y;->rank:I

    .line 45
    .line 46
    invoke-virtual {v0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setRank(I)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->mAttributeList:Ljava/util/List;

    .line 50
    .line 51
    invoke-virtual {v0, p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->addAllItemAttributes(Ljava/lang/Iterable;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 52
    .line 53
    .line 54
    return-object v0
.end method

.method public getIntent()Landroid/content/Intent;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getStableId()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getComponentKey()Lcom/android/launcher3/util/E;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getTargetComponent()Landroid/content/ComponentName;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Lcom/android/launcher3/model/data/x;

    .line 10
    .line 11
    invoke-direct {v1}, Lcom/android/launcher3/model/data/x;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/util/Optional;->map(Ljava/util/function/Function;)Ljava/util/Optional;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->mComponentName:Landroid/content/ComponentName;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Landroid/content/ComponentName;

    .line 25
    .line 26
    return-object p0
.end method

.method public getTargetPackage()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method public getViewId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/y;->id:I

    .line 2
    .line 3
    return p0
.end method

.method public isDisabled()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isInHotseat()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 2
    .line 3
    const/16 v0, -0x65

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    const/16 v0, -0x67

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public isPredictedItem()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 2
    .line 3
    const/16 v0, -0x67

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    const/16 v0, -0x66

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public isShortcutAddFromOtherApp()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/model/data/y;->shortcutAddFromOtherApp:Z

    .line 2
    .line 3
    return p0
.end method

.method public makeShallowCopy()Lcom/android/launcher3/model/data/y;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/model/data/y;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lcom/android/launcher3/model/data/y;->copyFrom(Lcom/android/launcher3/model/data/y;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public onAddToDatabase(Lcom/android/launcher3/util/G;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/M6;->d:Lcom/android/launcher3/util/z0;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/z0;->contains(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/android/launcher3/model/data/y;->writeToValues(Lcom/android/launcher3/util/G;)V

    .line 12
    .line 13
    .line 14
    const-string v0, "profileId"

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 17
    .line 18
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/util/G;->e(Ljava/lang/String;Landroid/os/UserHandle;)Lcom/android/launcher3/util/G;

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    .line 23
    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v1, "Screen id should not be extra empty screen: "

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget p0, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    throw p1
.end method

.method public readFromValues(Landroid/content/ContentValues;)V
    .locals 1

    .line 1
    const-string v0, "itemType"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 12
    .line 13
    const-string v0, "container"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 24
    .line 25
    const-string v0, "screen"

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 36
    .line 37
    const-string v0, "cellX"

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iput v0, p0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 48
    .line 49
    const-string v0, "cellY"

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iput v0, p0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 60
    .line 61
    const-string v0, "spanX"

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iput v0, p0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 72
    .line 73
    const-string v0, "spanY"

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    iput v0, p0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 84
    .line 85
    const-string v0, "rank"

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    iput p1, p0, Lcom/android/launcher3/model/data/y;->rank:I

    .line 96
    .line 97
    return-void
.end method

.method public setExtendedContainers(Lcom/android/launcher3/logger/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/model/data/y;->mExtendedContainers:Lcom/android/launcher3/logger/d;

    .line 2
    .line 3
    return-void
.end method

.method public setShortcutAddFromOtherApp(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/model/data/y;->shortcutAddFromOtherApp:Z

    .line 2
    .line 3
    return-void
.end method

.method public shouldUseBackgroundAnimation()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/y;->animationType:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "ItemInfo("

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->dumpProperties()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string p0, ")"

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public writeToValues(Lcom/android/launcher3/util/G;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "itemType"

    .line 8
    .line 9
    invoke-virtual {p1, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget v0, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 14
    .line 15
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "container"

    .line 20
    .line 21
    invoke-virtual {p1, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget v0, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 26
    .line 27
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "screen"

    .line 32
    .line 33
    invoke-virtual {p1, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget v0, p0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 38
    .line 39
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "cellX"

    .line 44
    .line 45
    invoke-virtual {p1, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iget v0, p0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 50
    .line 51
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const-string v1, "cellY"

    .line 56
    .line 57
    invoke-virtual {p1, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget v0, p0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 62
    .line 63
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const-string v1, "spanX"

    .line 68
    .line 69
    invoke-virtual {p1, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iget v0, p0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 74
    .line 75
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const-string v1, "spanY"

    .line 80
    .line 81
    invoke-virtual {p1, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iget p0, p0, Lcom/android/launcher3/model/data/y;->rank:I

    .line 86
    .line 87
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    const-string v0, "rank"

    .line 92
    .line 93
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 94
    .line 95
    .line 96
    return-void
.end method
