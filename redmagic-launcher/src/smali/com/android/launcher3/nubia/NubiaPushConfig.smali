.class public Lcom/android/launcher3/nubia/NubiaPushConfig;
.super Ljava/lang/Object;
.source "NubiaPushConfig.java"


# static fields
.field public static final BADGE_MSG:Ljava/lang/String; = "1"

.field public static final BADGE_NUMBER:I = 0x1

.field public static final DEFAULT_BG_COLOR:I = 0x0

.field private static final KEY_BG_COLOR:Ljava/lang/String; = "bgColor"

.field private static final KEY_CLS_NAME:Ljava/lang/String; = "className"

.field private static final KEY_DEEP_LINK:Ljava/lang/String; = "deepLink"

.field private static final KEY_DISPLAY_STYLE:Ljava/lang/String; = "displayStyle"

.field private static final KEY_END_TIME:Ljava/lang/String; = "endTime"

.field private static final KEY_MSG:Ljava/lang/String; = "msg"

.field public static final KEY_PKG_NAME:Ljava/lang/String; = "packageName"

.field private static final KEY_PUSH_ID:Ljava/lang/String; = "pushId"

.field private static final TAG:Ljava/lang/String; = "NubiaPushConfig"

.field private static final VALUE_DISPLAY_STYLE_BADGE:I = 0x0

.field private static final VALUE_DISPLAY_STYLE_BANNER:I = 0x1


# instance fields
.field private bgColor:I

.field private clickDates:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private componentName:Landroid/content/ComponentName;

.field private day:I

.field private deepLink:Ljava/lang/String;

.field private displayStyle:I

.field private endTime:J

.field private isZte:Z

.field private mClonedUserHandle:Landroid/os/UserHandle;

.field private mUnreadSwitchState:Z

.field private mUnreadSwitchStateForClonedApp:Z

.field private msg:Ljava/lang/String;

.field private pushId:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->isZte:Z

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput v1, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->day:I

    .line 9
    .line 10
    new-instance v1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->clickDates:Ljava/util/ArrayList;

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->mUnreadSwitchState:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->mUnreadSwitchStateForClonedApp:Z

    .line 20
    .line 21
    return-void
.end method

.method public static fromBundle(Landroid/os/Bundle;)Lcom/android/launcher3/nubia/NubiaPushConfig;
    .locals 14

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    const-string v1, "pushId"

    .line 6
    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    invoke-virtual {p0, v1, v2, v3}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    .line 10
    .line 11
    .line 12
    move-result-wide v4

    .line 13
    cmp-long v1, v4, v2

    .line 14
    .line 15
    const-string v6, "NubiaPushConfig"

    .line 16
    .line 17
    if-gtz v1, :cond_1

    .line 18
    .line 19
    new-instance p0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v1, "invalidate params, id = "

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {v6, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    return-object v0

    .line 40
    :cond_1
    const-string v1, "displayStyle"

    .line 41
    .line 42
    const/4 v7, 0x0

    .line 43
    invoke-virtual {p0, v1, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    const/4 v8, 0x1

    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    if-eq v1, v8, :cond_2

    .line 51
    .line 52
    new-instance p0, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .line 56
    .line 57
    const-string v2, "invalidate params, displayStyle is "

    .line 58
    .line 59
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {v6, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    return-object v0

    .line 73
    :cond_2
    const-string v9, "msg"

    .line 74
    .line 75
    invoke-virtual {p0, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v9

    .line 79
    if-nez v1, :cond_3

    .line 80
    .line 81
    const-string v9, "1"

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_3
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 85
    .line 86
    .line 87
    move-result v10

    .line 88
    if-eqz v10, :cond_4

    .line 89
    .line 90
    const-string p0, "invalidate params, msg is null"

    .line 91
    .line 92
    invoke-static {v6, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    return-object v0

    .line 96
    :cond_4
    :goto_0
    const-string v10, "endTime"

    .line 97
    .line 98
    invoke-virtual {p0, v10, v2, v3}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    .line 99
    .line 100
    .line 101
    move-result-wide v10

    .line 102
    cmp-long v2, v10, v2

    .line 103
    .line 104
    if-gtz v2, :cond_5

    .line 105
    .line 106
    new-instance p0, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 109
    .line 110
    .line 111
    const-string v1, "invalidate endTime, endTime="

    .line 112
    .line 113
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {v6, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    .line 125
    .line 126
    return-object v0

    .line 127
    :cond_5
    const-string v2, "deepLink"

    .line 128
    .line 129
    invoke-virtual {p0, v2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 134
    .line 135
    .line 136
    move-result v3

    .line 137
    if-eqz v3, :cond_6

    .line 138
    .line 139
    new-instance p0, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 142
    .line 143
    .line 144
    const-string v1, "invalidate deepLink, deepLink="

    .line 145
    .line 146
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-static {v6, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    return-object v0

    .line 160
    :cond_6
    const-string v3, "packageName"

    .line 161
    .line 162
    invoke-virtual {p0, v3, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    const-string v12, "className"

    .line 167
    .line 168
    invoke-virtual {p0, v12, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v12

    .line 172
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 173
    .line 174
    .line 175
    move-result v13

    .line 176
    if-nez v13, :cond_8

    .line 177
    .line 178
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 179
    .line 180
    .line 181
    move-result v13

    .line 182
    if-eqz v13, :cond_7

    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_7
    new-instance v0, Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 186
    .line 187
    invoke-direct {v0}, Lcom/android/launcher3/nubia/NubiaPushConfig;-><init>()V

    .line 188
    .line 189
    .line 190
    iput-wide v4, v0, Lcom/android/launcher3/nubia/NubiaPushConfig;->pushId:J

    .line 191
    .line 192
    iput-object v9, v0, Lcom/android/launcher3/nubia/NubiaPushConfig;->msg:Ljava/lang/String;

    .line 193
    .line 194
    iput v1, v0, Lcom/android/launcher3/nubia/NubiaPushConfig;->displayStyle:I

    .line 195
    .line 196
    iput-wide v10, v0, Lcom/android/launcher3/nubia/NubiaPushConfig;->endTime:J

    .line 197
    .line 198
    const-string v1, "bgColor"

    .line 199
    .line 200
    invoke-virtual {p0, v1, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 201
    .line 202
    .line 203
    move-result p0

    .line 204
    iput p0, v0, Lcom/android/launcher3/nubia/NubiaPushConfig;->bgColor:I

    .line 205
    .line 206
    iput-object v2, v0, Lcom/android/launcher3/nubia/NubiaPushConfig;->deepLink:Ljava/lang/String;

    .line 207
    .line 208
    new-instance p0, Landroid/content/ComponentName;

    .line 209
    .line 210
    invoke-direct {p0, v3, v12}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    iput-object p0, v0, Lcom/android/launcher3/nubia/NubiaPushConfig;->componentName:Landroid/content/ComponentName;

    .line 214
    .line 215
    iput v8, v0, Lcom/android/launcher3/nubia/NubiaPushConfig;->day:I

    .line 216
    .line 217
    invoke-virtual {v0, v7}, Lcom/android/launcher3/nubia/NubiaPushConfig;->setIsZte(Z)V

    .line 218
    .line 219
    .line 220
    return-object v0

    .line 221
    :cond_8
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 222
    .line 223
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 224
    .line 225
    .line 226
    const-string v1, "invalidate params, packageName="

    .line 227
    .line 228
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    const-string v1, "  className="

    .line 235
    .line 236
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {p0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    invoke-static {v6, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 247
    .line 248
    .line 249
    return-object v0
.end method

.method public static fromItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/nubia/NubiaPushConfig;
    .locals 5

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/android/launcher3/nubia/NubiaPushConfig;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    iput-wide v1, v0, Lcom/android/launcher3/nubia/NubiaPushConfig;->pushId:J

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, v0, Lcom/android/launcher3/nubia/NubiaPushConfig;->componentName:Landroid/content/ComponentName;

    .line 21
    .line 22
    new-instance v1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v2, ""

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-object v1, v0, Lcom/android/launcher3/nubia/NubiaPushConfig;->msg:Ljava/lang/String;

    .line 42
    .line 43
    new-instance v1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 49
    .line 50
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    iput-object p0, v0, Lcom/android/launcher3/nubia/NubiaPushConfig;->deepLink:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 63
    .line 64
    .line 65
    move-result-wide v1

    .line 66
    const-wide/32 v3, 0x493e0

    .line 67
    .line 68
    .line 69
    add-long/2addr v1, v3

    .line 70
    iput-wide v1, v0, Lcom/android/launcher3/nubia/NubiaPushConfig;->endTime:J

    .line 71
    .line 72
    return-object v0
.end method


# virtual methods
.method public addClickDate(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->clickDates:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->clickDates:Ljava/util/ArrayList;

    .line 11
    .line 12
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->clickDates:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->clickDates:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public getBgColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->bgColor:I

    .line 2
    .line 3
    return p0
.end method

.method public getClickDates()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->clickDates:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->clickDates:Ljava/util/ArrayList;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->clickDates:Ljava/util/ArrayList;

    .line 13
    .line 14
    return-object p0
.end method

.method public getClonedUserHandle()Landroid/os/UserHandle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->mClonedUserHandle:Landroid/os/UserHandle;

    .line 2
    .line 3
    return-object p0
.end method

.method public getComponentName()Landroid/content/ComponentName;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->componentName:Landroid/content/ComponentName;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDay()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->day:I

    .line 2
    .line 3
    return p0
.end method

.method public getDeepLink()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->deepLink:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDisplayStyle()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->displayStyle:I

    .line 2
    .line 3
    return p0
.end method

.method public getEndTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->endTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getMsg()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->msg:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPushId()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->pushId:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getUnreadSwitchState()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->mUnreadSwitchState:Z

    .line 2
    .line 3
    return p0
.end method

.method public getUnreadSwitchStateForClonedApp()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->mUnreadSwitchStateForClonedApp:Z

    .line 2
    .line 3
    return p0
.end method

.method public isAvailable()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->pushId:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->componentName:Landroid/content/ComponentName;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->msg:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->deepLink:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public isZte()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->isZte:Z

    .line 2
    .line 3
    return p0
.end method

.method public setClonedUserHandle(Landroid/os/UserHandle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->mClonedUserHandle:Landroid/os/UserHandle;

    .line 2
    .line 3
    return-void
.end method

.method public setIsZte(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->isZte:Z

    .line 2
    .line 3
    return-void
.end method

.method public setUnreadSwitchState(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->mUnreadSwitchState:Z

    .line 2
    .line 3
    return-void
.end method

.method public setUnreadSwitchStateForClonedApp(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/nubia/NubiaPushConfig;->mUnreadSwitchStateForClonedApp:Z

    .line 2
    .line 3
    return-void
.end method
