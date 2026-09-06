.class public LK1/q;
.super Ljava/lang/Object;
.source "SettingsUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LK1/q$a;,
        LK1/q$b;
    }
.end annotation


# direct methods
.method public static a(Landroid/content/Context;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, LK1/q$a;->m:LK1/q$a;

    .line 7
    .line 8
    invoke-virtual {v1}, LK1/q$a;->c()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const-string v2, "launcher_mode"

    .line 13
    .line 14
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    const-string v1, "exit"

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 21
    .line 22
    .line 23
    invoke-static {p0, v0}, LK1/q;->e(Landroid/content/Context;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static b(Landroid/content/Context;)V
    .locals 5

    .line 1
    const-class v0, Lx1/C;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {}, Lx1/C;->g()Lx1/C;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lx1/C;->g()Lx1/C;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Lx1/C;->h()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    goto/16 :goto_1

    .line 25
    .line 26
    :cond_0
    move v1, v2

    .line 27
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    const-string v0, "SettingsUtils"

    .line 29
    .line 30
    new-instance v3, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v4, "startConciseAssistantOrNot: hasLoadingToast: "

    .line 36
    .line 37
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    invoke-static {p0}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v3, "showConciseAssistantOnce"

    .line 55
    .line 56
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    if-nez v1, :cond_1

    .line 63
    .line 64
    const-string v0, "SettingsUtils"

    .line 65
    .line 66
    const-string v1, "startConciseAssistantOrNot: save showConciseAssistantOnce false!"

    .line 67
    .line 68
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    invoke-static {p0}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const-string v1, "showConciseAssistantOnce"

    .line 80
    .line 81
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 86
    .line 87
    .line 88
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->x0()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_1

    .line 101
    .line 102
    const-string v0, "SettingsUtils"

    .line 103
    .line 104
    const-string v1, "startConciseAssistantOrNot: startAssistant!"

    .line 105
    .line 106
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    .line 108
    .line 109
    :try_start_1
    new-instance v0, Landroid/os/Bundle;

    .line 110
    .line 111
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 112
    .line 113
    .line 114
    const-string v1, "mfv_type"

    .line 115
    .line 116
    const-string v2, "desktop"

    .line 117
    .line 118
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    sget-object v1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 122
    .line 123
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 128
    .line 129
    invoke-virtual {p0, v0}, Lcom/android/quickstep/SystemUiProxy;->startConciseAssistantOnce(Landroid/os/Bundle;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :catch_0
    move-exception p0

    .line 134
    const-string v0, "SettingsUtils"

    .line 135
    .line 136
    new-instance v1, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 139
    .line 140
    .line 141
    const-string v2, "startConciseAssistantOrNot Exception:"

    .line 142
    .line 143
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    .line 155
    .line 156
    :cond_1
    return-void

    .line 157
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 158
    throw p0
.end method

.method public static c(Landroid/content/Context;Z)V
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "showConciseAssistantOnce"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const-class v0, Lx1/C;

    .line 15
    .line 16
    monitor-enter v0

    .line 17
    :try_start_0
    invoke-static {}, Lx1/C;->g()Lx1/C;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-static {}, Lx1/C;->g()Lx1/C;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Lx1/C;->h()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    const-string v0, "SettingsUtils"

    .line 39
    .line 40
    new-instance v1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string v3, "startHomeIfChangeConcise isLauncherResumed: "

    .line 46
    .line 47
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v3, " ,hasLoadingToast: "

    .line 54
    .line 55
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    if-nez p1, :cond_1

    .line 69
    .line 70
    if-nez v2, :cond_1

    .line 71
    .line 72
    new-instance p1, Landroid/content/Intent;

    .line 73
    .line 74
    const-string v0, "android.intent.action.MAIN"

    .line 75
    .line 76
    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 84
    .line 85
    .line 86
    const/high16 v0, 0x14000000

    .line 87
    .line 88
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 89
    .line 90
    .line 91
    const-string v0, "android.intent.category.HOME"

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 94
    .line 95
    .line 96
    :try_start_1
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :catch_0
    move-exception p0

    .line 101
    const-string p1, "SettingsUtils"

    .line 102
    .line 103
    const-string v0, "startHomeIfChangeConcise: start Home! "

    .line 104
    .line 105
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 106
    .line 107
    .line 108
    goto :goto_2

    .line 109
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 110
    throw p0

    .line 111
    :cond_1
    :goto_2
    return-void
.end method

.method public static d(Landroid/content/Context;ZZZZZZ)Z
    .locals 8

    .line 1
    const-string v0, "SettingsUtils"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "switchHomeLayout singleLayer: "

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v2, " ,easeMode: "

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v2, " ,conciseMode: "

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v2, " ,currentSingleMode: "

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v2, " ,currentEaseMode: "

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v2, " ,currentConciseMode: "

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, p6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    const-class v1, Lx1/C;

    .line 64
    .line 65
    monitor-enter v1

    .line 66
    :try_start_0
    invoke-static {}, Lx1/C;->g()Lx1/C;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    if-eqz v0, :cond_0

    .line 71
    .line 72
    invoke-static {}, Lx1/C;->g()Lx1/C;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Lx1/C;->h()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_0

    .line 81
    .line 82
    const-string p0, "SettingsUtils"

    .line 83
    .line 84
    const-string p1, "switchHomeLayout--loadingToast is show"

    .line 85
    .line 86
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    const/4 p0, 0x0

    .line 90
    monitor-exit v1

    .line 91
    return p0

    .line 92
    :catchall_0
    move-exception v0

    .line 93
    move-object p0, v0

    .line 94
    goto/16 :goto_6

    .line 95
    .line 96
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    invoke-static {p0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->s1()V

    .line 102
    .line 103
    .line 104
    if-eq p4, p1, :cond_1

    .line 105
    .line 106
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 107
    .line 108
    .line 109
    move-result-object p4

    .line 110
    invoke-virtual {p4}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 111
    .line 112
    .line 113
    move-result-object p4

    .line 114
    invoke-virtual {p4, p1}, Lcom/android/launcher3/H5;->w1(Z)V

    .line 115
    .line 116
    .line 117
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 118
    .line 119
    .line 120
    move-result-object p4

    .line 121
    invoke-virtual {p4, p1}, Lcom/android/launcher3/resource/B;->e(Z)V

    .line 122
    .line 123
    .line 124
    :cond_1
    if-eq p6, p3, :cond_2

    .line 125
    .line 126
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-static {p1, p3}, Lh1/a;->p(Landroid/content/Context;Z)V

    .line 131
    .line 132
    .line 133
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {p1, p3}, Lcom/android/launcher3/H5;->l1(Z)V

    .line 142
    .line 143
    .line 144
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-virtual {p1, p3}, Lcom/android/launcher3/resource/B;->b(Z)V

    .line 149
    .line 150
    .line 151
    :cond_2
    if-eq p5, p2, :cond_6

    .line 152
    .line 153
    const-string p1, "content://com.zte.easymode.settings.SettingsProvider"

    .line 154
    .line 155
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    const/4 p3, 0x0

    .line 160
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 161
    .line 162
    .line 163
    move-result-object p4

    .line 164
    invoke-virtual {p4, p1}, Landroid/content/ContentResolver;->acquireUnstableContentProviderClient(Landroid/net/Uri;)Landroid/content/ContentProviderClient;

    .line 165
    .line 166
    .line 167
    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 168
    if-eqz p1, :cond_3

    .line 169
    .line 170
    :try_start_2
    const-string p4, "com.zte.easymode.settings.SettingsProvider"

    .line 171
    .line 172
    const-string p5, "ease_mode_set"

    .line 173
    .line 174
    const-string p6, "mfvLauncher"

    .line 175
    .line 176
    invoke-virtual {p1, p4, p5, p6, p3}, Landroid/content/ContentProviderClient;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 177
    .line 178
    .line 179
    goto :goto_0

    .line 180
    :catchall_1
    move-exception v0

    .line 181
    move-object p0, v0

    .line 182
    move-object p3, p1

    .line 183
    goto :goto_4

    .line 184
    :catch_0
    move-exception v0

    .line 185
    move-object p3, v0

    .line 186
    goto :goto_2

    .line 187
    :cond_3
    :goto_0
    if-eqz p1, :cond_4

    .line 188
    .line 189
    :goto_1
    invoke-virtual {p1}, Landroid/content/ContentProviderClient;->release()Z

    .line 190
    .line 191
    .line 192
    goto :goto_3

    .line 193
    :catchall_2
    move-exception v0

    .line 194
    move-object p0, v0

    .line 195
    goto :goto_4

    .line 196
    :catch_1
    move-exception v0

    .line 197
    move-object p1, v0

    .line 198
    move-object v7, p3

    .line 199
    move-object p3, p1

    .line 200
    move-object p1, v7

    .line 201
    :goto_2
    :try_start_3
    invoke-virtual {p3}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 202
    .line 203
    .line 204
    if-eqz p1, :cond_4

    .line 205
    .line 206
    goto :goto_1

    .line 207
    :cond_4
    :goto_3
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    invoke-virtual {p1, p2}, Lcom/android/launcher3/resource/B;->c(Z)V

    .line 212
    .line 213
    .line 214
    goto :goto_5

    .line 215
    :goto_4
    if-eqz p3, :cond_5

    .line 216
    .line 217
    invoke-virtual {p3}, Landroid/content/ContentProviderClient;->release()Z

    .line 218
    .line 219
    .line 220
    :cond_5
    throw p0

    .line 221
    :cond_6
    :goto_5
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->d()V

    .line 226
    .line 227
    .line 228
    invoke-static {}, Lx1/O;->z5()Z

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    if-eqz p1, :cond_7

    .line 233
    .line 234
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    const/4 p2, 0x2

    .line 239
    const-wide/16 p3, 0xbb8

    .line 240
    .line 241
    invoke-static {p1, p2, p3, p4}, Lx1/O;->z4(Ljava/lang/String;IJ)V

    .line 242
    .line 243
    .line 244
    :cond_7
    sget-object p1, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 245
    .line 246
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    move-object v0, p1

    .line 251
    check-cast v0, Lcom/android/launcher3/F1;

    .line 252
    .line 253
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->q()Z

    .line 258
    .line 259
    .line 260
    move-result v5

    .line 261
    const/4 v6, 0x0

    .line 262
    const/4 v2, 0x1

    .line 263
    const/4 v3, 0x0

    .line 264
    const/4 v4, 0x1

    .line 265
    move-object v1, p0

    .line 266
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/F1;->q0(Landroid/content/Context;ZZZZZ)V

    .line 267
    .line 268
    .line 269
    const/4 p0, 0x1

    .line 270
    return p0

    .line 271
    :goto_6
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 272
    throw p0
.end method

.method public static e(Landroid/content/Context;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 18

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    new-instance v1, Landroid/os/Bundle;

    .line 4
    .line 5
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 6
    .line 7
    .line 8
    sget-object v2, LK1/q$a;->h:LK1/q$a;

    .line 9
    .line 10
    invoke-virtual {v2}, LK1/q$a;->c()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    sget-object v3, LK1/q$a;->i:LK1/q$a;

    .line 15
    .line 16
    invoke-virtual {v3}, LK1/q$a;->c()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    sget-object v4, LK1/q$a;->j:LK1/q$a;

    .line 21
    .line 22
    invoke-virtual {v4}, LK1/q$a;->c()I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    sget-object v5, LK1/q$a;->k:LK1/q$a;

    .line 27
    .line 28
    invoke-virtual {v5}, LK1/q$a;->c()I

    .line 29
    .line 30
    .line 31
    sget-object v5, LK1/q$a;->l:LK1/q$a;

    .line 32
    .line 33
    invoke-virtual {v5}, LK1/q$a;->c()I

    .line 34
    .line 35
    .line 36
    sget-object v5, LK1/q$a;->m:LK1/q$a;

    .line 37
    .line 38
    invoke-virtual {v5}, LK1/q$a;->c()I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    const-string v6, "launcher_mode"

    .line 43
    .line 44
    const/4 v7, -0x1

    .line 45
    invoke-virtual {v0, v6, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    const-string v7, "switch_to"

    .line 50
    .line 51
    const/4 v8, 0x0

    .line 52
    invoke-virtual {v0, v7, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 53
    .line 54
    .line 55
    move-result v7

    .line 56
    const-string v9, "exit"

    .line 57
    .line 58
    invoke-virtual {v0, v9, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    new-instance v9, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    const-string v10, "switchLauncherMode callingPid: "

    .line 68
    .line 69
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    .line 73
    .line 74
    .line 75
    move-result v10

    .line 76
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v10, " ,extraMode: "

    .line 80
    .line 81
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v10, " ,switchTo: "

    .line 88
    .line 89
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string v10, " ,exit: "

    .line 96
    .line 97
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v9

    .line 107
    const-string v10, "SettingsUtils"

    .line 108
    .line 109
    invoke-static {v10, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    const-string v9, "result_code"

    .line 113
    .line 114
    if-lt v6, v2, :cond_1e

    .line 115
    .line 116
    if-le v6, v5, :cond_0

    .line 117
    .line 118
    goto/16 :goto_2

    .line 119
    .line 120
    :cond_0
    if-ne v6, v5, :cond_1

    .line 121
    .line 122
    invoke-static {}, Lx1/O;->A3()Ljava/lang/Boolean;

    .line 123
    .line 124
    .line 125
    move-result-object v10

    .line 126
    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    .line 127
    .line 128
    .line 129
    move-result v10

    .line 130
    if-nez v10, :cond_1

    .line 131
    .line 132
    sget-object v0, LK1/q$b;->l:LK1/q$b;

    .line 133
    .line 134
    invoke-virtual {v0}, LK1/q$b;->c()I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    invoke-virtual {v1, v9, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 139
    .line 140
    .line 141
    return-object v1

    .line 142
    :cond_1
    if-ne v6, v4, :cond_3

    .line 143
    .line 144
    const-string v10, "com.zte.easymode"

    .line 145
    .line 146
    move-object/from16 v11, p0

    .line 147
    .line 148
    invoke-static {v11, v10}, Lx1/O;->h1(Landroid/content/Context;Ljava/lang/String;)Z

    .line 149
    .line 150
    .line 151
    move-result v10

    .line 152
    if-eqz v10, :cond_2

    .line 153
    .line 154
    invoke-static {v11}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 155
    .line 156
    .line 157
    move-result-object v10

    .line 158
    invoke-virtual {v10}, Lcom/android/launcher3/H5;->G0()Z

    .line 159
    .line 160
    .line 161
    move-result v10

    .line 162
    if-nez v10, :cond_4

    .line 163
    .line 164
    :cond_2
    sget-object v0, LK1/q$b;->l:LK1/q$b;

    .line 165
    .line 166
    invoke-virtual {v0}, LK1/q$b;->c()I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    invoke-virtual {v1, v9, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 171
    .line 172
    .line 173
    return-object v1

    .line 174
    :cond_3
    move-object/from16 v11, p0

    .line 175
    .line 176
    :cond_4
    invoke-static {v11}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 177
    .line 178
    .line 179
    move-result-object v10

    .line 180
    invoke-virtual {v10}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 181
    .line 182
    .line 183
    move-result-object v10

    .line 184
    invoke-virtual {v10}, Lcom/android/launcher3/H5;->M0()Z

    .line 185
    .line 186
    .line 187
    move-result v15

    .line 188
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 189
    .line 190
    .line 191
    move-result-object v10

    .line 192
    invoke-virtual {v10}, Lcom/android/launcher3/resource/B;->s()Z

    .line 193
    .line 194
    .line 195
    move-result v10

    .line 196
    const/4 v12, 0x1

    .line 197
    if-eqz v10, :cond_5

    .line 198
    .line 199
    move/from16 v17, v8

    .line 200
    .line 201
    move/from16 v16, v12

    .line 202
    .line 203
    goto :goto_0

    .line 204
    :cond_5
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 205
    .line 206
    .line 207
    move-result-object v10

    .line 208
    invoke-virtual {v10}, Lcom/android/launcher3/resource/B;->p()Z

    .line 209
    .line 210
    .line 211
    move-result v10

    .line 212
    if-eqz v10, :cond_6

    .line 213
    .line 214
    move/from16 v16, v8

    .line 215
    .line 216
    move/from16 v17, v12

    .line 217
    .line 218
    goto :goto_0

    .line 219
    :cond_6
    move/from16 v16, v8

    .line 220
    .line 221
    move/from16 v17, v16

    .line 222
    .line 223
    :goto_0
    if-eq v6, v2, :cond_7

    .line 224
    .line 225
    if-ne v6, v3, :cond_a

    .line 226
    .line 227
    :cond_7
    invoke-static {v11}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 228
    .line 229
    .line 230
    move-result-object v10

    .line 231
    invoke-virtual {v10}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 232
    .line 233
    .line 234
    move-result-object v10

    .line 235
    iget-boolean v10, v10, Lcom/android/launcher3/r4;->g:Z

    .line 236
    .line 237
    if-nez v10, :cond_a

    .line 238
    .line 239
    if-ne v6, v2, :cond_8

    .line 240
    .line 241
    if-eqz v15, :cond_9

    .line 242
    .line 243
    :cond_8
    if-ne v6, v3, :cond_a

    .line 244
    .line 245
    if-eqz v15, :cond_a

    .line 246
    .line 247
    :cond_9
    sget-object v0, LK1/q$b;->l:LK1/q$b;

    .line 248
    .line 249
    invoke-virtual {v0}, LK1/q$b;->c()I

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    invoke-virtual {v1, v9, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 254
    .line 255
    .line 256
    return-object v1

    .line 257
    :cond_a
    invoke-static {v11}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 258
    .line 259
    .line 260
    move-result-object v10

    .line 261
    if-eqz v7, :cond_13

    .line 262
    .line 263
    if-ne v6, v5, :cond_c

    .line 264
    .line 265
    if-eqz v17, :cond_b

    .line 266
    .line 267
    sget-object v0, LK1/q$b;->j:LK1/q$b;

    .line 268
    .line 269
    invoke-virtual {v0}, LK1/q$b;->c()I

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    invoke-virtual {v1, v9, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 274
    .line 275
    .line 276
    return-object v1

    .line 277
    :cond_b
    const/4 v13, 0x0

    .line 278
    const/4 v14, 0x1

    .line 279
    const/4 v12, 0x0

    .line 280
    invoke-static/range {v11 .. v17}, LK1/q;->d(Landroid/content/Context;ZZZZZZ)Z

    .line 281
    .line 282
    .line 283
    move-result v8

    .line 284
    goto/16 :goto_1

    .line 285
    .line 286
    :cond_c
    if-ne v6, v4, :cond_e

    .line 287
    .line 288
    if-eqz v16, :cond_d

    .line 289
    .line 290
    sget-object v0, LK1/q$b;->j:LK1/q$b;

    .line 291
    .line 292
    invoke-virtual {v0}, LK1/q$b;->c()I

    .line 293
    .line 294
    .line 295
    move-result v0

    .line 296
    invoke-virtual {v1, v9, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 297
    .line 298
    .line 299
    return-object v1

    .line 300
    :cond_d
    const/4 v13, 0x1

    .line 301
    const/4 v14, 0x0

    .line 302
    const/4 v12, 0x1

    .line 303
    move-object/from16 v11, p0

    .line 304
    .line 305
    invoke-static/range {v11 .. v17}, LK1/q;->d(Landroid/content/Context;ZZZZZZ)Z

    .line 306
    .line 307
    .line 308
    move-result v8

    .line 309
    goto/16 :goto_1

    .line 310
    .line 311
    :cond_e
    if-ne v6, v2, :cond_10

    .line 312
    .line 313
    if-eqz v15, :cond_f

    .line 314
    .line 315
    if-nez v16, :cond_f

    .line 316
    .line 317
    sget-object v0, LK1/q$b;->j:LK1/q$b;

    .line 318
    .line 319
    invoke-virtual {v0}, LK1/q$b;->c()I

    .line 320
    .line 321
    .line 322
    move-result v0

    .line 323
    invoke-virtual {v1, v9, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 324
    .line 325
    .line 326
    return-object v1

    .line 327
    :cond_f
    const/4 v13, 0x0

    .line 328
    const/4 v14, 0x0

    .line 329
    const/4 v12, 0x1

    .line 330
    move-object/from16 v11, p0

    .line 331
    .line 332
    invoke-static/range {v11 .. v17}, LK1/q;->d(Landroid/content/Context;ZZZZZZ)Z

    .line 333
    .line 334
    .line 335
    move-result v8

    .line 336
    goto/16 :goto_1

    .line 337
    .line 338
    :cond_10
    if-ne v6, v3, :cond_12

    .line 339
    .line 340
    if-nez v15, :cond_11

    .line 341
    .line 342
    sget-object v0, LK1/q$b;->j:LK1/q$b;

    .line 343
    .line 344
    invoke-virtual {v0}, LK1/q$b;->c()I

    .line 345
    .line 346
    .line 347
    move-result v0

    .line 348
    invoke-virtual {v1, v9, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 349
    .line 350
    .line 351
    return-object v1

    .line 352
    :cond_11
    const/4 v13, 0x0

    .line 353
    const/4 v14, 0x0

    .line 354
    const/4 v12, 0x0

    .line 355
    move-object/from16 v11, p0

    .line 356
    .line 357
    invoke-static/range {v11 .. v17}, LK1/q;->d(Landroid/content/Context;ZZZZZZ)Z

    .line 358
    .line 359
    .line 360
    move-result v8

    .line 361
    goto/16 :goto_1

    .line 362
    .line 363
    :cond_12
    sget-object v0, LK1/q$b;->l:LK1/q$b;

    .line 364
    .line 365
    invoke-virtual {v0}, LK1/q$b;->c()I

    .line 366
    .line 367
    .line 368
    move-result v0

    .line 369
    invoke-virtual {v1, v9, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 370
    .line 371
    .line 372
    return-object v1

    .line 373
    :cond_13
    if-eqz v0, :cond_1c

    .line 374
    .line 375
    invoke-virtual {v10}, Lcom/android/launcher3/H5;->m0()Z

    .line 376
    .line 377
    .line 378
    move-result v12

    .line 379
    invoke-virtual {v10}, Lcom/android/launcher3/H5;->J()Z

    .line 380
    .line 381
    .line 382
    move-result v13

    .line 383
    invoke-virtual {v10}, Lcom/android/launcher3/H5;->z()Z

    .line 384
    .line 385
    .line 386
    move-result v14

    .line 387
    if-ne v6, v5, :cond_15

    .line 388
    .line 389
    if-eqz v17, :cond_14

    .line 390
    .line 391
    move-object/from16 v11, p0

    .line 392
    .line 393
    invoke-static/range {v11 .. v17}, LK1/q;->d(Landroid/content/Context;ZZZZZZ)Z

    .line 394
    .line 395
    .line 396
    move-result v8

    .line 397
    goto :goto_1

    .line 398
    :cond_14
    sget-object v0, LK1/q$b;->k:LK1/q$b;

    .line 399
    .line 400
    invoke-virtual {v0}, LK1/q$b;->c()I

    .line 401
    .line 402
    .line 403
    move-result v0

    .line 404
    invoke-virtual {v1, v9, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 405
    .line 406
    .line 407
    return-object v1

    .line 408
    :cond_15
    if-ne v6, v4, :cond_17

    .line 409
    .line 410
    if-eqz v16, :cond_16

    .line 411
    .line 412
    move-object/from16 v11, p0

    .line 413
    .line 414
    invoke-static/range {v11 .. v17}, LK1/q;->d(Landroid/content/Context;ZZZZZZ)Z

    .line 415
    .line 416
    .line 417
    move-result v8

    .line 418
    goto :goto_1

    .line 419
    :cond_16
    sget-object v0, LK1/q$b;->k:LK1/q$b;

    .line 420
    .line 421
    invoke-virtual {v0}, LK1/q$b;->c()I

    .line 422
    .line 423
    .line 424
    move-result v0

    .line 425
    invoke-virtual {v1, v9, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 426
    .line 427
    .line 428
    return-object v1

    .line 429
    :cond_17
    if-ne v6, v2, :cond_19

    .line 430
    .line 431
    if-eqz v15, :cond_18

    .line 432
    .line 433
    move-object/from16 v11, p0

    .line 434
    .line 435
    invoke-static/range {v11 .. v17}, LK1/q;->d(Landroid/content/Context;ZZZZZZ)Z

    .line 436
    .line 437
    .line 438
    move-result v8

    .line 439
    goto :goto_1

    .line 440
    :cond_18
    sget-object v0, LK1/q$b;->k:LK1/q$b;

    .line 441
    .line 442
    invoke-virtual {v0}, LK1/q$b;->c()I

    .line 443
    .line 444
    .line 445
    move-result v0

    .line 446
    invoke-virtual {v1, v9, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 447
    .line 448
    .line 449
    return-object v1

    .line 450
    :cond_19
    if-ne v6, v3, :cond_1b

    .line 451
    .line 452
    if-nez v15, :cond_1a

    .line 453
    .line 454
    move-object/from16 v11, p0

    .line 455
    .line 456
    invoke-static/range {v11 .. v17}, LK1/q;->d(Landroid/content/Context;ZZZZZZ)Z

    .line 457
    .line 458
    .line 459
    move-result v8

    .line 460
    goto :goto_1

    .line 461
    :cond_1a
    sget-object v0, LK1/q$b;->k:LK1/q$b;

    .line 462
    .line 463
    invoke-virtual {v0}, LK1/q$b;->c()I

    .line 464
    .line 465
    .line 466
    move-result v0

    .line 467
    invoke-virtual {v1, v9, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 468
    .line 469
    .line 470
    return-object v1

    .line 471
    :cond_1b
    sget-object v0, LK1/q$b;->l:LK1/q$b;

    .line 472
    .line 473
    invoke-virtual {v0}, LK1/q$b;->c()I

    .line 474
    .line 475
    .line 476
    move-result v0

    .line 477
    invoke-virtual {v1, v9, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 478
    .line 479
    .line 480
    return-object v1

    .line 481
    :cond_1c
    :goto_1
    if-nez v8, :cond_1d

    .line 482
    .line 483
    sget-object v0, LK1/q$b;->i:LK1/q$b;

    .line 484
    .line 485
    invoke-virtual {v0}, LK1/q$b;->c()I

    .line 486
    .line 487
    .line 488
    move-result v0

    .line 489
    invoke-virtual {v1, v9, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 490
    .line 491
    .line 492
    return-object v1

    .line 493
    :cond_1d
    sget-object v0, LK1/q$b;->h:LK1/q$b;

    .line 494
    .line 495
    invoke-virtual {v0}, LK1/q$b;->c()I

    .line 496
    .line 497
    .line 498
    move-result v0

    .line 499
    invoke-virtual {v1, v9, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 500
    .line 501
    .line 502
    return-object v1

    .line 503
    :cond_1e
    :goto_2
    sget-object v0, LK1/q$b;->l:LK1/q$b;

    .line 504
    .line 505
    invoke-virtual {v0}, LK1/q$b;->c()I

    .line 506
    .line 507
    .line 508
    move-result v0

    .line 509
    invoke-virtual {v1, v9, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 510
    .line 511
    .line 512
    return-object v1
.end method
