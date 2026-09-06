.class Lcom/zte/toolsdk/producer/ModelTask$1;
.super Ljava/lang/Object;
.source "ModelTask.java"

# interfaces
.implements Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/toolsdk/producer/ModelTask;->execute()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zte/toolsdk/producer/ModelTask;

.field final synthetic val$agentId:[Ljava/lang/String;

.field final synthetic val$executor:Lcom/zte/toolsdk/producer/ToolsExecutor;

.field final synthetic val$messenger:Landroid/os/Messenger;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/producer/ModelTask;Lcom/zte/toolsdk/producer/ToolsExecutor;[Ljava/lang/String;Landroid/os/Messenger;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->this$0:Lcom/zte/toolsdk/producer/ModelTask;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->val$executor:Lcom/zte/toolsdk/producer/ToolsExecutor;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->val$agentId:[Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->val$messenger:Landroid/os/Messenger;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onResult(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/common/ToolsResult;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/zte/toolsdk/common/ToolsResult;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setText(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, p2}, Lcom/zte/toolsdk/common/ToolsResult;->setResponse(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p3}, Lcom/zte/toolsdk/common/ToolsResult;->setFinish(Z)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setFromUser(Z)V

    .line 17
    .line 18
    .line 19
    if-eqz p3, :cond_1

    .line 20
    .line 21
    iget-object p2, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->this$0:Lcom/zte/toolsdk/producer/ModelTask;

    .line 22
    .line 23
    iget-object p2, p2, Lcom/zte/toolsdk/producer/ToolsTask;->TAG:Ljava/lang/String;

    .line 24
    .line 25
    const-string p3, "ModelTask execute success"

    .line 26
    .line 27
    invoke-static {p2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    iget-object p2, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->val$executor:Lcom/zte/toolsdk/producer/ToolsExecutor;

    .line 31
    .line 32
    iget-object p3, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->this$0:Lcom/zte/toolsdk/producer/ModelTask;

    .line 33
    .line 34
    invoke-static {p3}, Lcom/zte/toolsdk/producer/ModelTask;->c(Lcom/zte/toolsdk/producer/ModelTask;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    invoke-virtual {p2, p3}, Lcom/zte/toolsdk/producer/ToolsExecutor;->createRemoteViews(Ljava/lang/String;)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {v0, p2}, Lcom/zte/toolsdk/common/ToolsResult;->setRemoteViews(Lcom/zte/toolsdk/widget/RemoteViews;)V

    .line 43
    .line 44
    .line 45
    iget-object p2, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->val$executor:Lcom/zte/toolsdk/producer/ToolsExecutor;

    .line 46
    .line 47
    invoke-virtual {p2}, Lcom/zte/toolsdk/producer/ToolsExecutor;->getRemoteViewsId()I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    invoke-virtual {v0, p2}, Lcom/zte/toolsdk/common/ToolsResult;->setCardId(I)V

    .line 52
    .line 53
    .line 54
    iget-object p2, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->val$agentId:[Ljava/lang/String;

    .line 55
    .line 56
    aget-object p2, p2, p1

    .line 57
    .line 58
    iget-object p3, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->this$0:Lcom/zte/toolsdk/producer/ModelTask;

    .line 59
    .line 60
    invoke-static {p3}, Lcom/zte/toolsdk/producer/ModelTask;->b(Lcom/zte/toolsdk/producer/ModelTask;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p3

    .line 64
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    if-eqz p2, :cond_0

    .line 69
    .line 70
    const/4 p1, 0x1

    .line 71
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setReplace(Z)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_0
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setReplace(Z)V

    .line 76
    .line 77
    .line 78
    iget-object p2, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->val$agentId:[Ljava/lang/String;

    .line 79
    .line 80
    iget-object p3, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->this$0:Lcom/zte/toolsdk/producer/ModelTask;

    .line 81
    .line 82
    invoke-static {p3}, Lcom/zte/toolsdk/producer/ModelTask;->b(Lcom/zte/toolsdk/producer/ModelTask;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p3

    .line 86
    aput-object p3, p2, p1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    const/4 p2, 0x0

    .line 90
    invoke-virtual {v0, p2}, Lcom/zte/toolsdk/common/ToolsResult;->setRemoteViews(Lcom/zte/toolsdk/widget/RemoteViews;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setCardId(I)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setReplace(Z)V

    .line 97
    .line 98
    .line 99
    :goto_0
    iget-object p1, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->this$0:Lcom/zte/toolsdk/producer/ModelTask;

    .line 100
    .line 101
    iget-object p2, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->val$messenger:Landroid/os/Messenger;

    .line 102
    .line 103
    invoke-static {p1}, Lcom/zte/toolsdk/producer/ModelTask;->b(Lcom/zte/toolsdk/producer/ModelTask;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->this$0:Lcom/zte/toolsdk/producer/ModelTask;

    .line 108
    .line 109
    invoke-static {p0}, Lcom/zte/toolsdk/producer/ModelTask;->d(Lcom/zte/toolsdk/producer/ModelTask;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p1, p2, p3, p0, v0}, Lcom/zte/toolsdk/producer/ToolsTask;->sendResult(Landroid/os/Messenger;Ljava/lang/String;Ljava/lang/String;Lcom/zte/toolsdk/common/ToolsResult;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public onResultByToolsParams(Lcom/zte/toolsdk/producer/ToolsParams;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->this$0:Lcom/zte/toolsdk/producer/ModelTask;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ToolsTask;->TAG:Ljava/lang/String;

    .line 6
    .line 7
    const-string p1, "ToolsParams is null"

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v0, Lcom/zte/toolsdk/common/ToolsResult;

    .line 14
    .line 15
    invoke-direct {v0}, Lcom/zte/toolsdk/common/ToolsResult;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsParams;->getText()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setText(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsParams;->getResponse()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setResponse(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsParams;->getFinish()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setFinish(Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsParams;->getShowChatWindow()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setShowChatWindow(Z)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsParams;->getAssistantState()Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    sget-object v2, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;->UNKNOWN:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 51
    .line 52
    if-ne v1, v2, :cond_2

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsParams;->getShowChatWindow()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    sget-object v1, Lcom/zte/toolsdk/common/ToolsResult$AssistantState;->SHOW_CHAT_WINDOW:Lcom/zte/toolsdk/common/ToolsResult$AssistantState;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setAssistantState(Lcom/zte/toolsdk/common/ToolsResult$AssistantState;)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    sget-object v1, Lcom/zte/toolsdk/common/ToolsResult$AssistantState;->HIDE_WINDOW_KEEP_ASR:Lcom/zte/toolsdk/common/ToolsResult$AssistantState;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setAssistantState(Lcom/zte/toolsdk/common/ToolsResult$AssistantState;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsParams;->getAssistantState()Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    sget-object v2, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;->SHOW_CHAT_WINDOW:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 77
    .line 78
    if-ne v1, v2, :cond_3

    .line 79
    .line 80
    sget-object v1, Lcom/zte/toolsdk/common/ToolsResult$AssistantState;->SHOW_CHAT_WINDOW:Lcom/zte/toolsdk/common/ToolsResult$AssistantState;

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setAssistantState(Lcom/zte/toolsdk/common/ToolsResult$AssistantState;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_3
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsParams;->getAssistantState()Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    sget-object v2, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;->HIDE_WINDOW_KEEP_ASR:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 91
    .line 92
    if-ne v1, v2, :cond_4

    .line 93
    .line 94
    sget-object v1, Lcom/zte/toolsdk/common/ToolsResult$AssistantState;->HIDE_WINDOW_KEEP_ASR:Lcom/zte/toolsdk/common/ToolsResult$AssistantState;

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setAssistantState(Lcom/zte/toolsdk/common/ToolsResult$AssistantState;)V

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_4
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsParams;->getAssistantState()Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    sget-object v2, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;->HIDE_WINDOW_STOP_ASR:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 105
    .line 106
    if-ne v1, v2, :cond_5

    .line 107
    .line 108
    sget-object v1, Lcom/zte/toolsdk/common/ToolsResult$AssistantState;->HIDE_WINDOW_STOP_ASR:Lcom/zte/toolsdk/common/ToolsResult$AssistantState;

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setAssistantState(Lcom/zte/toolsdk/common/ToolsResult$AssistantState;)V

    .line 111
    .line 112
    .line 113
    :cond_5
    :goto_0
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsParams;->getToolState()Lcom/zte/toolsdk/producer/ToolsParams$ToolState;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    sget-object v2, Lcom/zte/toolsdk/producer/ToolsParams$ToolState;->WORK_IN_PROCESS:Lcom/zte/toolsdk/producer/ToolsParams$ToolState;

    .line 118
    .line 119
    if-ne v1, v2, :cond_6

    .line 120
    .line 121
    sget-object v1, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->WORK_IN_PROCESS:Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setToolState(Lcom/zte/toolsdk/common/ToolsResult$ToolState;)V

    .line 124
    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_6
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsParams;->getToolState()Lcom/zte/toolsdk/producer/ToolsParams$ToolState;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    sget-object v2, Lcom/zte/toolsdk/producer/ToolsParams$ToolState;->COMPLETE:Lcom/zte/toolsdk/producer/ToolsParams$ToolState;

    .line 132
    .line 133
    if-ne v1, v2, :cond_7

    .line 134
    .line 135
    sget-object v1, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->COMPLETE:Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 136
    .line 137
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setToolState(Lcom/zte/toolsdk/common/ToolsResult$ToolState;)V

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_7
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsParams;->getToolState()Lcom/zte/toolsdk/producer/ToolsParams$ToolState;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    sget-object v2, Lcom/zte/toolsdk/producer/ToolsParams$ToolState;->CANCEL:Lcom/zte/toolsdk/producer/ToolsParams$ToolState;

    .line 146
    .line 147
    if-ne v1, v2, :cond_8

    .line 148
    .line 149
    sget-object v1, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->CANCEL:Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setToolState(Lcom/zte/toolsdk/common/ToolsResult$ToolState;)V

    .line 152
    .line 153
    .line 154
    :cond_8
    :goto_1
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsParams;->getPlaySpeech()Z

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setPlaySpeech(Z)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsParams;->getToUserContent()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setToUserContent(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    const/4 v1, 0x0

    .line 169
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setFromUser(Z)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsParams;->getLongRunningWork()Z

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    invoke-virtual {v0, v2}, Lcom/zte/toolsdk/common/ToolsResult;->setLongRunningWork(Z)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsParams;->getFinish()Z

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    if-eqz p1, :cond_a

    .line 184
    .line 185
    iget-object p1, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->this$0:Lcom/zte/toolsdk/producer/ModelTask;

    .line 186
    .line 187
    iget-object p1, p1, Lcom/zte/toolsdk/producer/ToolsTask;->TAG:Ljava/lang/String;

    .line 188
    .line 189
    const-string v2, "ModelTask execute success"

    .line 190
    .line 191
    invoke-static {p1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->val$executor:Lcom/zte/toolsdk/producer/ToolsExecutor;

    .line 195
    .line 196
    iget-object v2, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->this$0:Lcom/zte/toolsdk/producer/ModelTask;

    .line 197
    .line 198
    invoke-static {v2}, Lcom/zte/toolsdk/producer/ModelTask;->c(Lcom/zte/toolsdk/producer/ModelTask;)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    invoke-virtual {p1, v2}, Lcom/zte/toolsdk/producer/ToolsExecutor;->createRemoteViews(Ljava/lang/String;)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setRemoteViews(Lcom/zte/toolsdk/widget/RemoteViews;)V

    .line 207
    .line 208
    .line 209
    iget-object p1, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->val$executor:Lcom/zte/toolsdk/producer/ToolsExecutor;

    .line 210
    .line 211
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsExecutor;->getRemoteViewsId()I

    .line 212
    .line 213
    .line 214
    move-result p1

    .line 215
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setCardId(I)V

    .line 216
    .line 217
    .line 218
    iget-object p1, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->val$agentId:[Ljava/lang/String;

    .line 219
    .line 220
    aget-object p1, p1, v1

    .line 221
    .line 222
    iget-object v2, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->this$0:Lcom/zte/toolsdk/producer/ModelTask;

    .line 223
    .line 224
    invoke-static {v2}, Lcom/zte/toolsdk/producer/ModelTask;->b(Lcom/zte/toolsdk/producer/ModelTask;)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v2

    .line 228
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    if-eqz p1, :cond_9

    .line 233
    .line 234
    const/4 p1, 0x1

    .line 235
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setReplace(Z)V

    .line 236
    .line 237
    .line 238
    goto :goto_2

    .line 239
    :cond_9
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setReplace(Z)V

    .line 240
    .line 241
    .line 242
    iget-object p1, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->val$agentId:[Ljava/lang/String;

    .line 243
    .line 244
    iget-object v2, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->this$0:Lcom/zte/toolsdk/producer/ModelTask;

    .line 245
    .line 246
    invoke-static {v2}, Lcom/zte/toolsdk/producer/ModelTask;->b(Lcom/zte/toolsdk/producer/ModelTask;)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    aput-object v2, p1, v1

    .line 251
    .line 252
    goto :goto_2

    .line 253
    :cond_a
    const/4 p1, 0x0

    .line 254
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setRemoteViews(Lcom/zte/toolsdk/widget/RemoteViews;)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setCardId(I)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setReplace(Z)V

    .line 261
    .line 262
    .line 263
    :goto_2
    iget-object p1, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->this$0:Lcom/zte/toolsdk/producer/ModelTask;

    .line 264
    .line 265
    iget-object v1, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->val$messenger:Landroid/os/Messenger;

    .line 266
    .line 267
    invoke-static {p1}, Lcom/zte/toolsdk/producer/ModelTask;->b(Lcom/zte/toolsdk/producer/ModelTask;)Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v2

    .line 271
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ModelTask$1;->this$0:Lcom/zte/toolsdk/producer/ModelTask;

    .line 272
    .line 273
    invoke-static {p0}, Lcom/zte/toolsdk/producer/ModelTask;->d(Lcom/zte/toolsdk/producer/ModelTask;)Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object p0

    .line 277
    invoke-virtual {p1, v1, v2, p0, v0}, Lcom/zte/toolsdk/producer/ToolsTask;->sendResult(Landroid/os/Messenger;Ljava/lang/String;Ljava/lang/String;Lcom/zte/toolsdk/common/ToolsResult;)V

    .line 278
    .line 279
    .line 280
    return-void
.end method
