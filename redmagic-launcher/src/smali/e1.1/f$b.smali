.class Le1/f$b;
.super Landroid/content/BroadcastReceiver;
.source "CMWidgetsManagerHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le1/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Le1/f;


# direct methods
.method private constructor <init>(Le1/f;)V
    .locals 0

    .line 2
    iput-object p1, p0, Le1/f$b;->a:Le1/f;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Le1/f;Le1/h;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Le1/f$b;-><init>(Le1/f;)V

    return-void
.end method

.method public static synthetic a(Le1/f$b;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Le1/f$b;->b(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic b(Landroid/content/Intent;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v2, "WidgetManagerReceiver, onReceive: action: "

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "CMWidgetsManagerHelper"

    .line 23
    .line 24
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    const-string v1, "com.aicd.client.action.MAPPING_UPDATE"

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    const-string v0, "widgetMappingJson"

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    const/4 p1, 0x0

    .line 49
    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_6

    .line 54
    .line 55
    iget-object v0, p0, Le1/f$b;->a:Le1/f;

    .line 56
    .line 57
    invoke-static {v0, p1}, Le1/f;->m(Le1/f;Ljava/lang/String;)Ljava/util/Map;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    if-eqz p1, :cond_6

    .line 62
    .line 63
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_6

    .line 68
    .line 69
    iget-object v0, p0, Le1/f$b;->a:Le1/f;

    .line 70
    .line 71
    invoke-static {v0}, Le1/f;->f(Le1/f;)Ljava/util/Map;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Le1/f$b;->a:Le1/f;

    .line 79
    .line 80
    invoke-static {v0}, Le1/f;->f(Le1/f;)Ljava/util/Map;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Le1/f$b;->a:Le1/f;

    .line 88
    .line 89
    invoke-static {p1}, Le1/f;->f(Le1/f;)Ljava/util/Map;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-static {p1, v0}, Le1/f;->o(Le1/f;Ljava/util/Map;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Le1/f$b;->a:Le1/f;

    .line 97
    .line 98
    const-string v0, "WidgetManagerReceiver.MAPPING_UPDATE"

    .line 99
    .line 100
    invoke-static {p1, v0}, Le1/f;->l(Le1/f;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Le1/f$b;->a:Le1/f;

    .line 104
    .line 105
    invoke-static {p1}, Le1/f;->e(Le1/f;)Ljava/util/Map;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-interface {p1}, Ljava/util/Map;->clear()V

    .line 110
    .line 111
    .line 112
    iget-object p0, p0, Le1/f$b;->a:Le1/f;

    .line 113
    .line 114
    invoke-static {p0}, Le1/f;->n(Le1/f;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_1
    const-string v1, "com.aicd.client.action.DEVICE_INFO_MISSING"

    .line 119
    .line 120
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-eqz v0, :cond_6

    .line 125
    .line 126
    const-string v0, "infoStatus"

    .line 127
    .line 128
    const/4 v1, 0x0

    .line 129
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    new-instance v0, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .line 137
    .line 138
    const-string v1, "WidgetManagerReceiver, onReceive: missing info status: "

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    if-nez p1, :cond_2

    .line 154
    .line 155
    const-string p1, "WidgetManagerReceiver, onReceive: re-execute the initialization process."

    .line 156
    .line 157
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    .line 159
    .line 160
    iget-object p1, p0, Le1/f$b;->a:Le1/f;

    .line 161
    .line 162
    invoke-static {p1}, Le1/f;->r(Le1/f;)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Le1/f$b;->a:Le1/f;

    .line 166
    .line 167
    invoke-static {p1}, Le1/f;->q(Le1/f;)V

    .line 168
    .line 169
    .line 170
    iget-object p1, p0, Le1/f$b;->a:Le1/f;

    .line 171
    .line 172
    invoke-static {p1}, Le1/f;->p(Le1/f;)V

    .line 173
    .line 174
    .line 175
    goto :goto_2

    .line 176
    :cond_2
    and-int/lit8 v0, p1, 0x1

    .line 177
    .line 178
    if-eqz v0, :cond_4

    .line 179
    .line 180
    and-int/lit8 v0, p1, 0x2

    .line 181
    .line 182
    if-eqz v0, :cond_4

    .line 183
    .line 184
    and-int/lit8 v0, p1, 0x4

    .line 185
    .line 186
    if-nez v0, :cond_3

    .line 187
    .line 188
    goto :goto_1

    .line 189
    :cond_3
    and-int/lit8 p1, p1, 0x8

    .line 190
    .line 191
    if-nez p1, :cond_5

    .line 192
    .line 193
    iget-object p1, p0, Le1/f$b;->a:Le1/f;

    .line 194
    .line 195
    invoke-static {p1}, Le1/f;->p(Le1/f;)V

    .line 196
    .line 197
    .line 198
    goto :goto_2

    .line 199
    :cond_4
    :goto_1
    iget-object p1, p0, Le1/f$b;->a:Le1/f;

    .line 200
    .line 201
    invoke-static {p1}, Le1/f;->q(Le1/f;)V

    .line 202
    .line 203
    .line 204
    :cond_5
    :goto_2
    iget-object p0, p0, Le1/f$b;->a:Le1/f;

    .line 205
    .line 206
    invoke-static {p0}, Le1/f;->k(Le1/f;)V

    .line 207
    .line 208
    .line 209
    :cond_6
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v0, Le1/g;

    .line 4
    .line 5
    invoke-direct {v0, p0, p2}, Le1/g;-><init>(Le1/f$b;Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
