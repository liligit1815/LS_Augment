.class public interface abstract Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;
.super Ljava/lang/Object;
.source "IDigitalHumanService.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService$_Parcel;,
        Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService$Stub;,
        Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService$Default;
    }
.end annotation


# static fields
.field public static final DESCRIPTOR:Ljava/lang/String; = "cn.nubia.redmagickyi.digitalhuman.IDigitalHumanService"


# virtual methods
.method public abstract getAvatarHeight()I
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract getAvatarLayoutParams(FF)[F
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract getAvatarWidth()I
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract getHumanScaleV2()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract getScene()I
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract isHumanInited()Z
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract isHumanRendered()Z
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onSurfaceChanged(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;II)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onSurfaceCreated(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onSurfaceDestroyed(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onTouchEvent(Landroid/view/MotionEvent;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract pauseMotion()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract registerCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract resumeMotion()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract setHumanRendered()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract setHumanRotation(F)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract setHumanScale(FF)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract setHumanScaleV2(FFFFF)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract setSDKVersionCode(I)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract startMotion(ILcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;)Z
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract startSpeak(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract stopMotion()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract stopSpeak()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract switchScene(I)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract unregisterCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method
