.class public Lcom/zte/mifavor/launcher/adapter/compat/WallpaperInterfaceImpl;
.super Lcom/zte/mifavor/launcher/adapter/compat/e;
.source "WallpaperInterfaceImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/mifavor/launcher/adapter/compat/WallpaperInterfaceImpl$Globals;
    }
.end annotation


# static fields
.field private static d:Lcom/zte/mifavor/launcher/adapter/compat/WallpaperInterfaceImpl$Globals;


# instance fields
.field c:Landroid/app/IWallpaperManager;


# direct methods
.method public constructor <init>(Landroid/os/Looper;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/launcher/adapter/compat/e;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/zte/mifavor/launcher/adapter/compat/WallpaperInterfaceImpl;->c:Landroid/app/IWallpaperManager;

    .line 6
    .line 7
    sget-object p0, Lcom/zte/mifavor/launcher/adapter/compat/WallpaperInterfaceImpl;->d:Lcom/zte/mifavor/launcher/adapter/compat/WallpaperInterfaceImpl$Globals;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    new-instance p0, Lcom/zte/mifavor/launcher/adapter/compat/WallpaperInterfaceImpl$Globals;

    .line 12
    .line 13
    invoke-direct {p0, p1}, Lcom/zte/mifavor/launcher/adapter/compat/WallpaperInterfaceImpl$Globals;-><init>(Landroid/os/Looper;)V

    .line 14
    .line 15
    .line 16
    sput-object p0, Lcom/zte/mifavor/launcher/adapter/compat/WallpaperInterfaceImpl;->d:Lcom/zte/mifavor/launcher/adapter/compat/WallpaperInterfaceImpl$Globals;

    .line 17
    .line 18
    :cond_0
    return-void
.end method


# virtual methods
.method public b(Landroid/content/Context;)Landroid/os/ParcelFileDescriptor;
    .locals 1

    .line 1
    :try_start_0
    sget-object p0, Lcom/zte/mifavor/launcher/adapter/compat/WallpaperInterfaceImpl;->d:Lcom/zte/mifavor/launcher/adapter/compat/WallpaperInterfaceImpl$Globals;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/launcher/adapter/compat/WallpaperInterfaceImpl$Globals;->getWallpaperFile(Landroid/content/Context;)Landroid/os/ParcelFileDescriptor;

    .line 4
    .line 5
    .line 6
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    return-object p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    new-instance p1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v0, "getWallpaperFile exception1 "

    .line 12
    .line 13
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "WallpaperInterface"

    .line 28
    .line 29
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method
