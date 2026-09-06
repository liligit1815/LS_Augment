.class Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$1;
.super Lcom/zte/toolsmanager/IToolsListener$Stub;
.source "ToolsCapabilityFetcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->createListener()Lcom/zte/toolsmanager/IToolsListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$1;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/zte/toolsmanager/IToolsListener$Stub;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAppFunctionsChanged(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    sget-boolean v0, Lcom/zte/toolsdk/utils/FeatureUtil;->LOG_DEBUG:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$1;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->b(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    const-string p0, "[Full]"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string p0, "[Filtered]"

    .line 22
    .line 23
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p0, " Capabilities: "

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string p1, "ToolsCapability"

    .line 39
    .line 40
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public onAppFunctionsFetchComplete(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    sget-boolean v0, Lcom/zte/toolsdk/utils/FeatureUtil;->LOG_DEBUG:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$1;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 11
    .line 12
    invoke-static {v1}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->b(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    const-string v1, "[Full]"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string v1, "[Filtered]"

    .line 22
    .line 23
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, " Capabilities: "

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "ToolsCapability"

    .line 39
    .line 40
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$1;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->this$0:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->e(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;)Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->parseToolsCapability(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$1;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->b(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    iget-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$1;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 63
    .line 64
    iget-object p1, p1, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->this$0:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 65
    .line 66
    invoke-static {p1}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->c(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;)Lcom/zte/toolsdk/consumer/FunctionCallback;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    if-eqz p1, :cond_3

    .line 71
    .line 72
    iget-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$1;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 73
    .line 74
    iget-object p1, p1, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->this$0:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 75
    .line 76
    invoke-static {p1}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->c(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;)Lcom/zte/toolsdk/consumer/FunctionCallback;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iget-object v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$1;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 81
    .line 82
    iget-object v0, v0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->this$0:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 83
    .line 84
    invoke-static {v0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->e(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;)Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->getAllFunction()Ljava/util/Map;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$1;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 93
    .line 94
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->this$0:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 95
    .line 96
    invoke-static {p0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->e(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;)Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0}, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->getAllFilter()Ljava/util/Map;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-interface {p1, v0, p0}, Lcom/zte/toolsdk/consumer/FunctionCallback;->onResult(Ljava/util/Map;Ljava/util/Map;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_2
    iget-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$1;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 109
    .line 110
    iget-object p1, p1, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->this$0:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 111
    .line 112
    invoke-static {p1}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->b(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;)Lcom/zte/toolsdk/consumer/FunctionCallback;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    if-eqz p1, :cond_3

    .line 117
    .line 118
    iget-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$1;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 119
    .line 120
    iget-object p1, p1, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->this$0:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 121
    .line 122
    invoke-static {p1}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->b(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;)Lcom/zte/toolsdk/consumer/FunctionCallback;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iget-object v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$1;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 127
    .line 128
    iget-object v0, v0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->this$0:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 129
    .line 130
    invoke-static {v0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->e(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;)Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-virtual {v0}, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->getAllFunction()Ljava/util/Map;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$1;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 139
    .line 140
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->this$0:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 141
    .line 142
    invoke-static {p0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->e(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;)Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-virtual {p0}, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->getAllFilter()Ljava/util/Map;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-interface {p1, v0, p0}, Lcom/zte/toolsdk/consumer/FunctionCallback;->onResult(Ljava/util/Map;Ljava/util/Map;)V

    .line 151
    .line 152
    .line 153
    :cond_3
    return-void
.end method
