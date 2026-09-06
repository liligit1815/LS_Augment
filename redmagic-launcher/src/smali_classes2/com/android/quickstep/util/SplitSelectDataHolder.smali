.class public final Lcom/android/quickstep/util/SplitSelectDataHolder;
.super Ljava/lang/Object;
.source "SplitSelectDataHolder.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/SplitSelectDataHolder$Companion;,
        Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/util/SplitSelectDataHolder$Companion;

.field public static final SPLIT_PENDINGINTENT_PENDINGINTENT:I = 0x5

.field public static final SPLIT_PENDINGINTENT_TASK:I = 0x3

.field public static final SPLIT_SHORTCUT_TASK:I = 0x4

.field public static final SPLIT_SINGLE_INTENT_FULLSCREEN:I = 0x7

.field public static final SPLIT_SINGLE_SHORTCUT_FULLSCREEN:I = 0x8

.field public static final SPLIT_SINGLE_TASK_FULLSCREEN:I = 0x6

.field public static final SPLIT_TASK_PENDINGINTENT:I = 0x1

.field public static final SPLIT_TASK_SHORTCUT:I = 0x2

.field public static final SPLIT_TASK_TASK:I


# instance fields
.field private final TAG:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private initialIntent:Landroid/content/Intent;

.field private initialPendingIntent:Landroid/app/PendingIntent;

.field private initialShortcut:Landroid/content/pm/ShortcutInfo;

.field private initialStagePosition:I

.field private initialTaskId:I

.field private initialUser:Landroid/os/UserHandle;

.field private itemInfo:Lcom/android/launcher3/model/data/y;

.field private secondIntent:Landroid/content/Intent;

.field private secondItemInfo:Lcom/android/launcher3/model/data/y;

.field private secondPendingIntent:Landroid/app/PendingIntent;

.field private secondShortcut:Landroid/content/pm/ShortcutInfo;

.field private secondTaskId:I

.field private secondUser:Landroid/os/UserHandle;

.field private splitEvent:Lcom/android/launcher3/logging/StatsLogManager$d;

.field private widgetSecondIntent:Landroid/content/Intent;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/SplitSelectDataHolder$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/SplitSelectDataHolder$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/util/SplitSelectDataHolder;->Companion:Lcom/android/quickstep/util/SplitSelectDataHolder$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->context:Landroid/content/Context;

    .line 5
    .line 6
    const-class p1, Lcom/android/quickstep/util/SplitSelectDataHolder;

    .line 7
    .line 8
    invoke-static {p1}, Lkotlin/jvm/internal/D;->b(Ljava/lang/Class;)LB4/c;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1}, LB4/c;->d()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->TAG:Ljava/lang/String;

    .line 17
    .line 18
    const/4 p1, -0x1

    .line 19
    iput p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialStagePosition:I

    .line 20
    .line 21
    iput p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialTaskId:I

    .line 22
    .line 23
    iput p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondTaskId:I

    .line 24
    .line 25
    return-void
.end method

.method private final convertIntentsToFinalTypes()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialIntent:Landroid/content/Intent;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialUser:Landroid/os/UserHandle;

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/android/quickstep/util/SplitSelectDataHolder;->getShortcutInfo(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/ShortcutInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialShortcut:Landroid/content/pm/ShortcutInfo;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialIntent:Landroid/content/Intent;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialUser:Landroid/os/UserHandle;

    .line 14
    .line 15
    invoke-direct {p0, v0, v1}, Lcom/android/quickstep/util/SplitSelectDataHolder;->getPendingIntent(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/app/PendingIntent;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialPendingIntent:Landroid/app/PendingIntent;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialIntent:Landroid/content/Intent;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondIntent:Landroid/content/Intent;

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    iget-object v2, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondPendingIntent:Landroid/app/PendingIntent;

    .line 29
    .line 30
    if-nez v2, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 34
    .line 35
    const-string v0, "Both secondIntent and secondPendingIntent non-null"

    .line 36
    .line 37
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    throw p0

    .line 41
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondPendingIntent:Landroid/app/PendingIntent;

    .line 42
    .line 43
    if-eqz v2, :cond_2

    .line 44
    .line 45
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondIntent:Landroid/content/Intent;

    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    iget-object v2, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondUser:Landroid/os/UserHandle;

    .line 49
    .line 50
    invoke-direct {p0, v1, v2}, Lcom/android/quickstep/util/SplitSelectDataHolder;->getShortcutInfo(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/ShortcutInfo;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondShortcut:Landroid/content/pm/ShortcutInfo;

    .line 55
    .line 56
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondIntent:Landroid/content/Intent;

    .line 57
    .line 58
    iget-object v2, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondUser:Landroid/os/UserHandle;

    .line 59
    .line 60
    invoke-direct {p0, v1, v2}, Lcom/android/quickstep/util/SplitSelectDataHolder;->getPendingIntent(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/app/PendingIntent;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iput-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondPendingIntent:Landroid/app/PendingIntent;

    .line 65
    .line 66
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondIntent:Landroid/content/Intent;

    .line 67
    .line 68
    return-void
.end method

.method private final generateSplitLaunchData(I)Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;
    .locals 14

    .line 1
    new-instance v0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;

    .line 2
    .line 3
    iget v2, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialTaskId:I

    .line 4
    .line 5
    iget v3, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondTaskId:I

    .line 6
    .line 7
    iget-object v4, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialPendingIntent:Landroid/app/PendingIntent;

    .line 8
    .line 9
    iget-object v5, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondPendingIntent:Landroid/app/PendingIntent;

    .line 10
    .line 11
    iget-object v6, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->widgetSecondIntent:Landroid/content/Intent;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialUser:Landroid/os/UserHandle;

    .line 14
    .line 15
    const/4 v7, -0x1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v1}, Landroid/os/UserHandle;->getIdentifier()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move v1, v7

    .line 24
    :goto_0
    iget-object v8, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondUser:Landroid/os/UserHandle;

    .line 25
    .line 26
    if-eqz v8, :cond_1

    .line 27
    .line 28
    invoke-virtual {v8}, Landroid/os/UserHandle;->getIdentifier()I

    .line 29
    .line 30
    .line 31
    move-result v7

    .line 32
    :cond_1
    move v8, v7

    .line 33
    iget-object v9, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialShortcut:Landroid/content/pm/ShortcutInfo;

    .line 34
    .line 35
    iget-object v10, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondShortcut:Landroid/content/pm/ShortcutInfo;

    .line 36
    .line 37
    iget-object v11, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->itemInfo:Lcom/android/launcher3/model/data/y;

    .line 38
    .line 39
    iget-object v12, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->splitEvent:Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 40
    .line 41
    iget v13, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialStagePosition:I

    .line 42
    .line 43
    move v7, v1

    .line 44
    move v1, p1

    .line 45
    invoke-direct/range {v0 .. v13}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;-><init>(IIILandroid/app/PendingIntent;Landroid/app/PendingIntent;Landroid/content/Intent;IILandroid/content/pm/ShortcutInfo;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/StatsLogManager$d;I)V

    .line 46
    .line 47
    .line 48
    return-object v0
.end method

.method private final getFullscreenLaunchType()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialTaskId:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x6

    .line 7
    return p0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialShortcut:Landroid/content/pm/ShortcutInfo;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    const/16 p0, 0x8

    .line 13
    .line 14
    return p0

    .line 15
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialPendingIntent:Landroid/app/PendingIntent;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    const/4 p0, 0x7

    .line 20
    return p0

    .line 21
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 22
    .line 23
    const-string v0, "Unidentified fullscreen launch type"

    .line 24
    .line 25
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    throw p0
.end method

.method private static synthetic getInitialStagePosition$annotations()V
    .locals 0

    .line 1
    return-void
.end method

.method private final getPendingIntent(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/app/PendingIntent;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialIntent:Landroid/content/Intent;

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondIntent:Landroid/content/Intent;

    .line 10
    .line 11
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 19
    .line 20
    const-string p1, "Invalid intent to convert to PendingIntent"

    .line 21
    .line 22
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    throw p0

    .line 26
    :cond_1
    :goto_0
    invoke-static {}, Lx1/O;->r2()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const/high16 v0, 0xb000000

    .line 33
    .line 34
    :goto_1
    move v4, v0

    .line 35
    goto :goto_2

    .line 36
    :cond_2
    const/high16 v0, 0x3000000

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :goto_2
    if-nez p1, :cond_3

    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return-object p0

    .line 43
    :cond_3
    if-eqz p2, :cond_4

    .line 44
    .line 45
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->context:Landroid/content/Context;

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    const/4 v5, 0x0

    .line 49
    move-object v3, p1

    .line 50
    move-object v6, p2

    .line 51
    invoke-static/range {v1 .. v6}, Landroid/app/PendingIntent;->getActivityAsUser(Landroid/content/Context;ILandroid/content/Intent;ILandroid/os/Bundle;Landroid/os/UserHandle;)Landroid/app/PendingIntent;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0

    .line 56
    :cond_4
    move-object v3, p1

    .line 57
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->context:Landroid/content/Context;

    .line 58
    .line 59
    const/4 p1, 0x0

    .line 60
    invoke-static {p0, p1, v3, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0
.end method

.method private final getShortcutInfo(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/ShortcutInfo;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    const-string v2, "shortcut_id"

    .line 12
    .line 13
    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    if-nez v2, :cond_1

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_1
    const/4 v3, 0x0

    .line 21
    if-eqz p2, :cond_2

    .line 22
    .line 23
    :try_start_0
    iget-object v4, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->context:Landroid/content/Context;

    .line 24
    .line 25
    invoke-static {v4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v4, v1, v3, p2}, Landroid/content/Context;->createPackageContextAsUser(Ljava/lang/String;ILandroid/os/UserHandle;)Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    iget-object p2, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->context:Landroid/content/Context;

    .line 37
    .line 38
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2, v1, v3}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    :goto_0
    new-instance v1, Landroid/content/pm/ShortcutInfo$Builder;

    .line 49
    .line 50
    invoke-direct {v1, p2, v2}, Landroid/content/pm/ShortcutInfo$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1}, Landroid/content/pm/ShortcutInfo$Builder;->build()Landroid/content/pm/ShortcutInfo;

    .line 54
    .line 55
    .line 56
    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    return-object p0

    .line 58
    :catch_0
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->TAG:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p1}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    new-instance p2, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    const-string v1, "Failed to create a ShortcutInfo for "

    .line 70
    .line 71
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    :cond_3
    :goto_1
    return-object v0
.end method

.method private final isInitialTaskIntentSet()Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialTaskId:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialIntent:Landroid/content/Intent;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialPendingIntent:Landroid/app/PendingIntent;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 18
    return p0
.end method

.method private final isSecondTaskIntentSet()Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondTaskId:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondIntent:Landroid/content/Intent;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondPendingIntent:Landroid/app/PendingIntent;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 18
    return p0
.end method

.method private final setInitialData(ILcom/android/launcher3/logging/StatsLogManager$d;Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    iput-object p3, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->itemInfo:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    iput p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialStagePosition:I

    .line 4
    .line 5
    iput-object p2, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->splitEvent:Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final dump(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 3

    .line 1
    const-string v0, "prefix"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "writer"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, " SplitSelectDataHolder"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialStagePosition:I

    .line 32
    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v2, "\tinitialStagePosition= "

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialTaskId:I

    .line 57
    .line 58
    new-instance v1, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v2, "\tinitialTaskId= "

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondTaskId:I

    .line 82
    .line 83
    new-instance v1, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v2, "\tsecondTaskId= "

    .line 92
    .line 93
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialUser:Landroid/os/UserHandle;

    .line 107
    .line 108
    new-instance v1, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    const-string v2, "\tinitialUser= "

    .line 117
    .line 118
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondUser:Landroid/os/UserHandle;

    .line 132
    .line 133
    new-instance v1, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string v2, "\tsecondUser= "

    .line 142
    .line 143
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialIntent:Landroid/content/Intent;

    .line 157
    .line 158
    new-instance v1, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    const-string v2, "\tinitialIntent= "

    .line 167
    .line 168
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondIntent:Landroid/content/Intent;

    .line 182
    .line 183
    new-instance v1, Ljava/lang/StringBuilder;

    .line 184
    .line 185
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    const-string v2, "\tsecondIntent= "

    .line 192
    .line 193
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondPendingIntent:Landroid/app/PendingIntent;

    .line 207
    .line 208
    new-instance v1, Ljava/lang/StringBuilder;

    .line 209
    .line 210
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 211
    .line 212
    .line 213
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    const-string v2, "\tsecondPendingIntent= "

    .line 217
    .line 218
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->itemInfo:Lcom/android/launcher3/model/data/y;

    .line 232
    .line 233
    new-instance v1, Ljava/lang/StringBuilder;

    .line 234
    .line 235
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 236
    .line 237
    .line 238
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    const-string v2, "\titemInfo= "

    .line 242
    .line 243
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->splitEvent:Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 257
    .line 258
    new-instance v1, Ljava/lang/StringBuilder;

    .line 259
    .line 260
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    const-string v2, "\tsplitEvent= "

    .line 267
    .line 268
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 269
    .line 270
    .line 271
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 279
    .line 280
    .line 281
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialShortcut:Landroid/content/pm/ShortcutInfo;

    .line 282
    .line 283
    new-instance v1, Ljava/lang/StringBuilder;

    .line 284
    .line 285
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 286
    .line 287
    .line 288
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    const-string v2, "\tinitialShortcut= "

    .line 292
    .line 293
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 294
    .line 295
    .line 296
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondShortcut:Landroid/content/pm/ShortcutInfo;

    .line 307
    .line 308
    new-instance v0, Ljava/lang/StringBuilder;

    .line 309
    .line 310
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 311
    .line 312
    .line 313
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    const-string p1, "\tsecondShortcut= "

    .line 317
    .line 318
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object p0

    .line 328
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 329
    .line 330
    .line 331
    return-void
.end method

.method public final getContext()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->context:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getFullscreenLaunchData()Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->convertIntentsToFinalTypes()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->getFullscreenLaunchType()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-direct {p0, v0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->generateSplitLaunchData(I)Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final getInitialStagePosition()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialStagePosition:I

    .line 2
    .line 3
    return p0
.end method

.method public final getInitialTaskId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialTaskId:I

    .line 2
    .line 3
    return p0
.end method

.method public final getItemInfo()Lcom/android/launcher3/model/data/y;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->itemInfo:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getSecondItemInfo()Lcom/android/launcher3/model/data/y;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondItemInfo:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getSecondTaskId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondTaskId:I

    .line 2
    .line 3
    return p0
.end method

.method public final getSplitEvent()Lcom/android/launcher3/logging/StatsLogManager$d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->splitEvent:Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getSplitLaunchData()Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->convertIntentsToFinalTypes()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->getSplitLaunchType()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialStagePosition:I

    .line 16
    .line 17
    invoke-static {v1}, Lcom/android/launcher3/util/y2;->b(I)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iput v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialStagePosition:I

    .line 22
    .line 23
    :goto_0
    invoke-direct {p0, v0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->generateSplitLaunchData(I)Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final getSplitLaunchType()I
    .locals 2
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialIntent:Landroid/content/Intent;

    .line 2
    .line 3
    if-nez v0, :cond_6

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondIntent:Landroid/content/Intent;

    .line 6
    .line 7
    if-nez v0, :cond_6

    .line 8
    .line 9
    iget v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialTaskId:I

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    if-eq v0, v1, :cond_2

    .line 13
    .line 14
    iget v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondTaskId:I

    .line 15
    .line 16
    if-eq v0, v1, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondShortcut:Landroid/content/pm/ShortcutInfo;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const/4 p0, 0x2

    .line 25
    return p0

    .line 26
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondPendingIntent:Landroid/app/PendingIntent;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_2
    iget v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondTaskId:I

    .line 33
    .line 34
    if-eq v0, v1, :cond_4

    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialShortcut:Landroid/content/pm/ShortcutInfo;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    const/4 p0, 0x4

    .line 41
    return p0

    .line 42
    :cond_3
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialPendingIntent:Landroid/app/PendingIntent;

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    const/4 p0, 0x3

    .line 47
    return p0

    .line 48
    :cond_4
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialPendingIntent:Landroid/app/PendingIntent;

    .line 49
    .line 50
    if-eqz v0, :cond_5

    .line 51
    .line 52
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondPendingIntent:Landroid/app/PendingIntent;

    .line 53
    .line 54
    if-eqz p0, :cond_5

    .line 55
    .line 56
    const/4 p0, 0x5

    .line 57
    return p0

    .line 58
    :cond_5
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 59
    .line 60
    const-string v0, "Unidentified split launch type"

    .line 61
    .line 62
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    throw p0

    .line 66
    :cond_6
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 67
    .line 68
    const-string v0, "Intents need to be converted"

    .line 69
    .line 70
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    throw p0
.end method

.method public final getTAG()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final isBothSplitAppsConfirmed()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->isInitialTaskIntentSet()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->isSecondTaskIntentSet()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final isSplitSelectActive()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->isInitialTaskIntentSet()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->isSecondTaskIntentSet()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final onDestroy()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->context:Landroid/content/Context;

    .line 3
    .line 4
    return-void
.end method

.method public final resetState()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialStagePosition:I

    .line 3
    .line 4
    iput v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialTaskId:I

    .line 5
    .line 6
    iput v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondTaskId:I

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialUser:Landroid/os/UserHandle;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondUser:Landroid/os/UserHandle;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialIntent:Landroid/content/Intent;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondIntent:Landroid/content/Intent;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialPendingIntent:Landroid/app/PendingIntent;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondPendingIntent:Landroid/app/PendingIntent;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->itemInfo:Lcom/android/launcher3/model/data/y;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->splitEvent:Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialShortcut:Landroid/content/pm/ShortcutInfo;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondShortcut:Landroid/content/pm/ShortcutInfo;

    .line 28
    .line 29
    return-void
.end method

.method public final setContext(Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->context:Landroid/content/Context;

    .line 2
    .line 3
    return-void
.end method

.method public final setInitialTaskSelect(Landroid/app/ActivityManager$RunningTaskInfo;ILcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/StatsLogManager$d;)V
    .locals 1

    const-string v0, "info"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    iget p1, p1, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    iput p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialTaskId:I

    .line 6
    invoke-direct {p0, p2, p4, p3}, Lcom/android/quickstep/util/SplitSelectDataHolder;->setInitialData(ILcom/android/launcher3/logging/StatsLogManager$d;Lcom/android/launcher3/model/data/y;)V

    return-void
.end method

.method public final setInitialTaskSelect(Landroid/content/Intent;ILcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/StatsLogManager$d;I)V
    .locals 1

    const/4 v0, -0x1

    if-eq p5, v0, :cond_0

    .line 1
    iput p5, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialTaskId:I

    goto :goto_0

    .line 2
    :cond_0
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialIntent:Landroid/content/Intent;

    .line 3
    invoke-static {p3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    iget-object p1, p3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->initialUser:Landroid/os/UserHandle;

    .line 4
    :goto_0
    invoke-direct {p0, p2, p4, p3}, Lcom/android/quickstep/util/SplitSelectDataHolder;->setInitialData(ILcom/android/launcher3/logging/StatsLogManager$d;Lcom/android/launcher3/model/data/y;)V

    return-void
.end method

.method public final setSecondTask(ILcom/android/launcher3/model/data/y;)V
    .locals 1

    const-string v0, "itemInfo"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondTaskId:I

    .line 2
    iput-object p2, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondItemInfo:Lcom/android/launcher3/model/data/y;

    return-void
.end method

.method public final setSecondTask(Landroid/app/PendingIntent;Lcom/android/launcher3/model/data/y;)V
    .locals 1

    const-string v0, "pendingIntent"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "itemInfo"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondPendingIntent:Landroid/app/PendingIntent;

    .line 7
    invoke-virtual {p1}, Landroid/app/PendingIntent;->getCreatorUserHandle()Landroid/os/UserHandle;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondUser:Landroid/os/UserHandle;

    .line 8
    iput-object p2, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondItemInfo:Lcom/android/launcher3/model/data/y;

    return-void
.end method

.method public final setSecondTask(Landroid/content/Intent;Landroid/os/UserHandle;Lcom/android/launcher3/model/data/y;)V
    .locals 1

    const-string v0, "intent"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "user"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "itemInfo"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondIntent:Landroid/content/Intent;

    .line 4
    iput-object p2, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondUser:Landroid/os/UserHandle;

    .line 5
    iput-object p3, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->secondItemInfo:Lcom/android/launcher3/model/data/y;

    return-void
.end method

.method public final setSecondWidget(Landroid/app/PendingIntent;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    const-string v0, "pendingIntent"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "itemInfo"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, p3}, Lcom/android/quickstep/util/SplitSelectDataHolder;->setSecondTask(Landroid/app/PendingIntent;Lcom/android/launcher3/model/data/y;)V

    .line 12
    .line 13
    .line 14
    iput-object p2, p0, Lcom/android/quickstep/util/SplitSelectDataHolder;->widgetSecondIntent:Landroid/content/Intent;

    .line 15
    .line 16
    return-void
.end method
