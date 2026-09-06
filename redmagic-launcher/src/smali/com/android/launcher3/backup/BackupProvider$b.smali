.class Lcom/android/launcher3/backup/BackupProvider$b;
.super Ljava/lang/Object;
.source "BackupProvider.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/backup/BackupProvider;->g(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Landroid/os/Bundle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Ljava/lang/String;

.field final synthetic h:Ljava/lang/String;

.field final synthetic i:Landroid/content/Context;

.field final synthetic j:Landroid/os/Bundle;

.field final synthetic k:Ljava/lang/Object;

.field final synthetic l:Lcom/android/launcher3/backup/BackupProvider;


# direct methods
.method constructor <init>(Lcom/android/launcher3/backup/BackupProvider;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/backup/BackupProvider$b;->l:Lcom/android/launcher3/backup/BackupProvider;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/backup/BackupProvider$b;->g:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/backup/BackupProvider$b;->h:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/backup/BackupProvider$b;->i:Landroid/content/Context;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/backup/BackupProvider$b;->j:Landroid/os/Bundle;

    .line 10
    .line 11
    iput-object p6, p0, Lcom/android/launcher3/backup/BackupProvider$b;->k:Ljava/lang/Object;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 1
    const-string v0, "screenshot"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/backup/BackupProvider$b;->g:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "Backup-Restore"

    .line 12
    .line 13
    const-string v1, "getScreenShoot  screenshot"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Lcom/android/launcher3/backup/BackupProvider$b;->l:Lcom/android/launcher3/backup/BackupProvider;

    .line 19
    .line 20
    const-string v3, "screenshot"

    .line 21
    .line 22
    iget-object v5, p0, Lcom/android/launcher3/backup/BackupProvider$b;->h:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v6, p0, Lcom/android/launcher3/backup/BackupProvider$b;->i:Landroid/content/Context;

    .line 25
    .line 26
    const/4 v7, 0x0

    .line 27
    const/high16 v4, -0x5a000000

    .line 28
    .line 29
    invoke-static/range {v2 .. v7}, Lcom/android/launcher3/backup/BackupProvider;->a(Lcom/android/launcher3/backup/BackupProvider;Ljava/lang/String;ILjava/lang/String;Landroid/content/Context;Z)Landroid/graphics/Bitmap;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Lcom/android/launcher3/backup/BackupProvider$b;->j:Landroid/os/Bundle;

    .line 34
    .line 35
    const-string v2, "screenshot_black"

    .line 36
    .line 37
    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 38
    .line 39
    .line 40
    iget-object v3, p0, Lcom/android/launcher3/backup/BackupProvider$b;->l:Lcom/android/launcher3/backup/BackupProvider;

    .line 41
    .line 42
    const-string v4, "screenshot"

    .line 43
    .line 44
    iget-object v6, p0, Lcom/android/launcher3/backup/BackupProvider$b;->h:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v7, p0, Lcom/android/launcher3/backup/BackupProvider$b;->i:Landroid/content/Context;

    .line 47
    .line 48
    const/4 v8, 0x0

    .line 49
    const/4 v5, -0x1

    .line 50
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/backup/BackupProvider;->a(Lcom/android/launcher3/backup/BackupProvider;Ljava/lang/String;ILjava/lang/String;Landroid/content/Context;Z)Landroid/graphics/Bitmap;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v1, p0, Lcom/android/launcher3/backup/BackupProvider$b;->j:Landroid/os/Bundle;

    .line 55
    .line 56
    const-string v2, "screenshot_white"

    .line 57
    .line 58
    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 59
    .line 60
    .line 61
    goto/16 :goto_0

    .line 62
    .line 63
    :cond_0
    const-string v0, "screenshot_no_dock"

    .line 64
    .line 65
    iget-object v1, p0, Lcom/android/launcher3/backup/BackupProvider$b;->g:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    const-string v0, "Backup-Restore"

    .line 74
    .line 75
    const-string v1, "getScreenShoot  screenshot_no_dock"

    .line 76
    .line 77
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    invoke-static {}, Lx1/O;->A3()Ljava/lang/Boolean;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_1

    .line 89
    .line 90
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_1

    .line 99
    .line 100
    iget-object v1, p0, Lcom/android/launcher3/backup/BackupProvider$b;->l:Lcom/android/launcher3/backup/BackupProvider;

    .line 101
    .line 102
    const-string v2, "screenshot_no_dock"

    .line 103
    .line 104
    iget-object v4, p0, Lcom/android/launcher3/backup/BackupProvider$b;->h:Ljava/lang/String;

    .line 105
    .line 106
    iget-object v5, p0, Lcom/android/launcher3/backup/BackupProvider$b;->i:Landroid/content/Context;

    .line 107
    .line 108
    const/4 v6, 0x1

    .line 109
    const/high16 v3, -0x5a000000

    .line 110
    .line 111
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/backup/BackupProvider;->a(Lcom/android/launcher3/backup/BackupProvider;Ljava/lang/String;ILjava/lang/String;Landroid/content/Context;Z)Landroid/graphics/Bitmap;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iget-object v1, p0, Lcom/android/launcher3/backup/BackupProvider$b;->j:Landroid/os/Bundle;

    .line 116
    .line 117
    const-string v2, "screenshot_no_dock_black_with_clock"

    .line 118
    .line 119
    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 120
    .line 121
    .line 122
    iget-object v3, p0, Lcom/android/launcher3/backup/BackupProvider$b;->l:Lcom/android/launcher3/backup/BackupProvider;

    .line 123
    .line 124
    const-string v4, "screenshot_no_dock"

    .line 125
    .line 126
    iget-object v6, p0, Lcom/android/launcher3/backup/BackupProvider$b;->h:Ljava/lang/String;

    .line 127
    .line 128
    iget-object v7, p0, Lcom/android/launcher3/backup/BackupProvider$b;->i:Landroid/content/Context;

    .line 129
    .line 130
    const/4 v8, 0x1

    .line 131
    const/4 v5, -0x1

    .line 132
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/backup/BackupProvider;->a(Lcom/android/launcher3/backup/BackupProvider;Ljava/lang/String;ILjava/lang/String;Landroid/content/Context;Z)Landroid/graphics/Bitmap;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iget-object v1, p0, Lcom/android/launcher3/backup/BackupProvider$b;->j:Landroid/os/Bundle;

    .line 137
    .line 138
    const-string v2, "screenshot_no_dock_white_with_clock"

    .line 139
    .line 140
    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 141
    .line 142
    .line 143
    :cond_1
    iget-object v3, p0, Lcom/android/launcher3/backup/BackupProvider$b;->l:Lcom/android/launcher3/backup/BackupProvider;

    .line 144
    .line 145
    const-string v4, "screenshot_no_dock"

    .line 146
    .line 147
    iget-object v6, p0, Lcom/android/launcher3/backup/BackupProvider$b;->h:Ljava/lang/String;

    .line 148
    .line 149
    iget-object v7, p0, Lcom/android/launcher3/backup/BackupProvider$b;->i:Landroid/content/Context;

    .line 150
    .line 151
    const/4 v8, 0x0

    .line 152
    const/high16 v5, -0x5a000000

    .line 153
    .line 154
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/backup/BackupProvider;->a(Lcom/android/launcher3/backup/BackupProvider;Ljava/lang/String;ILjava/lang/String;Landroid/content/Context;Z)Landroid/graphics/Bitmap;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    iget-object v1, p0, Lcom/android/launcher3/backup/BackupProvider$b;->j:Landroid/os/Bundle;

    .line 159
    .line 160
    const-string v2, "screenshot_no_dock_black"

    .line 161
    .line 162
    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 163
    .line 164
    .line 165
    iget-object v3, p0, Lcom/android/launcher3/backup/BackupProvider$b;->l:Lcom/android/launcher3/backup/BackupProvider;

    .line 166
    .line 167
    const-string v4, "screenshot_no_dock"

    .line 168
    .line 169
    iget-object v6, p0, Lcom/android/launcher3/backup/BackupProvider$b;->h:Ljava/lang/String;

    .line 170
    .line 171
    iget-object v7, p0, Lcom/android/launcher3/backup/BackupProvider$b;->i:Landroid/content/Context;

    .line 172
    .line 173
    const/4 v5, -0x1

    .line 174
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/backup/BackupProvider;->a(Lcom/android/launcher3/backup/BackupProvider;Ljava/lang/String;ILjava/lang/String;Landroid/content/Context;Z)Landroid/graphics/Bitmap;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    iget-object v1, p0, Lcom/android/launcher3/backup/BackupProvider$b;->j:Landroid/os/Bundle;

    .line 179
    .line 180
    const-string v2, "screenshot_no_dock_white"

    .line 181
    .line 182
    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 183
    .line 184
    .line 185
    :cond_2
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/backup/BackupProvider$b;->k:Ljava/lang/Object;

    .line 186
    .line 187
    monitor-enter v1

    .line 188
    :try_start_0
    iget-object p0, p0, Lcom/android/launcher3/backup/BackupProvider$b;->k:Ljava/lang/Object;

    .line 189
    .line 190
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 191
    .line 192
    .line 193
    monitor-exit v1

    .line 194
    return-void

    .line 195
    :catchall_0
    move-exception v0

    .line 196
    move-object p0, v0

    .line 197
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 198
    throw p0
.end method
