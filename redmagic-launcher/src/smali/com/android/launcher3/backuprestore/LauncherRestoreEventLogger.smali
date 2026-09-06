.class public Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;
.super Ljava/lang/Object;
.source "LauncherRestoreEventLogger.kt"

# interfaces
.implements Lcom/android/launcher3/util/V1;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger$a;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger$a;

.field public static final TAG:Ljava/lang/String; = "LauncherRestoreEventLogger"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;->Companion:Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger$a;

    .line 8
    .line 9
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


# virtual methods
.method public logFavoritesItemsRestoreFailed(IILjava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public logFavoritesItemsRestored(II)V
    .locals 0

    .line 1
    return-void
.end method

.method public logLauncherItemsRestoreFailed(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    const-string p0, "dataType"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public logLauncherItemsRestored(Ljava/lang/String;I)V
    .locals 0

    .line 1
    const-string p0, "dataType"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public logSingleFavoritesItemRestoreFailed(ILjava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public logSingleFavoritesItemRestored(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public reportLauncherRestoreResults()V
    .locals 0

    .line 1
    return-void
.end method
