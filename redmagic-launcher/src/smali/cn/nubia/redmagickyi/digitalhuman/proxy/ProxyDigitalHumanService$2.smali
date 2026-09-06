.class Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$2;
.super Ljava/lang/Object;
.source "ProxyDigitalHumanService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->bindView(Landroid/view/ViewGroup;Ljava/lang/Integer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

.field final synthetic val$scene:Ljava/lang/Integer;

.field final synthetic val$view:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;Ljava/lang/Integer;Landroid/view/ViewGroup;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$2;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 2
    .line 3
    iput-object p2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$2;->val$scene:Ljava/lang/Integer;

    .line 4
    .line 5
    iput-object p3, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$2;->val$view:Landroid/view/ViewGroup;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$2;->val$scene:Ljava/lang/Integer;

    .line 3
    .line 4
    if-eqz v1, :cond_1

    .line 5
    .line 6
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$2;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 7
    .line 8
    invoke-virtual {v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getScene()Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    if-eq v1, v2, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception v1

    .line 18
    invoke-virtual {v1}, Landroid/os/RemoteException;->printStackTrace()V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$2;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 22
    .line 23
    invoke-static {v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->access$500(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$2;->val$view:Landroid/view/ViewGroup;

    .line 28
    .line 29
    iget-object v3, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$2;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 30
    .line 31
    invoke-static {v3}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->access$200(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-static {v3}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->access$400(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)Ljava/lang/Boolean;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v1, v2, v3, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->bindView(Landroid/view/ViewGroup;Ljava/lang/Boolean;Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$2;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 43
    .line 44
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->access$200(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)Ljava/lang/Boolean;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$2;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 55
    .line 56
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->access$200(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-static {v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)Ljava/lang/Boolean;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    invoke-virtual {v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->supportedTouchEvent(Z)V

    .line 69
    .line 70
    .line 71
    :cond_2
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$2;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 72
    .line 73
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->access$200(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->access$700(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)Ljava/lang/Boolean;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    if-eqz v0, :cond_3

    .line 82
    .line 83
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$2;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 84
    .line 85
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->access$200(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-static {v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->access$700(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)Ljava/lang/Boolean;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    invoke-virtual {v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->setZOrderOnTop(Z)V

    .line 98
    .line 99
    .line 100
    :cond_3
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$2;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 101
    .line 102
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->access$200(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->access$300(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)Ljava/lang/Integer;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    if-eqz v0, :cond_4

    .line 111
    .line 112
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$2;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 113
    .line 114
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->access$200(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-static {v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->access$300(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    invoke-virtual {v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->setBackgroundColor(I)V

    .line 127
    .line 128
    .line 129
    :cond_4
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$2;->val$scene:Ljava/lang/Integer;

    .line 130
    .line 131
    if-eqz v0, :cond_5

    .line 132
    .line 133
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$2;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 134
    .line 135
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->access$500(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$2;->val$scene:Ljava/lang/Integer;

    .line 140
    .line 141
    invoke-virtual {v0, p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->onSwitchScene(Ljava/lang/Integer;)V

    .line 142
    .line 143
    .line 144
    :cond_5
    return-void
.end method
