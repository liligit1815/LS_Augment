.class public final Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger$a;
.super Ljava/lang/Object;
.source "LauncherRestoreEventLogger.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
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
    invoke-direct {p0}, Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;
    .locals 1

    .line 1
    const-class p0, Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;

    .line 2
    .line 3
    const v0, 0x7f140220

    .line 4
    .line 5
    .line 6
    invoke-static {p0, p1, v0}, Lcom/android/launcher3/util/V1$a;->a(Ljava/lang/Class;Landroid/content/Context;I)Lcom/android/launcher3/util/V1;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string p1, "getObject(...)"

    .line 11
    .line 12
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    check-cast p0, Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;

    .line 16
    .line 17
    return-object p0
.end method
