.class Lcom/zte/toolsdk/producer/UserTask$1;
.super Ljava/lang/Object;
.source "UserTask.java"

# interfaces
.implements Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/toolsdk/producer/UserTask;->execute()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zte/toolsdk/producer/UserTask;

.field final synthetic val$executor:Lcom/zte/toolsdk/producer/ToolsExecutor;

.field final synthetic val$messenger:Landroid/os/Messenger;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/producer/UserTask;Lcom/zte/toolsdk/producer/ToolsExecutor;Landroid/os/Messenger;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/producer/UserTask$1;->this$0:Lcom/zte/toolsdk/producer/UserTask;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/zte/toolsdk/producer/UserTask$1;->val$executor:Lcom/zte/toolsdk/producer/ToolsExecutor;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/zte/toolsdk/producer/UserTask$1;->val$messenger:Landroid/os/Messenger;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
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
    const/4 p1, 0x1

    .line 16
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setFromUser(Z)V

    .line 17
    .line 18
    .line 19
    if-eqz p3, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lcom/zte/toolsdk/producer/UserTask$1;->this$0:Lcom/zte/toolsdk/producer/UserTask;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/zte/toolsdk/producer/ToolsTask;->TAG:Ljava/lang/String;

    .line 24
    .line 25
    const-string p2, "UserTask execute success"

    .line 26
    .line 27
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/zte/toolsdk/producer/UserTask$1;->val$executor:Lcom/zte/toolsdk/producer/ToolsExecutor;

    .line 31
    .line 32
    iget-object p2, p0, Lcom/zte/toolsdk/producer/UserTask$1;->this$0:Lcom/zte/toolsdk/producer/UserTask;

    .line 33
    .line 34
    invoke-static {p2}, Lcom/zte/toolsdk/producer/UserTask;->b(Lcom/zte/toolsdk/producer/UserTask;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p1, p2}, Lcom/zte/toolsdk/producer/ToolsExecutor;->updateRemoteViews(Ljava/lang/String;)Landroid/util/Pair;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object p2, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast p2, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 45
    .line 46
    invoke-virtual {v0, p2}, Lcom/zte/toolsdk/common/ToolsResult;->setRemoteViews(Lcom/zte/toolsdk/widget/RemoteViews;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast p1, Ljava/lang/Boolean;

    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setReplace(Z)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/zte/toolsdk/producer/UserTask$1;->val$executor:Lcom/zte/toolsdk/producer/ToolsExecutor;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsExecutor;->getRemoteViewsId()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setCardId(I)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    const/4 p1, 0x0

    .line 71
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setRemoteViews(Lcom/zte/toolsdk/widget/RemoteViews;)V

    .line 72
    .line 73
    .line 74
    const/4 p1, 0x0

    .line 75
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setReplace(Z)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setCardId(I)V

    .line 79
    .line 80
    .line 81
    :goto_0
    iget-object p1, p0, Lcom/zte/toolsdk/producer/UserTask$1;->this$0:Lcom/zte/toolsdk/producer/UserTask;

    .line 82
    .line 83
    iget-object p2, p0, Lcom/zte/toolsdk/producer/UserTask$1;->val$messenger:Landroid/os/Messenger;

    .line 84
    .line 85
    invoke-static {p1}, Lcom/zte/toolsdk/producer/UserTask;->b(Lcom/zte/toolsdk/producer/UserTask;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p3

    .line 89
    invoke-static {p3}, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->getAgent(Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p3

    .line 93
    iget-object p0, p0, Lcom/zte/toolsdk/producer/UserTask$1;->this$0:Lcom/zte/toolsdk/producer/UserTask;

    .line 94
    .line 95
    invoke-static {p0}, Lcom/zte/toolsdk/producer/UserTask;->b(Lcom/zte/toolsdk/producer/UserTask;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-static {p0}, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->getTools(Ljava/lang/String;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p1, p2, p3, p0, v0}, Lcom/zte/toolsdk/producer/ToolsTask;->sendResult(Landroid/os/Messenger;Ljava/lang/String;Ljava/lang/String;Lcom/zte/toolsdk/common/ToolsResult;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public onResultByToolsParams(Lcom/zte/toolsdk/producer/ToolsParams;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/zte/toolsdk/producer/UserTask$1;->this$0:Lcom/zte/toolsdk/producer/UserTask;

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
    const/4 v1, 0x1

    .line 169
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setFromUser(Z)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsParams;->getLongRunningWork()Z

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setLongRunningWork(Z)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsParams;->getFinish()Z

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    if-eqz p1, :cond_9

    .line 184
    .line 185
    iget-object p1, p0, Lcom/zte/toolsdk/producer/UserTask$1;->this$0:Lcom/zte/toolsdk/producer/UserTask;

    .line 186
    .line 187
    iget-object p1, p1, Lcom/zte/toolsdk/producer/ToolsTask;->TAG:Ljava/lang/String;

    .line 188
    .line 189
    const-string v1, "UserTask execute success"

    .line 190
    .line 191
    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Lcom/zte/toolsdk/producer/UserTask$1;->val$executor:Lcom/zte/toolsdk/producer/ToolsExecutor;

    .line 195
    .line 196
    iget-object v1, p0, Lcom/zte/toolsdk/producer/UserTask$1;->this$0:Lcom/zte/toolsdk/producer/UserTask;

    .line 197
    .line 198
    invoke-static {v1}, Lcom/zte/toolsdk/producer/UserTask;->b(Lcom/zte/toolsdk/producer/UserTask;)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    invoke-virtual {p1, v1}, Lcom/zte/toolsdk/producer/ToolsExecutor;->updateRemoteViews(Ljava/lang/String;)Landroid/util/Pair;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    iget-object v1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 207
    .line 208
    check-cast v1, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 209
    .line 210
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsResult;->setRemoteViews(Lcom/zte/toolsdk/widget/RemoteViews;)V

    .line 211
    .line 212
    .line 213
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 214
    .line 215
    check-cast p1, Ljava/lang/Boolean;

    .line 216
    .line 217
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 218
    .line 219
    .line 220
    move-result p1

    .line 221
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setReplace(Z)V

    .line 222
    .line 223
    .line 224
    iget-object p1, p0, Lcom/zte/toolsdk/producer/UserTask$1;->val$executor:Lcom/zte/toolsdk/producer/ToolsExecutor;

    .line 225
    .line 226
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsExecutor;->getRemoteViewsId()I

    .line 227
    .line 228
    .line 229
    move-result p1

    .line 230
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setCardId(I)V

    .line 231
    .line 232
    .line 233
    goto :goto_2

    .line 234
    :cond_9
    const/4 p1, 0x0

    .line 235
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setRemoteViews(Lcom/zte/toolsdk/widget/RemoteViews;)V

    .line 236
    .line 237
    .line 238
    const/4 p1, 0x0

    .line 239
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setReplace(Z)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsResult;->setCardId(I)V

    .line 243
    .line 244
    .line 245
    :goto_2
    iget-object p1, p0, Lcom/zte/toolsdk/producer/UserTask$1;->this$0:Lcom/zte/toolsdk/producer/UserTask;

    .line 246
    .line 247
    iget-object v1, p0, Lcom/zte/toolsdk/producer/UserTask$1;->val$messenger:Landroid/os/Messenger;

    .line 248
    .line 249
    invoke-static {p1}, Lcom/zte/toolsdk/producer/UserTask;->b(Lcom/zte/toolsdk/producer/UserTask;)Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    invoke-static {v2}, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->getAgent(Ljava/lang/String;)Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v2

    .line 257
    iget-object p0, p0, Lcom/zte/toolsdk/producer/UserTask$1;->this$0:Lcom/zte/toolsdk/producer/UserTask;

    .line 258
    .line 259
    invoke-static {p0}, Lcom/zte/toolsdk/producer/UserTask;->b(Lcom/zte/toolsdk/producer/UserTask;)Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object p0

    .line 263
    invoke-static {p0}, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->getTools(Ljava/lang/String;)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object p0

    .line 267
    invoke-virtual {p1, v1, v2, p0, v0}, Lcom/zte/toolsdk/producer/ToolsTask;->sendResult(Landroid/os/Messenger;Ljava/lang/String;Ljava/lang/String;Lcom/zte/toolsdk/common/ToolsResult;)V

    .line 268
    .line 269
    .line 270
    return-void
.end method
