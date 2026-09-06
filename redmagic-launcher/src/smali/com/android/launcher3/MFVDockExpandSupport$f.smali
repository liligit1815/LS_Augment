.class Lcom/android/launcher3/MFVDockExpandSupport$f;
.super Ljava/lang/Object;
.source "MFVDockExpandSupport.java"

# interfaces
.implements Lcom/android/launcher3/anim/C$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/MFVDockExpandSupport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "f"
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/MFVDockExpandSupport;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/MFVDockExpandSupport;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/MFVDockExpandSupport$f;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p0, "MFVDockExpandSupport"

    .line 7
    .line 8
    const-string p1, "recentApp: Initial AppActivityEventCallBack"

    .line 9
    .line 10
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public notifiyActivityEvent(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "recentApp: Get activitity event: eventId = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " pkgName = "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, " activity = "

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p3, " userId = "

    .line 31
    .line 32
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    const-string v0, "MFVDockExpandSupport"

    .line 43
    .line 44
    invoke-static {v0, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    const/16 p3, 0x10

    .line 48
    .line 49
    const/16 v1, 0x80

    .line 50
    .line 51
    if-eq p1, v1, :cond_0

    .line 52
    .line 53
    if-eq p1, p3, :cond_0

    .line 54
    .line 55
    goto/16 :goto_1

    .line 56
    .line 57
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/MFVDockExpandSupport$f;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 58
    .line 59
    invoke-static {v2}, Lcom/android/launcher3/MFVDockExpandSupport;->c(Lcom/android/launcher3/MFVDockExpandSupport;)Lcom/android/launcher3/MFVDockExpandSupport$f;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    if-nez v2, :cond_1

    .line 64
    .line 65
    const-string p0, "recentApp: mBinderForTopAty is null, return!!"

    .line 66
    .line 67
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    if-ne p1, v1, :cond_4

    .line 72
    .line 73
    sget-object v2, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 74
    .line 75
    iget-object v3, p0, Lcom/android/launcher3/MFVDockExpandSupport$f;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 76
    .line 77
    iget-object v3, v3, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 78
    .line 79
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, LD1/t;

    .line 84
    .line 85
    invoke-virtual {v2}, LD1/t;->p()Ljava/util/List;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    const/4 v3, 0x0

    .line 94
    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    if-eqz v4, :cond_3

    .line 99
    .line 100
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    check-cast v4, Landroid/os/UserHandle;

    .line 105
    .line 106
    invoke-static {p4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 107
    .line 108
    .line 109
    move-result v5

    .line 110
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 111
    .line 112
    .line 113
    move-result-object v6

    .line 114
    invoke-virtual {v6, v4}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 115
    .line 116
    .line 117
    move-result v6

    .line 118
    if-ne v5, v6, :cond_2

    .line 119
    .line 120
    move-object v3, v4

    .line 121
    goto :goto_0

    .line 122
    :cond_3
    iget-object v2, p0, Lcom/android/launcher3/MFVDockExpandSupport$f;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 123
    .line 124
    invoke-virtual {v2, p2, v3}, Lcom/android/launcher3/MFVDockExpandSupport;->n(Ljava/lang/String;Landroid/os/UserHandle;)Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    new-instance v3, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 131
    .line 132
    .line 133
    const-string v4, "recentApp: AM_COMPLETE_RESUME generateDataSuccess="

    .line 134
    .line 135
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    .line 147
    .line 148
    if-nez v2, :cond_4

    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 154
    .line 155
    .line 156
    const-string v3, "recentApp: mIsClickFromLauncher="

    .line 157
    .line 158
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    iget-object v3, p0, Lcom/android/launcher3/MFVDockExpandSupport$f;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 162
    .line 163
    invoke-static {v3}, Lcom/android/launcher3/MFVDockExpandSupport;->d(Lcom/android/launcher3/MFVDockExpandSupport;)Z

    .line 164
    .line 165
    .line 166
    move-result v3

    .line 167
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    .line 176
    .line 177
    iget-object v2, p0, Lcom/android/launcher3/MFVDockExpandSupport$f;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 178
    .line 179
    invoke-static {v2}, Lcom/android/launcher3/MFVDockExpandSupport;->d(Lcom/android/launcher3/MFVDockExpandSupport;)Z

    .line 180
    .line 181
    .line 182
    move-result v2

    .line 183
    const/4 v3, 0x0

    .line 184
    if-eqz v2, :cond_6

    .line 185
    .line 186
    iget-object p4, p0, Lcom/android/launcher3/MFVDockExpandSupport$f;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 187
    .line 188
    iget-object p4, p4, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 189
    .line 190
    invoke-virtual {p4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p4

    .line 194
    invoke-virtual {p4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result p2

    .line 198
    if-eqz p2, :cond_5

    .line 199
    .line 200
    if-ne p1, p3, :cond_5

    .line 201
    .line 202
    const-string p1, "recentApp: AM_STOP_ACTIVITY!"

    .line 203
    .line 204
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    .line 206
    .line 207
    iget-object p1, p0, Lcom/android/launcher3/MFVDockExpandSupport$f;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 208
    .line 209
    invoke-virtual {p1, v3}, Lcom/android/launcher3/MFVDockExpandSupport;->y(Z)V

    .line 210
    .line 211
    .line 212
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport$f;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 213
    .line 214
    invoke-static {p0, v3}, Lcom/android/launcher3/MFVDockExpandSupport;->e(Lcom/android/launcher3/MFVDockExpandSupport;Z)V

    .line 215
    .line 216
    .line 217
    :cond_5
    :goto_1
    return-void

    .line 218
    :cond_6
    if-ne p1, v1, :cond_7

    .line 219
    .line 220
    iget-object p1, p0, Lcom/android/launcher3/MFVDockExpandSupport$f;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 221
    .line 222
    iget-object p1, p1, Lcom/android/launcher3/MFVDockExpandSupport;->a:Landroid/content/Context;

    .line 223
    .line 224
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    if-nez p1, :cond_7

    .line 233
    .line 234
    iget-object p1, p0, Lcom/android/launcher3/MFVDockExpandSupport$f;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 235
    .line 236
    invoke-virtual {p1, p4, p2}, Lcom/android/launcher3/MFVDockExpandSupport;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    :cond_7
    iget-object p0, p0, Lcom/android/launcher3/MFVDockExpandSupport$f;->a:Lcom/android/launcher3/MFVDockExpandSupport;

    .line 240
    .line 241
    invoke-virtual {p0, v3}, Lcom/android/launcher3/MFVDockExpandSupport;->y(Z)V

    .line 242
    .line 243
    .line 244
    return-void
.end method
