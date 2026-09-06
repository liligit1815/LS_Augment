.class public interface abstract Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;
.super Ljava/lang/Object;
.source "IProxyDigitalHumanService.java"


# virtual methods
.method public abstract bindView(Landroid/view/ViewGroup;Ljava/lang/Integer;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract getHumanScale()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract hide()V
.end method

.method public abstract initPlayer(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;)V
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

.method public abstract setBackgroundColor(I)V
.end method

.method public abstract setHumanRotation(F)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract setHumanScale(FFFFF)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract setZOrderOnTop(Z)V
.end method

.method public abstract show()V
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

.method public abstract supportedTouchEvent(Z)V
.end method

.method public abstract unregisterCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method
