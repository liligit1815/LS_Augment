.class public final Lcom/android/quickstep/LauncherRestoreEventLoggerImpl;
.super Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;
.source "LauncherRestoreEventLoggerImpl.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/LauncherRestoreEventLoggerImpl$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/LauncherRestoreEventLoggerImpl$Companion;

.field private static final DATA_TYPE_APPLICATION:Ljava/lang/String; = "application"

.field private static final DATA_TYPE_APPWIDGET:Ljava/lang/String; = "widget"

.field private static final DATA_TYPE_APP_PAIR:Ljava/lang/String; = "app_pair"

.field private static final DATA_TYPE_CUSTOM_APPWIDGET:Ljava/lang/String; = "custom_widget"

.field private static final DATA_TYPE_DEEP_SHORTCUT:Ljava/lang/String; = "deep_shortcut"

.field private static final DATA_TYPE_FOLDER:Ljava/lang/String; = "folder"

.field private static final DATA_TYPE_LAUNCHER_ITEM:Ljava/lang/String; = "launcher_item"

.field public static final TAG:Ljava/lang/String; = "LauncherRestoreEventLoggerImpl"


# instance fields
.field private final context:Landroid/content/Context;

.field private final restoreEventLogger:Landroid/app/backup/BackupRestoreEventLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/LauncherRestoreEventLoggerImpl$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/LauncherRestoreEventLoggerImpl$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/LauncherRestoreEventLoggerImpl;->Companion:Lcom/android/quickstep/LauncherRestoreEventLoggerImpl$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/LauncherRestoreEventLoggerImpl;->context:Landroid/content/Context;

    .line 10
    .line 11
    new-instance v0, Landroid/app/backup/BackupManager;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Landroid/app/backup/BackupManager;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/app/backup/BackupManager;->getDelayedRestoreLogger()Landroid/app/backup/BackupRestoreEventLogger;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string v0, "getDelayedRestoreLogger(...)"

    .line 21
    .line 22
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lcom/android/quickstep/LauncherRestoreEventLoggerImpl;->restoreEventLogger:Landroid/app/backup/BackupRestoreEventLogger;

    .line 26
    .line 27
    return-void
.end method

.method private final favoritesIdToDataType(I)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    const/4 p0, 0x2

    .line 4
    if-eq p1, p0, :cond_4

    .line 5
    .line 6
    const/16 p0, 0xa

    .line 7
    .line 8
    if-eq p1, p0, :cond_3

    .line 9
    .line 10
    const/4 p0, 0x4

    .line 11
    if-eq p1, p0, :cond_2

    .line 12
    .line 13
    const/4 p0, 0x5

    .line 14
    if-eq p1, p0, :cond_1

    .line 15
    .line 16
    const/4 p0, 0x6

    .line 17
    if-eq p1, p0, :cond_0

    .line 18
    .line 19
    const-string p0, "launcher_item"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const-string p0, "deep_shortcut"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    const-string p0, "custom_widget"

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    const-string p0, "widget"

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_3
    const-string p0, "app_pair"

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_4
    const-string p0, "folder"

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_5
    const-string p0, "application"

    .line 38
    .line 39
    return-object p0
.end method

.method public static synthetic getRestoreEventLogger$annotations()V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final getContext()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherRestoreEventLoggerImpl;->context:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getRestoreEventLogger()Landroid/app/backup/BackupRestoreEventLogger;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherRestoreEventLoggerImpl;->restoreEventLogger:Landroid/app/backup/BackupRestoreEventLogger;

    .line 2
    .line 3
    return-object p0
.end method

.method public logFavoritesItemsRestoreFailed(IILjava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->D()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/LauncherRestoreEventLoggerImpl;->restoreEventLogger:Landroid/app/backup/BackupRestoreEventLogger;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/android/quickstep/LauncherRestoreEventLoggerImpl;->favoritesIdToDataType(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0, p2, p3}, Landroid/app/backup/BackupRestoreEventLogger;->logItemsRestoreFailed(Ljava/lang/String;ILjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public logFavoritesItemsRestored(II)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->D()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/LauncherRestoreEventLoggerImpl;->restoreEventLogger:Landroid/app/backup/BackupRestoreEventLogger;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/android/quickstep/LauncherRestoreEventLoggerImpl;->favoritesIdToDataType(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0, p2}, Landroid/app/backup/BackupRestoreEventLogger;->logItemsRestored(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public logLauncherItemsRestoreFailed(Ljava/lang/String;ILjava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "dataType"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/y0;->D()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/quickstep/LauncherRestoreEventLoggerImpl;->restoreEventLogger:Landroid/app/backup/BackupRestoreEventLogger;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2, p3}, Landroid/app/backup/BackupRestoreEventLogger;->logItemsRestoreFailed(Ljava/lang/String;ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public logLauncherItemsRestored(Ljava/lang/String;I)V
    .locals 1

    .line 1
    const-string v0, "dataType"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/y0;->D()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/quickstep/LauncherRestoreEventLoggerImpl;->restoreEventLogger:Landroid/app/backup/BackupRestoreEventLogger;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Landroid/app/backup/BackupRestoreEventLogger;->logItemsRestored(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public logSingleFavoritesItemRestoreFailed(ILjava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->D()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/LauncherRestoreEventLoggerImpl;->restoreEventLogger:Landroid/app/backup/BackupRestoreEventLogger;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/android/quickstep/LauncherRestoreEventLoggerImpl;->favoritesIdToDataType(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 p1, 0x1

    .line 14
    invoke-virtual {v0, p0, p1, p2}, Landroid/app/backup/BackupRestoreEventLogger;->logItemsRestoreFailed(Ljava/lang/String;ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public logSingleFavoritesItemRestored(I)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->D()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/LauncherRestoreEventLoggerImpl;->restoreEventLogger:Landroid/app/backup/BackupRestoreEventLogger;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/android/quickstep/LauncherRestoreEventLoggerImpl;->favoritesIdToDataType(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 p1, 0x1

    .line 14
    invoke-virtual {v0, p0, p1}, Landroid/app/backup/BackupRestoreEventLogger;->logItemsRestored(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public reportLauncherRestoreResults()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->D()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Landroid/app/backup/BackupManager;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/quickstep/LauncherRestoreEventLoggerImpl;->context:Landroid/content/Context;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Landroid/app/backup/BackupManager;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/quickstep/LauncherRestoreEventLoggerImpl;->restoreEventLogger:Landroid/app/backup/BackupRestoreEventLogger;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Landroid/app/backup/BackupManager;->reportDelayedRestoreResult(Landroid/app/backup/BackupRestoreEventLogger;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
