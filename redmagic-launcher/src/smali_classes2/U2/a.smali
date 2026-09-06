.class public LU2/a;
.super Ljava/lang/Object;
.source "MFVRemoteInterruptManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LU2/a$a;
    }
.end annotation


# static fields
.field public static final a:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "persist.sys.interrupt_remote_animation"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    sput-boolean v0, LU2/a;->a:Z

    .line 9
    .line 10
    return-void
.end method
