.class Lcom/android/launcher3/taskbar/g3$d;
.super Ljava/lang/Object;
.source "TaskbarManager.java"

# interfaces
.implements Landroid/content/ComponentCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/g3;->F(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private g:Landroid/content/res/Configuration;

.field final synthetic h:I

.field final synthetic i:Lcom/android/launcher3/taskbar/g3;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/g3;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/g3$d;->i:Lcom/android/launcher3/taskbar/g3;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/taskbar/g3$d;->h:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, p2}, Lcom/android/launcher3/taskbar/g3;->u(Lcom/android/launcher3/taskbar/g3;I)Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/android/launcher3/taskbar/g3$d;->g:Landroid/content/res/Configuration;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onConfigurationChanged: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-wide/16 v2, 0x1000

    .line 19
    .line 20
    const-string v4, "TaskbarManager"

    .line 21
    .line 22
    invoke-static {v2, v3, v4, v0}, Landroid/os/Trace;->instantForTrack(JLjava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3$d;->i:Lcom/android/launcher3/taskbar/g3;

    .line 26
    .line 27
    new-instance v2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget v2, p0, Lcom/android/launcher3/taskbar/g3$d;->h:I

    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3$d;->i:Lcom/android/launcher3/taskbar/g3;

    .line 48
    .line 49
    iget v1, p0, Lcom/android/launcher3/taskbar/g3$d;->h:I

    .line 50
    .line 51
    invoke-static {v0, v1}, Lcom/android/launcher3/taskbar/g3;->t(Lcom/android/launcher3/taskbar/g3;I)Lcom/android/launcher3/h0;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3$d;->g:Landroid/content/res/Configuration;

    .line 56
    .line 57
    invoke-virtual {v1, p1}, Landroid/content/res/Configuration;->diff(Landroid/content/res/Configuration;)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    const v2, -0x20000df4

    .line 62
    .line 63
    .line 64
    and-int/2addr v2, v1

    .line 65
    and-int/lit16 v3, v1, 0x200

    .line 66
    .line 67
    if-eqz v3, :cond_0

    .line 68
    .line 69
    iget-object v3, p0, Lcom/android/launcher3/taskbar/g3$d;->i:Lcom/android/launcher3/taskbar/g3;

    .line 70
    .line 71
    const-string v4, "onConfigurationChanged: theme changed"

    .line 72
    .line 73
    iget v5, p0, Lcom/android/launcher3/taskbar/g3$d;->h:I

    .line 74
    .line 75
    invoke-virtual {v3, v4, v5}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 76
    .line 77
    .line 78
    iget-object v3, p0, Lcom/android/launcher3/taskbar/g3$d;->g:Landroid/content/res/Configuration;

    .line 79
    .line 80
    iget v3, v3, Landroid/content/res/Configuration;->uiMode:I

    .line 81
    .line 82
    and-int/lit8 v3, v3, 0x30

    .line 83
    .line 84
    iget v4, p1, Landroid/content/res/Configuration;->uiMode:I

    .line 85
    .line 86
    and-int/lit8 v4, v4, 0x30

    .line 87
    .line 88
    if-ne v3, v4, :cond_0

    .line 89
    .line 90
    const v2, -0x20000ff4

    .line 91
    .line 92
    .line 93
    and-int/2addr v2, v1

    .line 94
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3$d;->i:Lcom/android/launcher3/taskbar/g3;

    .line 95
    .line 96
    new-instance v3, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .line 100
    .line 101
    const-string v4, "onConfigurationChanged: | configDiff="

    .line 102
    .line 103
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-static {v2}, Landroid/content/res/Configuration;->configurationDiffToString(I)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    iget v4, p0, Lcom/android/launcher3/taskbar/g3$d;->h:I

    .line 118
    .line 119
    invoke-virtual {v1, v3, v4}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 120
    .line 121
    .line 122
    const-string v1, "onConfigurationChanged: call recreateTaskbars"

    .line 123
    .line 124
    if-nez v2, :cond_5

    .line 125
    .line 126
    iget-object v3, p0, Lcom/android/launcher3/taskbar/g3$d;->i:Lcom/android/launcher3/taskbar/g3;

    .line 127
    .line 128
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/g3;->a0()Lcom/android/launcher3/taskbar/I1;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    if-nez v3, :cond_1

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_1
    if-eqz v0, :cond_4

    .line 136
    .line 137
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3$d;->i:Lcom/android/launcher3/taskbar/g3;

    .line 138
    .line 139
    invoke-static {v2, v0}, Lcom/android/launcher3/taskbar/g3;->x(Lcom/android/launcher3/taskbar/g3;Lcom/android/launcher3/h0;)Z

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    if-nez v2, :cond_2

    .line 144
    .line 145
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3$d;->i:Lcom/android/launcher3/taskbar/g3;

    .line 146
    .line 147
    const-string v1, "onConfigurationChanged: isTaskbarEnabled(dp)=False | destroyTaskbarForDisplay"

    .line 148
    .line 149
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3$d;->i:Lcom/android/launcher3/taskbar/g3;

    .line 153
    .line 154
    invoke-static {v0}, Lcom/android/launcher3/taskbar/g3;->s(Lcom/android/launcher3/taskbar/g3;)I

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    invoke-static {v0, v1}, Lcom/android/launcher3/taskbar/g3;->r(Lcom/android/launcher3/taskbar/g3;I)V

    .line 159
    .line 160
    .line 161
    goto :goto_1

    .line 162
    :cond_2
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3$d;->i:Lcom/android/launcher3/taskbar/g3;

    .line 163
    .line 164
    const-string v3, "onConfigurationChanged: isTaskbarEnabled(dp)=True"

    .line 165
    .line 166
    invoke-virtual {v2, v3}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    sget-boolean v2, Lf1/a;->g:Z

    .line 170
    .line 171
    if-eqz v2, :cond_3

    .line 172
    .line 173
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3$d;->i:Lcom/android/launcher3/taskbar/g3;

    .line 174
    .line 175
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3$d;->i:Lcom/android/launcher3/taskbar/g3;

    .line 179
    .line 180
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/g3;->E0()V

    .line 181
    .line 182
    .line 183
    goto :goto_1

    .line 184
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3$d;->i:Lcom/android/launcher3/taskbar/g3;

    .line 185
    .line 186
    const-string v2, "onConfigurationChanged: updateDeviceProfile for current taskbar."

    .line 187
    .line 188
    invoke-virtual {v1, v2}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3$d;->i:Lcom/android/launcher3/taskbar/g3;

    .line 192
    .line 193
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/g3;->a0()Lcom/android/launcher3/taskbar/I1;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/I1;->B2(Lcom/android/launcher3/h0;)V

    .line 198
    .line 199
    .line 200
    goto :goto_1

    .line 201
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3$d;->i:Lcom/android/launcher3/taskbar/g3;

    .line 202
    .line 203
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/g3;->a0()Lcom/android/launcher3/taskbar/I1;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {v0, v2}, Lcom/android/launcher3/taskbar/I1;->P1(I)V

    .line 208
    .line 209
    .line 210
    goto :goto_1

    .line 211
    :cond_5
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3$d;->i:Lcom/android/launcher3/taskbar/g3;

    .line 212
    .line 213
    iget v2, p0, Lcom/android/launcher3/taskbar/g3$d;->h:I

    .line 214
    .line 215
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 216
    .line 217
    .line 218
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3$d;->i:Lcom/android/launcher3/taskbar/g3;

    .line 219
    .line 220
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/g3;->E0()V

    .line 221
    .line 222
    .line 223
    :goto_1
    new-instance v0, Landroid/content/res/Configuration;

    .line 224
    .line 225
    invoke-direct {v0, p1}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 226
    .line 227
    .line 228
    iput-object v0, p0, Lcom/android/launcher3/taskbar/g3$d;->g:Landroid/content/res/Configuration;

    .line 229
    .line 230
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3$d;->i:Lcom/android/launcher3/taskbar/g3;

    .line 231
    .line 232
    invoke-static {p0}, Lcom/android/launcher3/taskbar/g3;->j(Lcom/android/launcher3/taskbar/g3;)Lcom/android/launcher3/taskbar/J3;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    const/4 p1, 0x0

    .line 237
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/J3;->c(Z)V

    .line 238
    .line 239
    .line 240
    return-void
.end method

.method public onLowMemory()V
    .locals 0

    .line 1
    return-void
.end method
