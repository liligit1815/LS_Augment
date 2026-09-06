.class public Lcom/android/launcher3/aitools/SwitchLauncherModeExecutor;
.super Lcom/zte/toolsdk/producer/ToolsExecutor;
.source "SwitchLauncherModeExecutor.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "SwitchLauncherModeExecutor"


# instance fields
.field private mLauncher:Lcom/android/launcher3/C2;

.field private mOnToolsResultListener:Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/toolsdk/producer/ToolsExecutor;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getModeIndex(Ljava/lang/String;)I
    .locals 2

    .line 1
    new-instance v0, Landroid/content/res/Configuration;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/res/Configuration;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ljava/util/Locale;->SIMPLIFIED_CHINESE:Ljava/util/Locale;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/res/Configuration;->setLocale(Ljava/util/Locale;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/aitools/SwitchLauncherModeExecutor;->mLauncher:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/app/Activity;->createConfigurationContext(Landroid/content/res/Configuration;)Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const v0, 0x7f14038c

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    sget-object p0, LK1/q$a;->h:LK1/q$a;

    .line 35
    .line 36
    invoke-virtual {p0}, LK1/q$a;->c()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0

    .line 41
    :cond_0
    const v0, 0x7f140385

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    sget-object p0, LK1/q$a;->i:LK1/q$a;

    .line 55
    .line 56
    invoke-virtual {p0}, LK1/q$a;->c()I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    return p0

    .line 61
    :cond_1
    const v0, 0x7f140387

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    sget-object p0, LK1/q$a;->j:LK1/q$a;

    .line 75
    .line 76
    invoke-virtual {p0}, LK1/q$a;->c()I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    return p0

    .line 81
    :cond_2
    const v0, 0x7f140383

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    if-eqz p0, :cond_3

    .line 93
    .line 94
    sget-object p0, LK1/q$a;->m:LK1/q$a;

    .line 95
    .line 96
    invoke-virtual {p0}, LK1/q$a;->c()I

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    return p0

    .line 101
    :cond_3
    const/4 p0, -0x1

    .line 102
    return p0
.end method

.method private switchMode(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 7

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p3}, Lcom/android/launcher3/aitools/SwitchLauncherModeExecutor;->getModeIndex(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p3

    .line 10
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->g:Z

    .line 23
    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    sget-object v1, LK1/q$a;->j:LK1/q$a;

    .line 28
    .line 29
    invoke-virtual {v1}, LK1/q$a;->c()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-ne p3, v2, :cond_1

    .line 34
    .line 35
    const-string v2, "com.zte.easymode"

    .line 36
    .line 37
    invoke-static {p1, v2}, Lx1/O;->h1(Landroid/content/Context;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-nez v2, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    sget-object v2, LK1/q$a;->m:LK1/q$a;

    .line 45
    .line 46
    invoke-virtual {v2}, LK1/q$a;->c()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-ne p3, v2, :cond_2

    .line 51
    .line 52
    :goto_0
    sget-object p0, LK1/q$b;->i:LK1/q$b;

    .line 53
    .line 54
    invoke-virtual {p0}, LK1/q$b;->c()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    const-string p1, "result_code"

    .line 59
    .line 60
    invoke-virtual {v0, p1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 61
    .line 62
    .line 63
    const-string p0, "SwitchLauncherModeExecutor"

    .line 64
    .line 65
    const-string p1, "unsupported switch mode "

    .line 66
    .line 67
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    return-object v0

    .line 71
    :cond_2
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->s()Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    invoke-virtual {v1}, LK1/q$a;->c()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    const/4 v3, 0x0

    .line 84
    const/4 v4, 0x1

    .line 85
    if-ne p3, v1, :cond_3

    .line 86
    .line 87
    move v1, v4

    .line 88
    goto :goto_1

    .line 89
    :cond_3
    move v1, v3

    .line 90
    :goto_1
    invoke-static {p1}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    invoke-virtual {v5}, Lcom/android/launcher3/H5;->J()Z

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    const-string v6, "launcher_mode"

    .line 99
    .line 100
    invoke-virtual {v0, v6, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 101
    .line 102
    .line 103
    const-string p3, "ON"

    .line 104
    .line 105
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    if-eqz p2, :cond_4

    .line 110
    .line 111
    const-string p2, "switch_to"

    .line 112
    .line 113
    invoke-virtual {v0, p2, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 114
    .line 115
    .line 116
    xor-int p2, v2, v1

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_4
    const-string p2, "exit"

    .line 120
    .line 121
    invoke-virtual {v0, p2, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 122
    .line 123
    .line 124
    xor-int p2, v2, v5

    .line 125
    .line 126
    :goto_2
    if-eqz p2, :cond_5

    .line 127
    .line 128
    new-instance p2, Lcom/zte/toolsdk/producer/ToolsParams$Builder;

    .line 129
    .line 130
    invoke-direct {p2}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;-><init>()V

    .line 131
    .line 132
    .line 133
    const-string p3, ""

    .line 134
    .line 135
    invoke-virtual {p2, p3}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->setText(Ljava/lang/String;)Lcom/zte/toolsdk/producer/ToolsParams$Builder;

    .line 136
    .line 137
    .line 138
    move-result-object p2

    .line 139
    iget-object p3, p0, Lcom/android/launcher3/aitools/SwitchLauncherModeExecutor;->mLauncher:Lcom/android/launcher3/C2;

    .line 140
    .line 141
    const v1, 0x7f140378

    .line 142
    .line 143
    .line 144
    invoke-virtual {p3, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p3

    .line 148
    invoke-virtual {p2, p3}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->setResponse(Ljava/lang/String;)Lcom/zte/toolsdk/producer/ToolsParams$Builder;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    invoke-virtual {p2, v4}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->setFinish(Z)Lcom/zte/toolsdk/producer/ToolsParams$Builder;

    .line 153
    .line 154
    .line 155
    move-result-object p2

    .line 156
    invoke-virtual {p2, v3}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->setShowChatWindow(Z)Lcom/zte/toolsdk/producer/ToolsParams$Builder;

    .line 157
    .line 158
    .line 159
    move-result-object p2

    .line 160
    invoke-virtual {p2}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->build()Lcom/zte/toolsdk/producer/ToolsParams;

    .line 161
    .line 162
    .line 163
    move-result-object p2

    .line 164
    iget-object p0, p0, Lcom/android/launcher3/aitools/SwitchLauncherModeExecutor;->mOnToolsResultListener:Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;

    .line 165
    .line 166
    invoke-interface {p0, p2}, Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;->onResultByToolsParams(Lcom/zte/toolsdk/producer/ToolsParams;)V

    .line 167
    .line 168
    .line 169
    :cond_5
    invoke-static {p1, v0}, LK1/q;->e(Landroid/content/Context;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    return-object p0
.end method


# virtual methods
.method public execute(Landroid/content/Context;Ljava/lang/String;Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;)V
    .locals 3

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "execute, json = "

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "SwitchLauncherModeExecutor"

    .line 19
    .line 20
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iput-object p3, p0, Lcom/android/launcher3/aitools/SwitchLauncherModeExecutor;->mOnToolsResultListener:Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;

    .line 24
    .line 25
    invoke-static {p2}, Lcom/android/launcher3/aitools/ToolsUtils;->getArgumentsFromJson(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Lcom/android/launcher3/aitools/ToolsUtils;->getActionFromJson(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-static {p1}, Lcom/android/launcher3/aitools/ToolsUtils;->getLauncherModeFromJson(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    iput-object p3, p0, Lcom/android/launcher3/aitools/SwitchLauncherModeExecutor;->mLauncher:Lcom/android/launcher3/C2;

    .line 42
    .line 43
    invoke-direct {p0, p3, p2, p1}, Lcom/android/launcher3/aitools/SwitchLauncherModeExecutor;->switchMode(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    const-string v0, "result_code"

    .line 48
    .line 49
    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result p3

    .line 53
    const-string v0, "ON"

    .line 54
    .line 55
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    const-string v0, ""

    .line 60
    .line 61
    if-eqz p2, :cond_1

    .line 62
    .line 63
    sget-object p2, LK1/q$b;->h:LK1/q$b;

    .line 64
    .line 65
    invoke-virtual {p2}, LK1/q$b;->c()I

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-ne p3, p2, :cond_0

    .line 70
    .line 71
    new-instance p2, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Lcom/android/launcher3/aitools/SwitchLauncherModeExecutor;->mLauncher:Lcom/android/launcher3/C2;

    .line 77
    .line 78
    const v2, 0x7f140069

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    goto :goto_0

    .line 96
    :cond_0
    sget-object p2, LK1/q$b;->j:LK1/q$b;

    .line 97
    .line 98
    invoke-virtual {p2}, LK1/q$b;->c()I

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    if-ne p3, p2, :cond_3

    .line 103
    .line 104
    new-instance p2, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Lcom/android/launcher3/aitools/SwitchLauncherModeExecutor;->mLauncher:Lcom/android/launcher3/C2;

    .line 110
    .line 111
    const v2, 0x7f140064

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    goto :goto_0

    .line 129
    :cond_1
    sget-object p2, LK1/q$b;->h:LK1/q$b;

    .line 130
    .line 131
    invoke-virtual {p2}, LK1/q$b;->c()I

    .line 132
    .line 133
    .line 134
    move-result p2

    .line 135
    if-ne p3, p2, :cond_2

    .line 136
    .line 137
    new-instance p2, Ljava/lang/StringBuilder;

    .line 138
    .line 139
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Lcom/android/launcher3/aitools/SwitchLauncherModeExecutor;->mLauncher:Lcom/android/launcher3/C2;

    .line 143
    .line 144
    const v2, 0x7f140068

    .line 145
    .line 146
    .line 147
    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    goto :goto_0

    .line 162
    :cond_2
    sget-object p2, LK1/q$b;->k:LK1/q$b;

    .line 163
    .line 164
    invoke-virtual {p2}, LK1/q$b;->c()I

    .line 165
    .line 166
    .line 167
    move-result p2

    .line 168
    if-ne p3, p2, :cond_3

    .line 169
    .line 170
    new-instance p2, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 173
    .line 174
    .line 175
    iget-object v1, p0, Lcom/android/launcher3/aitools/SwitchLauncherModeExecutor;->mLauncher:Lcom/android/launcher3/C2;

    .line 176
    .line 177
    const v2, 0x7f140063

    .line 178
    .line 179
    .line 180
    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    goto :goto_0

    .line 195
    :cond_3
    move-object p1, v0

    .line 196
    :goto_0
    sget-object p2, LK1/q$b;->i:LK1/q$b;

    .line 197
    .line 198
    invoke-virtual {p2}, LK1/q$b;->c()I

    .line 199
    .line 200
    .line 201
    move-result p2

    .line 202
    if-ne p3, p2, :cond_4

    .line 203
    .line 204
    iget-object p1, p0, Lcom/android/launcher3/aitools/SwitchLauncherModeExecutor;->mLauncher:Lcom/android/launcher3/C2;

    .line 205
    .line 206
    const p2, 0x7f140067

    .line 207
    .line 208
    .line 209
    invoke-virtual {p1, p2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/aitools/SwitchLauncherModeExecutor;->mOnToolsResultListener:Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;

    .line 214
    .line 215
    const/4 p2, 0x1

    .line 216
    invoke-interface {p0, v0, p1, p2}, Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;->onResult(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 217
    .line 218
    .line 219
    return-void
.end method

.method public initView()Z
    .locals 1

    .line 1
    const-string p0, "SwitchLauncherModeExecutor"

    .line 2
    .line 3
    const-string v0, "initView()"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public update(IILjava/lang/Object;Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;)V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p1, "update, viewId = "

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p1, "SwitchLauncherModeExecutor"

    .line 19
    .line 20
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public updateView()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
