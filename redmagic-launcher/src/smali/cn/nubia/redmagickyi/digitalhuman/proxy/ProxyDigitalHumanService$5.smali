.class Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$5;
.super Ljava/lang/Object;
.source "ProxyDigitalHumanService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->setBackgroundColor(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;


# direct methods
.method constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$5;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$5;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 2
    .line 3
    invoke-static {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->access$500(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->refreshBackgroundColor()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
