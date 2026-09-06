.class Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager$2;
.super Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;
.source "DigitalHumanManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->get()Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->access$500(Z)Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method
