.class public final Lcom/android/quickstep/util/DesksUtils;
.super Ljava/lang/Object;
.source "DesksUtils.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/DesksUtils$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/util/DesksUtils$Companion;

.field private static final sysUiPackage:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/DesksUtils$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/DesksUtils$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/util/DesksUtils;->Companion:Lcom/android/quickstep/util/DesksUtils$Companion;

    .line 8
    .line 9
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const v1, 0x104003a

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "getString(...)"

    .line 21
    .line 22
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/android/quickstep/util/DesksUtils;->sysUiPackage:Ljava/lang/String;

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$getSysUiPackage$cp()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/DesksUtils;->sysUiPackage:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final areMultiDesksFlagsEnabled()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/DesksUtils;->Companion:Lcom/android/quickstep/util/DesksUtils$Companion;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/DesksUtils$Companion;->areMultiDesksFlagsEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static final isDesktopWallpaperComponent(Landroid/content/ComponentName;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/DesksUtils;->Companion:Lcom/android/quickstep/util/DesksUtils$Companion;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/quickstep/util/DesksUtils$Companion;->isDesktopWallpaperComponent(Landroid/content/ComponentName;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static final isDesktopWallpaperTask(Landroid/app/TaskInfo;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/DesksUtils;->Companion:Lcom/android/quickstep/util/DesksUtils$Companion;

    invoke-virtual {v0, p0}, Lcom/android/quickstep/util/DesksUtils$Companion;->isDesktopWallpaperTask(Landroid/app/TaskInfo;)Z

    move-result p0

    return p0
.end method

.method public static final isDesktopWallpaperTask(Lcom/android/systemui/shared/recents/model/Task;)Z
    .locals 1

    .line 2
    sget-object v0, Lcom/android/quickstep/util/DesksUtils;->Companion:Lcom/android/quickstep/util/DesksUtils$Companion;

    invoke-virtual {v0, p0}, Lcom/android/quickstep/util/DesksUtils$Companion;->isDesktopWallpaperTask(Lcom/android/systemui/shared/recents/model/Task;)Z

    move-result p0

    return p0
.end method
