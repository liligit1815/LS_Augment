.class Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$f;
.super Landroid/content/BroadcastReceiver;
.source "AIFutureWidgetDigitalHumanLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$f;->a:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 1
    if-eqz p2, :cond_5

    .line 2
    .line 3
    const-string p1, "com.zte.mifavor.launcher.AIFutureDigitalHuman.onEvent"

    .line 4
    .line 5
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_5

    .line 14
    .line 15
    const-string p1, "event"

    .line 16
    .line 17
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$f;->a:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 22
    .line 23
    invoke-static {p2}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v1, "mEventReceiver onReceive ACTION_DIGITAL_HUMAN_EVENT event="

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    const-string p2, "onAiassistantOpen"

    .line 48
    .line 49
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-eqz p2, :cond_0

    .line 54
    .line 55
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$f;->a:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 56
    .line 57
    const/4 p2, 0x1

    .line 58
    invoke-static {p1, p2}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->b(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;Z)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$f;->a:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 62
    .line 63
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->d(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    const-string p2, "onAiassistantClose"

    .line 68
    .line 69
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-eqz p2, :cond_1

    .line 74
    .line 75
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$f;->a:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 76
    .line 77
    const/4 p2, 0x0

    .line 78
    invoke-static {p1, p2}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->b(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;Z)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$f;->a:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 82
    .line 83
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->h(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    const-string p2, "startMouthSpeak"

    .line 88
    .line 89
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    if-eqz p2, :cond_3

    .line 94
    .line 95
    :try_start_0
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->isReady()Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-eqz p1, :cond_2

    .line 100
    .line 101
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->get()Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    const/4 p2, 0x0

    .line 106
    invoke-interface {p1, p2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;->startSpeak(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :catchall_0
    move-exception p1

    .line 111
    goto :goto_0

    .line 112
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$f;->a:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 113
    .line 114
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    const-string p2, "mEventReceiver onReceive ACTION_DIGITAL_HUMAN_EVENT startSpeak error, not isReady"

    .line 119
    .line 120
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$f;->a:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 125
    .line 126
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    const-string p2, "mEventReceiver onReceive ACTION_DIGITAL_HUMAN_EVENT startSpeak error"

    .line 131
    .line 132
    invoke-static {p0, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 133
    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_3
    const-string p2, "endMouthSpeak"

    .line 137
    .line 138
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    if-eqz p1, :cond_5

    .line 143
    .line 144
    :try_start_1
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->isReady()Z

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    if-eqz p1, :cond_4

    .line 149
    .line 150
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->get()Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-interface {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;->stopSpeak()V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :catchall_1
    move-exception p1

    .line 159
    goto :goto_1

    .line 160
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$f;->a:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 161
    .line 162
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    const-string p2, "mEventReceiver onReceive ACTION_DIGITAL_HUMAN_EVENT stopSpeak error, not isReady"

    .line 167
    .line 168
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :goto_1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$f;->a:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 173
    .line 174
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    const-string p2, "mEventReceiver onReceive ACTION_DIGITAL_HUMAN_EVENT stopSpeak error"

    .line 179
    .line 180
    invoke-static {p0, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 181
    .line 182
    .line 183
    :cond_5
    :goto_2
    return-void
.end method
