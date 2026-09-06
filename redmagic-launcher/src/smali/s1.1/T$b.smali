.class Ls1/T$b;
.super Landroid/content/BroadcastReceiver;
.source "IconProvider.java"

# interfaces
.implements Lcom/android/launcher3/util/a2;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ls1/T;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "b"
.end annotation


# instance fields
.field private final g:Ls1/T$a;

.field final synthetic h:Ls1/T;


# direct methods
.method constructor <init>(Ls1/T;Ls1/T$a;Landroid/os/Handler;)V
    .locals 6

    .line 1
    iput-object p1, p0, Ls1/T$b;->h:Ls1/T;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ls1/T$b;->g:Ls1/T$a;

    .line 7
    .line 8
    invoke-static {p1}, Ls1/T;->a(Ls1/T;)Landroid/content/ComponentName;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    invoke-static {p1}, Ls1/T;->b(Ls1/T;)Landroid/content/ComponentName;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    if-eqz p2, :cond_3

    .line 19
    .line 20
    :cond_0
    new-instance v2, Landroid/content/IntentFilter;

    .line 21
    .line 22
    const-string p2, "android.intent.action.TIMEZONE_CHANGED"

    .line 23
    .line 24
    invoke-direct {v2, p2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const-string p2, "android.intent.action.TIME_TICK"

    .line 28
    .line 29
    invoke-virtual {v2, p2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p1}, Ls1/T;->a(Ls1/T;)Landroid/content/ComponentName;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    if-eqz p2, :cond_1

    .line 37
    .line 38
    const-string p2, "android.intent.action.TIME_SET"

    .line 39
    .line 40
    invoke-virtual {v2, p2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const-string p2, "android.intent.action.DATE_CHANGED"

    .line 44
    .line 45
    invoke-virtual {v2, p2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object v0, p1, Ls1/T;->a:Landroid/content/Context;

    .line 49
    .line 50
    const/4 v3, 0x0

    .line 51
    const/4 v5, 0x2

    .line 52
    move-object v1, p0

    .line 53
    move-object v4, p3

    .line 54
    invoke-virtual/range {v0 .. v5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    .line 55
    .line 56
    .line 57
    new-instance p0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    const-string p2, "IconChangeReceiver: register receiver, calendar: "

    .line 63
    .line 64
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-static {p1}, Ls1/T;->a(Ls1/T;)Landroid/content/ComponentName;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const-string p2, "IconProvider"

    .line 79
    .line 80
    invoke-static {p2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    invoke-static {p1}, Ls1/T;->a(Ls1/T;)Landroid/content/ComponentName;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    if-eqz p0, :cond_2

    .line 88
    .line 89
    iget-object p0, p1, Ls1/T;->a:Landroid/content/Context;

    .line 90
    .line 91
    const-class p2, Landroid/os/UserManager;

    .line 92
    .line 93
    invoke-virtual {p0, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    check-cast p0, Landroid/os/UserManager;

    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/os/UserManager;->getUserProfiles()Ljava/util/List;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    if-eqz p2, :cond_2

    .line 112
    .line 113
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    check-cast p2, Landroid/os/UserHandle;

    .line 118
    .line 119
    iget-object p3, v1, Ls1/T$b;->g:Ls1/T$a;

    .line 120
    .line 121
    invoke-static {p1}, Ls1/T;->a(Ls1/T;)Landroid/content/ComponentName;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-interface {p3, v0, p2}, Ls1/T$a;->onAppIconChanged(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 130
    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_2
    invoke-static {p1}, Ls1/T;->b(Ls1/T;)Landroid/content/ComponentName;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    if-eqz p0, :cond_3

    .line 138
    .line 139
    iget-object p0, v1, Ls1/T$b;->g:Ls1/T$a;

    .line 140
    .line 141
    invoke-static {p1}, Ls1/T;->b(Ls1/T;)Landroid/content/ComponentName;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    invoke-interface {p0, p1, p2}, Ls1/T$a;->onAppIconChanged(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 154
    .line 155
    .line 156
    :cond_3
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ls1/T$b;->h:Ls1/T;

    .line 2
    .line 3
    iget-object v0, v0, Ls1/T;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ls1/T$b;->g:Ls1/T$a;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ls1/T$a;->dataCollection(Landroid/content/Intent;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "android.intent.action.TIMEZONE_CHANGED"

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const-string v2, "IconProvider"

    .line 17
    .line 18
    const-string v3, "android.intent.action.DATE_CHANGED"

    .line 19
    .line 20
    const-string v4, "android.intent.action.TIME_SET"

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    const-string v5, "onReceive: action: "

    .line 50
    .line 51
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v5, ", calendar: "

    .line 62
    .line 63
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-object v5, p0, Ls1/T$b;->h:Ls1/T;

    .line 67
    .line 68
    invoke-static {v5}, Ls1/T;->a(Ls1/T;)Landroid/content/ComponentName;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 87
    .line 88
    .line 89
    const/16 v5, 0x3e7

    .line 90
    .line 91
    const-class v6, Landroid/os/UserManager;

    .line 92
    .line 93
    const/4 v7, -0x1

    .line 94
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 95
    .line 96
    .line 97
    move-result v8

    .line 98
    sparse-switch v8, :sswitch_data_0

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :sswitch_0
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-nez v0, :cond_2

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_2
    const/4 v7, 0x3

    .line 110
    goto :goto_0

    .line 111
    :sswitch_1
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-nez v0, :cond_3

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_3
    const/4 v7, 0x2

    .line 119
    goto :goto_0

    .line 120
    :sswitch_2
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-nez v0, :cond_4

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_4
    const/4 v7, 0x1

    .line 128
    goto :goto_0

    .line 129
    :sswitch_3
    const-string v8, "android.intent.action.TIME_TICK"

    .line 130
    .line 131
    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-nez v0, :cond_5

    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_5
    const/4 v7, 0x0

    .line 139
    :goto_0
    packed-switch v7, :pswitch_data_0

    .line 140
    .line 141
    .line 142
    goto/16 :goto_3

    .line 143
    .line 144
    :pswitch_0
    iget-object v0, p0, Ls1/T$b;->h:Ls1/T;

    .line 145
    .line 146
    invoke-static {v0}, Ls1/T;->a(Ls1/T;)Landroid/content/ComponentName;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    if-eqz v0, :cond_9

    .line 151
    .line 152
    invoke-virtual {p1, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    check-cast p1, Landroid/os/UserManager;

    .line 157
    .line 158
    invoke-virtual {p1}, Landroid/os/UserManager;->getUserProfiles()Ljava/util/List;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    if-eqz v0, :cond_9

    .line 171
    .line 172
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    check-cast v0, Landroid/os/UserHandle;

    .line 177
    .line 178
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 179
    .line 180
    .line 181
    move-result-object v6

    .line 182
    invoke-virtual {v6, v0}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 183
    .line 184
    .line 185
    move-result v6

    .line 186
    if-ne v5, v6, :cond_6

    .line 187
    .line 188
    goto :goto_1

    .line 189
    :cond_6
    iget-object v6, p0, Ls1/T$b;->g:Ls1/T$a;

    .line 190
    .line 191
    iget-object v7, p0, Ls1/T$b;->h:Ls1/T;

    .line 192
    .line 193
    invoke-static {v7}, Ls1/T;->a(Ls1/T;)Landroid/content/ComponentName;

    .line 194
    .line 195
    .line 196
    move-result-object v7

    .line 197
    invoke-virtual {v7}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v7

    .line 201
    invoke-interface {v6, v7, v0}, Ls1/T$a;->onAppIconChanged(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 202
    .line 203
    .line 204
    goto :goto_1

    .line 205
    :pswitch_1
    iget-object v0, p0, Ls1/T$b;->h:Ls1/T;

    .line 206
    .line 207
    invoke-static {v0}, Ls1/T;->a(Ls1/T;)Landroid/content/ComponentName;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    if-eqz v0, :cond_8

    .line 212
    .line 213
    invoke-virtual {p1, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    check-cast p1, Landroid/os/UserManager;

    .line 218
    .line 219
    invoke-virtual {p1}, Landroid/os/UserManager;->getUserProfiles()Ljava/util/List;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    if-eqz v0, :cond_8

    .line 232
    .line 233
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    check-cast v0, Landroid/os/UserHandle;

    .line 238
    .line 239
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 240
    .line 241
    .line 242
    move-result-object v6

    .line 243
    invoke-virtual {v6, v0}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 244
    .line 245
    .line 246
    move-result v6

    .line 247
    if-ne v5, v6, :cond_7

    .line 248
    .line 249
    goto :goto_2

    .line 250
    :cond_7
    iget-object v6, p0, Ls1/T$b;->g:Ls1/T$a;

    .line 251
    .line 252
    iget-object v7, p0, Ls1/T$b;->h:Ls1/T;

    .line 253
    .line 254
    invoke-static {v7}, Ls1/T;->a(Ls1/T;)Landroid/content/ComponentName;

    .line 255
    .line 256
    .line 257
    move-result-object v7

    .line 258
    invoke-virtual {v7}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v7

    .line 262
    invoke-interface {v6, v7, v0}, Ls1/T$a;->onAppIconChanged(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 263
    .line 264
    .line 265
    goto :goto_2

    .line 266
    :cond_8
    :pswitch_2
    iget-object p1, p0, Ls1/T$b;->h:Ls1/T;

    .line 267
    .line 268
    invoke-static {p1}, Ls1/T;->b(Ls1/T;)Landroid/content/ComponentName;

    .line 269
    .line 270
    .line 271
    move-result-object p1

    .line 272
    if-eqz p1, :cond_9

    .line 273
    .line 274
    iget-object p1, p0, Ls1/T$b;->g:Ls1/T$a;

    .line 275
    .line 276
    iget-object p0, p0, Ls1/T$b;->h:Ls1/T;

    .line 277
    .line 278
    invoke-static {p0}, Ls1/T;->b(Ls1/T;)Landroid/content/ComponentName;

    .line 279
    .line 280
    .line 281
    move-result-object p0

    .line 282
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    invoke-interface {p1, p0, v0}, Ls1/T$a;->onAppIconChanged(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 291
    .line 292
    .line 293
    :cond_9
    :goto_3
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object p0

    .line 297
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result p0

    .line 301
    if-nez p0, :cond_b

    .line 302
    .line 303
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object p0

    .line 307
    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 308
    .line 309
    .line 310
    move-result p0

    .line 311
    if-nez p0, :cond_b

    .line 312
    .line 313
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object p0

    .line 317
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 318
    .line 319
    .line 320
    move-result p0

    .line 321
    if-eqz p0, :cond_a

    .line 322
    .line 323
    goto :goto_4

    .line 324
    :cond_a
    return-void

    .line 325
    :cond_b
    :goto_4
    const-string p0, "onReceive: finished"

    .line 326
    .line 327
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    .line 329
    .line 330
    return-void

    .line 331
    :sswitch_data_0
    .sparse-switch
        -0x5a2f0b56 -> :sswitch_3
        0x1df32313 -> :sswitch_2
        0x1e1f7f95 -> :sswitch_1
        0x3e117848 -> :sswitch_0
    .end sparse-switch

    .line 332
    .line 333
    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    .line 339
    .line 340
    .line 341
    .line 342
    .line 343
    .line 344
    .line 345
    .line 346
    .line 347
    .line 348
    .line 349
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
