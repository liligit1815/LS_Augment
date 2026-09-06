.class public Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback$Default;
.super Ljava/lang/Object;
.source "IDigitalHumanClientCallback.java"

# interfaces
.implements Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;
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

.method public onHumanInited()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public onMotionStart(Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public onMotionStop(Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public onSpeakStart(Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public onSpeakStop(Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method
