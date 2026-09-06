.class public Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService$Default;
.super Ljava/lang/Object;
.source "IDigitalHumanService.java"

# interfaces
.implements Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Default"
.end annotation


# direct methods
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
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getAvatarHeight()I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getAvatarLayoutParams(FF)[F
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getAvatarWidth()I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getHumanScaleV2()Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getScene()I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isHumanInited()Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isHumanRendered()Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onSurfaceChanged(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public onSurfaceCreated(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public onSurfaceDestroyed(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public pauseMotion()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public registerCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public resumeMotion()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public setHumanRendered()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public setHumanRotation(F)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public setHumanScale(FF)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public setHumanScaleV2(FFFFF)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public setSDKVersionCode(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public startMotion(ILcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public startSpeak(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public stopMotion()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public stopSpeak()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public switchScene(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public unregisterCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method
