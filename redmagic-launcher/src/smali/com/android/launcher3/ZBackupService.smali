.class public Lcom/android/launcher3/ZBackupService;
.super Landroid/app/Service;
.source "ZBackupService.java"


# static fields
.field private static volatile i:I


# instance fields
.field private g:Landroid/content/Context;

.field private h:Lcom/android/launcher3/J0$a;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/ZBackupService$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/android/launcher3/ZBackupService$a;-><init>(Lcom/android/launcher3/ZBackupService;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/ZBackupService;->h:Lcom/android/launcher3/J0$a;

    .line 10
    .line 11
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/ZBackupService;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/ZBackupService;->g:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b()I
    .locals 1

    .line 1
    sget v0, Lcom/android/launcher3/ZBackupService;->i:I

    .line 2
    .line 3
    return v0
.end method

.method static bridge synthetic c(I)V
    .locals 0

    .line 1
    sput p0, Lcom/android/launcher3/ZBackupService;->i:I

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    .line 1
    const-string p1, "ZBackupService"

    .line 2
    .line 3
    const-string v0, "onBind: ZBackupService"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/ZBackupService;->g:Landroid/content/Context;

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lcom/android/launcher3/ZBackupService;->g:Landroid/content/Context;

    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/ZBackupService;->h:Lcom/android/launcher3/J0$a;

    .line 19
    .line 20
    return-object p0
.end method
