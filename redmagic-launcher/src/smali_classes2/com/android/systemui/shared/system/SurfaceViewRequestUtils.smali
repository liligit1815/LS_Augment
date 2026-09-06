.class public Lcom/android/systemui/shared/system/SurfaceViewRequestUtils;
.super Ljava/lang/Object;
.source "SurfaceViewRequestUtils.java"


# static fields
.field private static final KEY_DISPLAY_ID:Ljava/lang/String; = "display_id"

.field private static final KEY_HOST_TOKEN:Ljava/lang/String; = "host_token"

.field private static final KEY_SURFACE_CONTROL:Ljava/lang/String; = "surface_control"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static createSurfaceBundle(Landroid/view/SurfaceView;)Landroid/os/Bundle;
    .locals 3

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHostToken()Landroid/os/IBinder;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const-string v2, "host_token"

    .line 11
    .line 12
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBinder(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 13
    .line 14
    .line 15
    const-string v1, "surface_control"

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getSurfaceControl()Landroid/view/SurfaceControl;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getDisplay()Landroid/view/Display;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    const-string v1, "display_id"

    .line 33
    .line 34
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public static getDisplayId(Landroid/os/Bundle;)I
    .locals 1

    .line 1
    const-string v0, "display_id"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static getHostToken(Landroid/os/Bundle;)Landroid/os/IBinder;
    .locals 1
    .annotation build Landroid/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "host_token"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getBinder(Ljava/lang/String;)Landroid/os/IBinder;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static getSurfaceControl(Landroid/os/Bundle;)Landroid/view/SurfaceControl;
    .locals 1

    .line 1
    const-string v0, "surface_control"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/view/SurfaceControl;

    .line 8
    .line 9
    return-object p0
.end method
