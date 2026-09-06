.class public Lcom/android/launcher3/ZRecoverService;
.super Landroid/app/Service;
.source "ZRecoverService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/ZRecoverService$b;
    }
.end annotation


# static fields
.field private static j:I


# instance fields
.field g:Ljava/io/FileOutputStream;

.field h:Ljava/io/FileOutputStream;

.field private i:Lcom/android/launcher3/K0$a;


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
    new-instance v0, Lcom/android/launcher3/ZRecoverService$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/android/launcher3/ZRecoverService$a;-><init>(Lcom/android/launcher3/ZRecoverService;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/ZRecoverService;->i:Lcom/android/launcher3/K0$a;

    .line 10
    .line 11
    return-void
.end method

.method static bridge synthetic a()I
    .locals 1

    .line 1
    sget v0, Lcom/android/launcher3/ZRecoverService;->j:I

    .line 2
    .line 3
    return v0
.end method

.method static bridge synthetic b(I)V
    .locals 0

    .line 1
    sput p0, Lcom/android/launcher3/ZRecoverService;->j:I

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    .line 1
    const-string p1, "ZRecoverService"

    .line 2
    .line 3
    const-string v0, "onBind"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/ZRecoverService;->i:Lcom/android/launcher3/K0$a;

    .line 9
    .line 10
    return-object p0
.end method
