.class Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$b;
.super Ljava/lang/Object;
.source "AIFutureWidgetDigitalHumanLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->m()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$b;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

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
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$b;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "initDigitalHumanViewAfterServiceConnected run"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$b;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 17
    .line 18
    :try_start_0
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->isReady()Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->get()Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    sget-object v4, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;->TextureView:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;

    .line 29
    .line 30
    invoke-interface {v3, v4}, Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;->initPlayer(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;)V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->get()Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    const/4 v4, 0x5

    .line 38
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-interface {v3, v2, v4}, Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;->bindView(Landroid/view/ViewGroup;Ljava/lang/Integer;)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->get()Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    const/4 v3, 0x1

    .line 50
    invoke-interface {v2, v3}, Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;->supportedTouchEvent(Z)V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->get()Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-interface {v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;->show()V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :catchall_0
    move-exception v2

    .line 62
    goto :goto_0

    .line 63
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$b;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 64
    .line 65
    invoke-static {v2}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    const-string v3, "initDigitalHumanViewAfterServiceConnected bindView error, not isReady"

    .line 70
    .line 71
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :goto_0
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$b;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 76
    .line 77
    invoke-static {v3}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    const-string v4, "initDigitalHumanViewAfterServiceConnected bindView error"

    .line 82
    .line 83
    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 84
    .line 85
    .line 86
    :goto_1
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$b;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 87
    .line 88
    invoke-static {v2}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    new-instance v3, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    const-string v4, "initDigitalHumanViewAfterServiceConnected bindView hao="

    .line 98
    .line 99
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 103
    .line 104
    .line 105
    move-result-wide v4

    .line 106
    sub-long/2addr v4, v0

    .line 107
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const-string v0, " isReady="

    .line 111
    .line 112
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->isReady()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$b;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 130
    .line 131
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    instance-of v0, v0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;

    .line 136
    .line 137
    if-eqz v0, :cond_1

    .line 138
    .line 139
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$b;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 140
    .line 141
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    check-cast v0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;

    .line 146
    .line 147
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->isReady()Z

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->b(Z)V

    .line 152
    .line 153
    .line 154
    :cond_1
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->isReady()Z

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-eqz v0, :cond_2

    .line 159
    .line 160
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$b;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 161
    .line 162
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->f(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V

    .line 163
    .line 164
    .line 165
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$b;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 166
    .line 167
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V

    .line 168
    .line 169
    .line 170
    :cond_2
    return-void
.end method
