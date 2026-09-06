.class Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;
.super Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback$Stub;
.source "ProxyDigitalHumanService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProxyDigitalHumanClientCallback"
.end annotation


# instance fields
.field private innerCallback:Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

.field final synthetic this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;


# direct methods
.method private constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback$Stub;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$1;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)V

    return-void
.end method


# virtual methods
.method public onHumanInited()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 2
    .line 3
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->access$500(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 10
    .line 11
    new-instance v1, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback$1;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback$1;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->access$1300(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;->innerCallback:Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-interface {p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;->onHumanInited()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public onMotionStart(Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;->innerCallback:Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;->onMotionStart(Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onMotionStop(Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;->innerCallback:Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;->onMotionStop(Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onSpeakStart(Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;->innerCallback:Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;->onSpeakStart(Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onSpeakStop(Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;->innerCallback:Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;->onSpeakStop(Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setInnerCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)V
    .locals 0

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;->innerCallback:Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

    .line 5
    .line 6
    return-void
.end method
