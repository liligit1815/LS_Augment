.class Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState$2;
.super Ljava/lang/Object;
.source "ProxyDigitalHumanService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->restoreState()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;


# direct methods
.method constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

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
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 2
    .line 3
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 4
    .line 5
    invoke-static {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->access$500(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->clearState()V

    .line 10
    .line 11
    .line 12
    return-void
.end method
