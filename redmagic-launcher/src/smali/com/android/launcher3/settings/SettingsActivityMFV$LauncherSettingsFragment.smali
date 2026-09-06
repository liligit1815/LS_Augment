.class public Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;
.super Lcom/zte/mifavor/androidx/preference/PreferenceFragmentCompat;
.source "SettingsActivityMFV.java"

# interfaces
.implements Landroidx/preference/Preference$d;
.implements Landroidx/preference/Preference$e;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x17
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/settings/SettingsActivityMFV;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LauncherSettingsFragment"
.end annotation


# instance fields
.field public r:Landroid/app/Dialog;

.field private s:J

.field private t:Z

.field private u:Z

.field private v:Z

.field private w:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/androidx/preference/PreferenceFragmentCompat;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->r:Landroid/app/Dialog;

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->s:J

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->t:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->u:Z

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->w:Z

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic G(Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;ILandroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->P(ILandroid/content/DialogInterface;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic H(Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->r:Landroid/app/Dialog;

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic I(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic J(Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;Landroid/content/Context;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->W(Landroid/content/Context;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic K(Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->X(Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private M(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const p2, 0x7f140157

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const p2, 0x7f140156

    .line 12
    .line 13
    .line 14
    :goto_0
    invoke-virtual {v0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    const v0, 0x7f1403a0

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const p1, 0x7f140147

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {p0, p2}, Lh1/a;->M(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    const v0, 0x7f1403b4

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const p1, 0x7f140151

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-static {p0, p2}, Lh1/a;->M(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    const v0, 0x7f1403a6

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_3

    .line 86
    .line 87
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    const p1, 0x7f14014a

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-static {p0, p2}, Lh1/a;->M(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_3
    const v0, 0x7f1403ac

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_4

    .line 114
    .line 115
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    const p1, 0x7f140152

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-static {p0, p2}, Lh1/a;->M(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_4
    const v0, 0x7f1403ad

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-eqz v0, :cond_5

    .line 142
    .line 143
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    const p1, 0x7f14014b

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-static {p0, p2}, Lh1/a;->M(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :cond_5
    const-string v0, "pref_allowRotation"

    .line 159
    .line 160
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-eqz v0, :cond_6

    .line 165
    .line 166
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    const p1, 0x7f140149

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    invoke-static {p0, p2}, Lh1/a;->M(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    return-void

    .line 181
    :cond_6
    const v0, 0x7f1403b1

    .line 182
    .line 183
    .line 184
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-eqz v0, :cond_7

    .line 193
    .line 194
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    const p1, 0x7f140146

    .line 199
    .line 200
    .line 201
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    invoke-static {p0, p2}, Lh1/a;->M(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    return-void

    .line 209
    :cond_7
    const v0, 0x7f1403bd

    .line 210
    .line 211
    .line 212
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    if-eqz v0, :cond_8

    .line 221
    .line 222
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    const p1, 0x7f140154

    .line 227
    .line 228
    .line 229
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    invoke-static {p0, p2}, Lh1/a;->M(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    return-void

    .line 237
    :cond_8
    const v0, 0x7f1403b3

    .line 238
    .line 239
    .line 240
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    if-eqz v0, :cond_9

    .line 249
    .line 250
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 251
    .line 252
    .line 253
    move-result-object p0

    .line 254
    const p1, 0x7f140150

    .line 255
    .line 256
    .line 257
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object p0

    .line 261
    invoke-static {p0, p2}, Lh1/a;->M(Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    return-void

    .line 265
    :cond_9
    const v0, 0x7f1403a1

    .line 266
    .line 267
    .line 268
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 273
    .line 274
    .line 275
    move-result p1

    .line 276
    if-eqz p1, :cond_a

    .line 277
    .line 278
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 279
    .line 280
    .line 281
    move-result-object p0

    .line 282
    const p1, 0x7f140148

    .line 283
    .line 284
    .line 285
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object p0

    .line 289
    invoke-static {p0, p2}, Lh1/a;->M(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    :cond_a
    return-void
.end method

.method private N(Z)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "conflict_state_"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const-string p1, "circle"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p1, "custom"

    .line 17
    .line 18
    :goto_0
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method private O()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->B()Lcom/android/launcher3/H5$c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/android/launcher3/H5$c;->g:Lcom/android/launcher3/H5$c;

    .line 14
    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    const-string p0, ""

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->E0()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    const v0, 0x7f1403cc

    .line 35
    .line 36
    .line 37
    :goto_0
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_1
    const v0, 0x7f1403cb

    .line 43
    .line 44
    .line 45
    goto :goto_0
.end method

.method private synthetic P(ILandroid/content/DialogInterface;I)V
    .locals 3

    .line 1
    if-eq p1, p3, :cond_3

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1, p3}, Lcom/android/launcher3/r4;->L(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const v0, 0x7f1403bb

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iget v2, v2, Lcom/android/launcher3/r4;->q:I

    .line 50
    .line 51
    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 67
    .line 68
    if-nez p3, :cond_1

    .line 69
    .line 70
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    invoke-static {p3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 75
    .line 76
    .line 77
    move-result-object p3

    .line 78
    invoke-virtual {p3}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    iget-boolean p3, p3, Lcom/android/launcher3/r4;->Z:Z

    .line 83
    .line 84
    const v0, 0x7f1403df

    .line 85
    .line 86
    .line 87
    if-eqz p3, :cond_0

    .line 88
    .line 89
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p1, p0}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a1(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p1, p0}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->J0(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 114
    .line 115
    .line 116
    move-result-object p3

    .line 117
    invoke-static {p3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 118
    .line 119
    .line 120
    move-result-object p3

    .line 121
    invoke-virtual {p3}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 122
    .line 123
    .line 124
    move-result-object p3

    .line 125
    iget-boolean p3, p3, Lcom/android/launcher3/r4;->Z:Z

    .line 126
    .line 127
    const v0, 0x7f1403e0

    .line 128
    .line 129
    .line 130
    if-eqz p3, :cond_2

    .line 131
    .line 132
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {p1, p0}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a1(Ljava/lang/CharSequence;)V

    .line 141
    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_2
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-virtual {p1, p0}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->J0(Ljava/lang/CharSequence;)V

    .line 153
    .line 154
    .line 155
    :goto_0
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    if-eqz p0, :cond_3

    .line 160
    .line 161
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/DragLayer;->recreateControllers()V

    .line 166
    .line 167
    .line 168
    :cond_3
    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    .line 169
    .line 170
    .line 171
    return-void
.end method

.method private S(Landroid/content/Context;Z)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0, p2}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->N(Z)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 p2, 0x1

    .line 10
    invoke-interface {p1, p0, p2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method private T()V
    .locals 2

    .line 1
    const v0, 0x7f1403a1

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroidx/preference/SwitchPreference;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-static {v1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->g(Z)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->E0(Landroidx/preference/Preference$d;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->t()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0, v1}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1, v0}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 37
    .line 38
    .line 39
    :goto_0
    invoke-static {}, Lx1/S;->r()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    const v0, 0x7f1403ad

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Landroidx/preference/SwitchPreference;

    .line 57
    .line 58
    if-eqz p0, :cond_1

    .line 59
    .line 60
    const v0, 0x7f14010e

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->L0(I)V

    .line 64
    .line 65
    .line 66
    :cond_1
    return-void
.end method

.method private U()V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const-string v0, "SettingsAtyFragment"

    .line 10
    .line 11
    const-string v1, "getPreferenceScreen()== null"

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const v3, 0x7f1403bc

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v3}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {v2, v3}, Landroidx/preference/PreferenceGroup;->W0(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    const v4, 0x7f1403b0

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v4}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-virtual {v3, v4}, Landroidx/preference/PreferenceGroup;->W0(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    check-cast v3, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 54
    .line 55
    invoke-virtual {v0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    const v5, 0x7f1403b2

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v5}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    invoke-virtual {v4, v5}, Landroidx/preference/PreferenceGroup;->W0(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    check-cast v4, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    const v6, 0x7f1403b7

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v6}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v7

    .line 83
    invoke-virtual {v5, v7}, Landroidx/preference/PreferenceGroup;->W0(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    check-cast v5, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 88
    .line 89
    invoke-virtual {v0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 90
    .line 91
    .line 92
    move-result-object v7

    .line 93
    const v8, 0x7f1403bb

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v8}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v9

    .line 100
    invoke-virtual {v7, v9}, Landroidx/preference/PreferenceGroup;->W0(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 101
    .line 102
    .line 103
    move-result-object v7

    .line 104
    check-cast v7, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 105
    .line 106
    const v9, 0x7f1403ad

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0, v9}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v9

    .line 113
    invoke-virtual {v0, v9}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 114
    .line 115
    .line 116
    move-result-object v9

    .line 117
    check-cast v9, Landroidx/preference/SwitchPreference;

    .line 118
    .line 119
    const v10, 0x7f1403ae

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0, v10}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v10

    .line 126
    invoke-virtual {v0, v10}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 127
    .line 128
    .line 129
    move-result-object v10

    .line 130
    check-cast v10, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 131
    .line 132
    const v11, 0x7f1403a1

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0, v11}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v11

    .line 139
    invoke-virtual {v0, v11}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 140
    .line 141
    .line 142
    move-result-object v11

    .line 143
    check-cast v11, Landroidx/preference/SwitchPreference;

    .line 144
    .line 145
    const v12, 0x7f1403b4

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0, v12}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v12

    .line 152
    invoke-virtual {v0, v12}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 153
    .line 154
    .line 155
    move-result-object v12

    .line 156
    check-cast v12, Landroidx/preference/SwitchPreference;

    .line 157
    .line 158
    const v13, 0x7f1403ac

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0, v13}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v13

    .line 165
    invoke-virtual {v0, v13}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 166
    .line 167
    .line 168
    move-result-object v13

    .line 169
    check-cast v13, Landroidx/preference/SwitchPreference;

    .line 170
    .line 171
    const v14, 0x7f1403a6

    .line 172
    .line 173
    .line 174
    invoke-virtual {v0, v14}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v14

    .line 178
    invoke-virtual {v0, v14}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 179
    .line 180
    .line 181
    move-result-object v14

    .line 182
    check-cast v14, Landroidx/preference/SwitchPreference;

    .line 183
    .line 184
    const v15, 0x7f1403bd

    .line 185
    .line 186
    .line 187
    invoke-virtual {v0, v15}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v15

    .line 191
    invoke-virtual {v0, v15}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 192
    .line 193
    .line 194
    move-result-object v15

    .line 195
    check-cast v15, Landroidx/preference/SwitchPreference;

    .line 196
    .line 197
    const v8, 0x7f1403af

    .line 198
    .line 199
    .line 200
    invoke-virtual {v0, v8}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v8

    .line 204
    invoke-virtual {v0, v8}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 205
    .line 206
    .line 207
    move-result-object v8

    .line 208
    check-cast v8, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 209
    .line 210
    const v6, 0x7f1403b3

    .line 211
    .line 212
    .line 213
    invoke-virtual {v0, v6}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v6

    .line 217
    invoke-virtual {v0, v6}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 218
    .line 219
    .line 220
    move-result-object v6

    .line 221
    check-cast v6, Landroidx/preference/SwitchPreference;

    .line 222
    .line 223
    const/16 v16, 0x0

    .line 224
    .line 225
    move-object/from16 v17, v6

    .line 226
    .line 227
    if-eqz v2, :cond_2

    .line 228
    .line 229
    invoke-direct {v0}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->O()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v6

    .line 233
    invoke-virtual {v2, v6}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->J0(Ljava/lang/CharSequence;)V

    .line 234
    .line 235
    .line 236
    if-eqz v1, :cond_1

    .line 237
    .line 238
    const/4 v6, 0x1

    .line 239
    goto :goto_0

    .line 240
    :cond_1
    move/from16 v6, v16

    .line 241
    .line 242
    :goto_0
    invoke-virtual {v2, v6}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->v0(Z)V

    .line 243
    .line 244
    .line 245
    :cond_2
    if-eqz v3, :cond_6

    .line 246
    .line 247
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->s()Z

    .line 252
    .line 253
    .line 254
    move-result v2

    .line 255
    if-nez v2, :cond_4

    .line 256
    .line 257
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 258
    .line 259
    .line 260
    move-result-object v2

    .line 261
    invoke-static {v2}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 262
    .line 263
    .line 264
    move-result-object v2

    .line 265
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 266
    .line 267
    .line 268
    move-result-object v2

    .line 269
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 270
    .line 271
    .line 272
    move-result-object v6

    .line 273
    invoke-virtual {v2, v6}, Lcom/android/launcher3/b0;->i(Landroid/content/Context;)Landroid/graphics/Point;

    .line 274
    .line 275
    .line 276
    move-result-object v2

    .line 277
    if-eqz v2, :cond_4

    .line 278
    .line 279
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 280
    .line 281
    .line 282
    move-result-object v6

    .line 283
    invoke-static {v6}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 284
    .line 285
    .line 286
    move-result-object v6

    .line 287
    invoke-virtual {v6}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 288
    .line 289
    .line 290
    move-result-object v6

    .line 291
    iget-boolean v6, v6, Lcom/android/launcher3/r4;->Z:Z

    .line 292
    .line 293
    move/from16 v18, v6

    .line 294
    .line 295
    const v6, 0x7f140379

    .line 296
    .line 297
    .line 298
    if-eqz v18, :cond_3

    .line 299
    .line 300
    invoke-virtual {v0, v6}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v6

    .line 304
    move-object/from16 v18, v8

    .line 305
    .line 306
    iget v8, v2, Landroid/graphics/Point;->y:I

    .line 307
    .line 308
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 309
    .line 310
    .line 311
    move-result-object v8

    .line 312
    iget v2, v2, Landroid/graphics/Point;->x:I

    .line 313
    .line 314
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 315
    .line 316
    .line 317
    move-result-object v2

    .line 318
    filled-new-array {v8, v2}, [Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    move-result-object v2

    .line 322
    invoke-static {v6, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object v2

    .line 326
    invoke-virtual {v3, v2}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a1(Ljava/lang/CharSequence;)V

    .line 327
    .line 328
    .line 329
    goto :goto_1

    .line 330
    :cond_3
    move-object/from16 v18, v8

    .line 331
    .line 332
    invoke-virtual {v0, v6}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v6

    .line 336
    iget v8, v2, Landroid/graphics/Point;->y:I

    .line 337
    .line 338
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 339
    .line 340
    .line 341
    move-result-object v8

    .line 342
    iget v2, v2, Landroid/graphics/Point;->x:I

    .line 343
    .line 344
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 345
    .line 346
    .line 347
    move-result-object v2

    .line 348
    filled-new-array {v8, v2}, [Ljava/lang/Object;

    .line 349
    .line 350
    .line 351
    move-result-object v2

    .line 352
    invoke-static {v6, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object v2

    .line 356
    invoke-virtual {v3, v2}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->J0(Ljava/lang/CharSequence;)V

    .line 357
    .line 358
    .line 359
    goto :goto_1

    .line 360
    :cond_4
    move-object/from16 v18, v8

    .line 361
    .line 362
    :goto_1
    if-eqz v1, :cond_5

    .line 363
    .line 364
    const/4 v2, 0x1

    .line 365
    goto :goto_2

    .line 366
    :cond_5
    move/from16 v2, v16

    .line 367
    .line 368
    :goto_2
    invoke-virtual {v3, v2}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->v0(Z)V

    .line 369
    .line 370
    .line 371
    goto :goto_3

    .line 372
    :cond_6
    move-object/from16 v18, v8

    .line 373
    .line 374
    :goto_3
    if-eqz v4, :cond_c

    .line 375
    .line 376
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 377
    .line 378
    .line 379
    move-result-object v2

    .line 380
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 381
    .line 382
    .line 383
    move-result-object v3

    .line 384
    invoke-virtual {v3}, Lcom/android/launcher3/resource/B;->s()Z

    .line 385
    .line 386
    .line 387
    move-result v3

    .line 388
    if-eqz v3, :cond_7

    .line 389
    .line 390
    const v3, 0x7f140387

    .line 391
    .line 392
    .line 393
    goto :goto_4

    .line 394
    :cond_7
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 395
    .line 396
    .line 397
    move-result-object v3

    .line 398
    invoke-virtual {v3}, Lcom/android/launcher3/resource/B;->p()Z

    .line 399
    .line 400
    .line 401
    move-result v3

    .line 402
    if-eqz v3, :cond_8

    .line 403
    .line 404
    const v3, 0x7f140383

    .line 405
    .line 406
    .line 407
    goto :goto_4

    .line 408
    :cond_8
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 409
    .line 410
    .line 411
    move-result-object v3

    .line 412
    invoke-static {v3}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 413
    .line 414
    .line 415
    move-result-object v3

    .line 416
    invoke-virtual {v3}, Lcom/android/launcher3/H5;->M0()Z

    .line 417
    .line 418
    .line 419
    move-result v3

    .line 420
    if-eqz v3, :cond_9

    .line 421
    .line 422
    const v3, 0x7f14038c

    .line 423
    .line 424
    .line 425
    goto :goto_4

    .line 426
    :cond_9
    const v3, 0x7f140385

    .line 427
    .line 428
    .line 429
    :goto_4
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 430
    .line 431
    .line 432
    move-result-object v2

    .line 433
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 434
    .line 435
    .line 436
    move-result-object v3

    .line 437
    invoke-static {v3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 438
    .line 439
    .line 440
    move-result-object v3

    .line 441
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 442
    .line 443
    .line 444
    move-result-object v3

    .line 445
    iget-boolean v3, v3, Lcom/android/launcher3/r4;->Z:Z

    .line 446
    .line 447
    if-eqz v3, :cond_a

    .line 448
    .line 449
    invoke-virtual {v4, v2}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a1(Ljava/lang/CharSequence;)V

    .line 450
    .line 451
    .line 452
    goto :goto_5

    .line 453
    :cond_a
    invoke-virtual {v4, v2}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->J0(Ljava/lang/CharSequence;)V

    .line 454
    .line 455
    .line 456
    :goto_5
    if-eqz v1, :cond_b

    .line 457
    .line 458
    const/4 v2, 0x1

    .line 459
    goto :goto_6

    .line 460
    :cond_b
    move/from16 v2, v16

    .line 461
    .line 462
    :goto_6
    invoke-virtual {v4, v2}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->v0(Z)V

    .line 463
    .line 464
    .line 465
    :cond_c
    if-eqz v5, :cond_e

    .line 466
    .line 467
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 468
    .line 469
    .line 470
    move-result-object v2

    .line 471
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 472
    .line 473
    .line 474
    move-result-object v2

    .line 475
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 476
    .line 477
    .line 478
    move-result-object v2

    .line 479
    iget-boolean v2, v2, Lcom/android/launcher3/r4;->n0:Z

    .line 480
    .line 481
    if-eqz v2, :cond_e

    .line 482
    .line 483
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 484
    .line 485
    .line 486
    move-result-object v2

    .line 487
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 488
    .line 489
    .line 490
    move-result-object v2

    .line 491
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 492
    .line 493
    .line 494
    move-result-object v2

    .line 495
    iget v2, v2, Lcom/android/launcher3/r4;->o0:I

    .line 496
    .line 497
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 498
    .line 499
    .line 500
    move-result-object v3

    .line 501
    invoke-static {v3}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 502
    .line 503
    .line 504
    move-result-object v3

    .line 505
    const v4, 0x7f1403b7

    .line 506
    .line 507
    .line 508
    invoke-virtual {v0, v4}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 509
    .line 510
    .line 511
    move-result-object v4

    .line 512
    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 513
    .line 514
    .line 515
    move-result v2

    .line 516
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 517
    .line 518
    .line 519
    move-result-object v3

    .line 520
    const/4 v4, 0x1

    .line 521
    if-ne v2, v4, :ls_stack_summary_non_normal_1

    .line 522
    .line 523
    const v2, 0x7f1403c2

    .line 524
    .line 525
    .line 526
    goto :goto_7

    :ls_stack_summary_non_normal_1
    const/4 v4, 0x3

    if-ne v2, v4, :cond_d

    const v2, 0x7f1404b7

    const/4 v4, 0x1

    goto :goto_7

    .line 527
    :cond_d
    const/4 v4, 0x1

    const v2, 0x7f1403c1

    .line 528
    .line 529
    .line 530
    :goto_7
    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 531
    .line 532
    .line 533
    move-result-object v2

    .line 534
    invoke-virtual {v5, v2}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a1(Ljava/lang/CharSequence;)V

    .line 535
    .line 536
    .line 537
    :cond_e
    if-eqz v7, :cond_10

    .line 538
    .line 539
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 540
    .line 541
    .line 542
    move-result-object v2

    .line 543
    const-string v3, "com.zte.mifavor.zsearch"

    .line 544
    .line 545
    invoke-static {v2, v3}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 546
    .line 547
    .line 548
    move-result v2

    .line 549
    if-eqz v2, :cond_10

    .line 550
    .line 551
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 552
    .line 553
    .line 554
    move-result-object v2

    .line 555
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 556
    .line 557
    .line 558
    move-result-object v2

    .line 559
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 560
    .line 561
    .line 562
    move-result-object v2

    .line 563
    iget v2, v2, Lcom/android/launcher3/r4;->r:I

    .line 564
    .line 565
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 566
    .line 567
    .line 568
    move-result-object v3

    .line 569
    invoke-static {v3}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 570
    .line 571
    .line 572
    move-result-object v3

    .line 573
    const v4, 0x7f1403bb

    .line 574
    .line 575
    .line 576
    invoke-virtual {v0, v4}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 577
    .line 578
    .line 579
    move-result-object v4

    .line 580
    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 581
    .line 582
    .line 583
    move-result v2

    .line 584
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 585
    .line 586
    .line 587
    move-result-object v3

    .line 588
    if-nez v2, :cond_f

    .line 589
    .line 590
    const v2, 0x7f1403df

    .line 591
    .line 592
    .line 593
    goto :goto_8

    .line 594
    :cond_f
    const v2, 0x7f1403e0

    .line 595
    .line 596
    .line 597
    :goto_8
    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 598
    .line 599
    .line 600
    move-result-object v2

    .line 601
    invoke-virtual {v7, v2}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a1(Ljava/lang/CharSequence;)V

    .line 602
    .line 603
    .line 604
    :cond_10
    if-eqz v9, :cond_12

    .line 605
    .line 606
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 607
    .line 608
    .line 609
    move-result-object v2

    .line 610
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 611
    .line 612
    .line 613
    move-result-object v2

    .line 614
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 615
    .line 616
    .line 617
    move-result-object v2

    .line 618
    iget-boolean v2, v2, Lcom/android/launcher3/r4;->s:Z

    .line 619
    .line 620
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 621
    .line 622
    .line 623
    move-result-object v3

    .line 624
    invoke-static {v3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 625
    .line 626
    .line 627
    move-result-object v3

    .line 628
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 629
    .line 630
    .line 631
    move-result-object v3

    .line 632
    invoke-virtual {v3}, Lcom/android/launcher3/r4;->w()Z

    .line 633
    .line 634
    .line 635
    move-result v3

    .line 636
    if-eqz v3, :cond_11

    .line 637
    .line 638
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 639
    .line 640
    .line 641
    move-result-object v2

    .line 642
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 643
    .line 644
    .line 645
    move-result-object v2

    .line 646
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 647
    .line 648
    .line 649
    move-result-object v2

    .line 650
    invoke-virtual {v2, v1}, Lcom/android/launcher3/r4;->C(Landroid/content/Context;)Z

    .line 651
    .line 652
    .line 653
    move-result v2

    .line 654
    :cond_11
    invoke-virtual {v9, v2}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 655
    .line 656
    .line 657
    :cond_12
    if-eqz v10, :cond_16

    .line 658
    .line 659
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 660
    .line 661
    .line 662
    move-result-object v1

    .line 663
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 664
    .line 665
    .line 666
    move-result-object v1

    .line 667
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 668
    .line 669
    .line 670
    move-result-object v1

    .line 671
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 672
    .line 673
    .line 674
    move-result-object v2

    .line 675
    iget v1, v1, Lcom/android/launcher3/r4;->y:I

    .line 676
    .line 677
    sget v3, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->L:I

    .line 678
    .line 679
    if-ne v1, v3, :cond_13

    .line 680
    .line 681
    const v1, 0x7f140105

    .line 682
    .line 683
    .line 684
    goto :goto_9

    .line 685
    :cond_13
    sget v3, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->M:I

    .line 686
    .line 687
    if-ne v1, v3, :cond_15

    .line 688
    .line 689
    invoke-static {}, Lx1/S;->r()Z

    .line 690
    .line 691
    .line 692
    move-result v1

    .line 693
    if-eqz v1, :cond_14

    .line 694
    .line 695
    const v1, 0x7f14010a

    .line 696
    .line 697
    .line 698
    goto :goto_9

    .line 699
    :cond_14
    const v1, 0x7f140109

    .line 700
    .line 701
    .line 702
    goto :goto_9

    .line 703
    :cond_15
    const v1, 0x7f140106

    .line 704
    .line 705
    .line 706
    :goto_9
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 707
    .line 708
    .line 709
    move-result-object v1

    .line 710
    invoke-virtual {v10, v1}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a1(Ljava/lang/CharSequence;)V

    .line 711
    .line 712
    .line 713
    :cond_16
    if-eqz v11, :cond_17

    .line 714
    .line 715
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->t()Z

    .line 716
    .line 717
    .line 718
    move-result v1

    .line 719
    invoke-virtual {v11, v1}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 720
    .line 721
    .line 722
    :cond_17
    if-eqz v12, :cond_18

    .line 723
    .line 724
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 725
    .line 726
    .line 727
    move-result-object v1

    .line 728
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 729
    .line 730
    .line 731
    move-result-object v1

    .line 732
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 733
    .line 734
    .line 735
    move-result-object v1

    .line 736
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->h:Z

    .line 737
    .line 738
    invoke-virtual {v12, v1}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 739
    .line 740
    .line 741
    :cond_18
    if-eqz v13, :cond_19

    .line 742
    .line 743
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 744
    .line 745
    .line 746
    move-result-object v1

    .line 747
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 748
    .line 749
    .line 750
    move-result-object v1

    .line 751
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 752
    .line 753
    .line 754
    move-result-object v1

    .line 755
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->z:Z

    .line 756
    .line 757
    if-eqz v1, :cond_19

    .line 758
    .line 759
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 760
    .line 761
    .line 762
    move-result-object v1

    .line 763
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 764
    .line 765
    .line 766
    move-result-object v1

    .line 767
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 768
    .line 769
    .line 770
    move-result-object v1

    .line 771
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->t:Z

    .line 772
    .line 773
    invoke-virtual {v13, v1}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 774
    .line 775
    .line 776
    :cond_19
    if-eqz v14, :cond_1a

    .line 777
    .line 778
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 779
    .line 780
    .line 781
    move-result-object v1

    .line 782
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 783
    .line 784
    .line 785
    move-result-object v1

    .line 786
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 787
    .line 788
    .line 789
    move-result-object v1

    .line 790
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->p:Z

    .line 791
    .line 792
    invoke-virtual {v14, v1}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 793
    .line 794
    .line 795
    :cond_1a
    if-eqz v15, :cond_1b

    .line 796
    .line 797
    invoke-static {}, Lx1/O;->L3()Z

    .line 798
    .line 799
    .line 800
    move-result v1

    .line 801
    if-eqz v1, :cond_1b

    .line 802
    .line 803
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 804
    .line 805
    .line 806
    move-result-object v1

    .line 807
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 808
    .line 809
    .line 810
    move-result-object v1

    .line 811
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 812
    .line 813
    .line 814
    move-result-object v1

    .line 815
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->u:Z

    .line 816
    .line 817
    invoke-virtual {v15, v1}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 818
    .line 819
    .line 820
    :cond_1b
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 821
    .line 822
    .line 823
    move-result-object v1

    .line 824
    invoke-virtual {v1}, Lcom/android/launcher3/resource/B;->p()Z

    .line 825
    .line 826
    .line 827
    move-result v1

    .line 828
    if-eqz v1, :cond_1e

    .line 829
    .line 830
    if-eqz v18, :cond_1e

    .line 831
    .line 832
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 833
    .line 834
    .line 835
    move-result-object v1

    .line 836
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 837
    .line 838
    .line 839
    move-result-object v1

    .line 840
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 841
    .line 842
    .line 843
    move-result-object v1

    .line 844
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->l:Z

    .line 845
    .line 846
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 847
    .line 848
    .line 849
    move-result-object v2

    .line 850
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 851
    .line 852
    .line 853
    move-result-object v2

    .line 854
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 855
    .line 856
    .line 857
    move-result-object v2

    .line 858
    iget-object v2, v2, Lcom/android/launcher3/r4;->m:Ljava/lang/String;

    .line 859
    .line 860
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 861
    .line 862
    .line 863
    move-result-object v3

    .line 864
    if-eqz v1, :cond_1d

    .line 865
    .line 866
    const-string v1, "pointer_clock_default"

    .line 867
    .line 868
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 869
    .line 870
    .line 871
    move-result v1

    .line 872
    if-eqz v1, :cond_1c

    .line 873
    .line 874
    const v1, 0x7f140181

    .line 875
    .line 876
    .line 877
    goto :goto_a

    .line 878
    :cond_1c
    const v1, 0x7f14017f

    .line 879
    .line 880
    .line 881
    goto :goto_a

    .line 882
    :cond_1d
    const v1, 0x7f140180

    .line 883
    .line 884
    .line 885
    :goto_a
    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 886
    .line 887
    .line 888
    move-result-object v1

    .line 889
    move-object/from16 v8, v18

    .line 890
    .line 891
    invoke-virtual {v8, v1}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a1(Ljava/lang/CharSequence;)V

    .line 892
    .line 893
    .line 894
    :cond_1e
    if-eqz v17, :cond_1f

    .line 895
    .line 896
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 897
    .line 898
    .line 899
    move-result-object v1

    .line 900
    invoke-virtual {v1}, Lcom/android/launcher3/resource/B;->p()Z

    .line 901
    .line 902
    .line 903
    move-result v1

    .line 904
    if-nez v1, :cond_1f

    .line 905
    .line 906
    invoke-static {}, Lx1/O;->k1()Z

    .line 907
    .line 908
    .line 909
    move-result v1

    .line 910
    if-nez v1, :cond_1f

    .line 911
    .line 912
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 913
    .line 914
    .line 915
    move-result-object v0

    .line 916
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 917
    .line 918
    .line 919
    move-result-object v0

    .line 920
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 921
    .line 922
    .line 923
    move-result-object v0

    .line 924
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->k:Z

    .line 925
    .line 926
    move-object/from16 v6, v17

    .line 927
    .line 928
    invoke-virtual {v6, v0}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 929
    .line 930
    .line 931
    :cond_1f
    return-void
.end method

.method private W(Landroid/content/Context;Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {p0, p2}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->N(Z)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 p2, 0x0

    .line 14
    invoke-interface {p1, p0, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private X(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private static Y(Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;ILcom/android/launcher3/settings/SettingsActivityMFV$a;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const v2, 0x7f0e0170

    .line 10
    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const v2, 0x7f0b0212

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Landroid/widget/TextView;

    .line 25
    .line 26
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(I)V

    .line 27
    .line 28
    .line 29
    new-instance p1, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$c;

    .line 30
    .line 31
    invoke-direct {p1, p2}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$c;-><init>(Lcom/android/launcher3/settings/SettingsActivityMFV$a;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1, v3}, LK1/g;->c(Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;)LK1/g;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-instance v2, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$d;

    .line 39
    .line 40
    invoke-direct {v2, v1, p2}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$d;-><init>(Landroid/view/View;Lcom/android/launcher3/settings/SettingsActivityMFV$a;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v2, v3}, LK1/g;->c(Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;)LK1/g;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    new-instance v4, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$e;

    .line 48
    .line 49
    invoke-direct {v4, p2, p0}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$e;-><init>(Lcom/android/launcher3/settings/SettingsActivityMFV$a;Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v3, v4}, LK1/g;->c(Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;)LK1/g;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    new-instance v3, Lx1/e;

    .line 57
    .line 58
    invoke-direct {v3, v0}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v3, v1}, Lx1/e;->o(Landroid/view/View;)Lx1/e;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const v1, 0x7f14037b

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lx1/e;->n(I)Lx1/e;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const v1, 0x7f1400f7

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1, p1}, Lx1/e;->f(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const v1, 0x7f140184

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v1, v2}, Lx1/e;->j(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0, p2}, Lx1/e;->i(Landroid/content/DialogInterface$OnDismissListener;)Lx1/e;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Lx1/e;->p()Landroid/app/Dialog;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iput-object v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->r:Landroid/app/Dialog;

    .line 95
    .line 96
    invoke-virtual {p1, v0}, LK1/g;->b(Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->r:Landroid/app/Dialog;

    .line 100
    .line 101
    invoke-virtual {v2, p1}, LK1/g;->b(Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->r:Landroid/app/Dialog;

    .line 105
    .line 106
    invoke-virtual {p2, p0}, LK1/g;->b(Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method private Z(Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f1403df

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const v2, 0x7f1403e0

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget v1, v1, Lcom/android/launcher3/r4;->q:I

    .line 40
    .line 41
    new-instance v2, LK1/l;

    .line 42
    .line 43
    invoke-direct {v2}, LK1/l;-><init>()V

    .line 44
    .line 45
    .line 46
    const/4 v3, 0x0

    .line 47
    invoke-static {v2, v3}, LK1/g;->c(Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;)LK1/g;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    new-instance v4, LK1/m;

    .line 52
    .line 53
    invoke-direct {v4, p1}, LK1/m;-><init>(Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v3, v4}, LK1/g;->c(Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;)LK1/g;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    new-instance v4, Lx1/e;

    .line 61
    .line 62
    invoke-virtual {p1}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    invoke-direct {v4, v5}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 67
    .line 68
    .line 69
    new-instance v5, LK1/n;

    .line 70
    .line 71
    invoke-direct {v5, p0, v1}, LK1/n;-><init>(Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;I)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v4, v0, v1, v5}, Lx1/e;->m([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const v1, 0x7f1403e1

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Lx1/e;->n(I)Lx1/e;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const v1, 0x7f1400f7

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1, v2}, Lx1/e;->f(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0, v3}, Lx1/e;->i(Landroid/content/DialogInterface$OnDismissListener;)Lx1/e;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Lx1/e;->p()Landroid/app/Dialog;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p1, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->r:Landroid/app/Dialog;

    .line 101
    .line 102
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-eqz v0, :cond_0

    .line 107
    .line 108
    iget-object v0, p1, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->r:Landroid/app/Dialog;

    .line 109
    .line 110
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    const v1, 0x7f070ab2

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    const/4 v1, -0x2

    .line 126
    invoke-virtual {v0, p0, v1}, Landroid/view/Window;->setLayout(II)V

    .line 127
    .line 128
    .line 129
    :cond_0
    iget-object p0, p1, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->r:Landroid/app/Dialog;

    .line 130
    .line 131
    invoke-virtual {v2, p0}, LK1/g;->b(Ljava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    iget-object p0, p1, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->r:Landroid/app/Dialog;

    .line 135
    .line 136
    invoke-virtual {v3, p0}, LK1/g;->b(Ljava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    return-void
.end method


# virtual methods
.method public L(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->K0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto/16 :goto_1

    .line 16
    .line 17
    :cond_0
    const v0, 0x7f1403ac

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Landroidx/preference/SwitchPreference;

    .line 29
    .line 30
    const v1, 0x7f1403ad

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p0, v1}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Landroidx/preference/SwitchPreference;

    .line 42
    .line 43
    invoke-virtual {v0}, Landroidx/preference/TwoStatePreference;->U0()Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    invoke-virtual {v1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-nez v2, :cond_2

    .line 58
    .line 59
    :cond_1
    invoke-virtual {v1}, Landroidx/preference/TwoStatePreference;->U0()Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz v2, :cond_7

    .line 64
    .line 65
    invoke-virtual {v0}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-eqz v2, :cond_7

    .line 74
    .line 75
    :cond_2
    invoke-virtual {v0}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-direct {p0, v2, p1}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->S(Landroid/content/Context;Z)Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-eqz v2, :cond_5

    .line 92
    .line 93
    if-eqz p1, :cond_4

    .line 94
    .line 95
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-static {v2}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->J0()Z

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    if-eqz v2, :cond_3

    .line 108
    .line 109
    const v2, 0x7f140187

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_3
    const v2, 0x7f140186

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_4
    const v2, 0x7f140188

    .line 118
    .line 119
    .line 120
    :goto_0
    new-instance v3, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;

    .line 121
    .line 122
    invoke-direct {v3, p0, p1, v0, v1}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$b;-><init>(Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;ZLandroidx/preference/SwitchPreference;Landroidx/preference/SwitchPreference;)V

    .line 123
    .line 124
    .line 125
    invoke-static {p0, v2, v3}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->Y(Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;ILcom/android/launcher3/settings/SettingsActivityMFV$a;)V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :cond_5
    const/4 v2, 0x0

    .line 130
    if-eqz p1, :cond_6

    .line 131
    .line 132
    invoke-virtual {v1, v2}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-direct {p0, p1, v2}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->X(Ljava/lang/String;Z)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_6
    invoke-virtual {v0, v2}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-direct {p0, p1, v2}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->X(Ljava/lang/String;Z)V

    .line 151
    .line 152
    .line 153
    :cond_7
    :goto_1
    return-void
.end method

.method public V()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->v:Z

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->r:Landroid/app/Dialog;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    const v2, 0x7f0b0212

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v2}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/widget/TextView;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v2}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->J0()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    const v2, 0x7f140187

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const v2, 0x7f140186

    .line 40
    .line 41
    .line 42
    :goto_0
    invoke-virtual {p0, v2}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    move v0, v1

    .line 60
    :goto_1
    iget-object v2, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->r:Landroid/app/Dialog;

    .line 61
    .line 62
    invoke-virtual {v2}, Landroid/app/Dialog;->dismiss()V

    .line 63
    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_2
    move v0, v1

    .line 67
    :goto_2
    const v2, 0x7f1403ac

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, v2}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {p0, v3}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    check-cast v3, Landroidx/preference/SwitchPreference;

    .line 79
    .line 80
    invoke-virtual {v3}, Landroidx/preference/TwoStatePreference;->U0()Z

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    const v4, 0x7f1403ad

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, v4}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    invoke-virtual {p0, v5}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    check-cast v5, Landroidx/preference/SwitchPreference;

    .line 96
    .line 97
    invoke-virtual {v5}, Landroidx/preference/TwoStatePreference;->U0()Z

    .line 98
    .line 99
    .line 100
    move-result v5

    .line 101
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 102
    .line 103
    .line 104
    move-result-object v6

    .line 105
    invoke-static {v6}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 106
    .line 107
    .line 108
    move-result-object v6

    .line 109
    invoke-virtual {v6}, Lcom/android/launcher3/H5;->K0()Z

    .line 110
    .line 111
    .line 112
    move-result v6

    .line 113
    if-nez v6, :cond_4

    .line 114
    .line 115
    if-eqz v3, :cond_4

    .line 116
    .line 117
    if-eqz v5, :cond_4

    .line 118
    .line 119
    if-eqz v0, :cond_3

    .line 120
    .line 121
    move v3, v1

    .line 122
    goto :goto_3

    .line 123
    :cond_3
    move v5, v1

    .line 124
    :cond_4
    :goto_3
    invoke-virtual {p0, v2}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    check-cast v0, Landroidx/preference/SwitchPreference;

    .line 133
    .line 134
    invoke-virtual {p0, v4}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    invoke-virtual {p0, v2}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    check-cast v2, Landroidx/preference/SwitchPreference;

    .line 143
    .line 144
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 145
    .line 146
    .line 147
    move-result-object v4

    .line 148
    invoke-static {v4}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 149
    .line 150
    .line 151
    move-result-object v4

    .line 152
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    invoke-virtual {v0}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-interface {v4, v0, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-static {v0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    invoke-virtual {v2}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    invoke-interface {v0, v2, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 188
    .line 189
    .line 190
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-virtual {v0, v5}, Lcom/android/launcher3/r4;->F(Z)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v0, v3}, Lcom/android/launcher3/r4;->E(Z)V

    .line 206
    .line 207
    .line 208
    iput-boolean v1, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->v:Z

    .line 209
    .line 210
    :cond_5
    return-void
.end method

.method public d(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 11

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onPreferenceChange "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, " "

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "SettingsAtyFragment"

    .line 31
    .line 32
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    iget-boolean v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->u:Z

    .line 36
    .line 37
    const v1, 0x7f1403ad

    .line 38
    .line 39
    .line 40
    const v2, 0x7f1403ac

    .line 41
    .line 42
    .line 43
    const/4 v3, 0x1

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-boolean v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->t:Z

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v2}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_0

    .line 63
    .line 64
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p0, v1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_3

    .line 77
    .line 78
    :cond_0
    iput-boolean v3, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->v:Z

    .line 79
    .line 80
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p0, v0}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->L(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_1
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p0, v2}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_2

    .line 101
    .line 102
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    move-object v2, p2

    .line 115
    check-cast v2, Ljava/lang/Boolean;

    .line 116
    .line 117
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    invoke-virtual {v0, v2}, Lcom/android/launcher3/r4;->E(Z)V

    .line 122
    .line 123
    .line 124
    :cond_2
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {p0, v1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_3

    .line 137
    .line 138
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    move-object v1, p2

    .line 151
    check-cast v1, Ljava/lang/Boolean;

    .line 152
    .line 153
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    invoke-virtual {v0, v1}, Lcom/android/launcher3/r4;->F(Z)V

    .line 158
    .line 159
    .line 160
    :cond_3
    :goto_0
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    const v1, 0x7f1403b4

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0, v1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    const v1, 0x7f1403b1

    .line 176
    .line 177
    .line 178
    if-eqz v0, :cond_4

    .line 179
    .line 180
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    move-object v2, p2

    .line 193
    check-cast v2, Ljava/lang/Boolean;

    .line 194
    .line 195
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 196
    .line 197
    .line 198
    move-result v2

    .line 199
    invoke-virtual {v0, v2}, Lcom/android/launcher3/r4;->K(Z)V

    .line 200
    .line 201
    .line 202
    goto/16 :goto_1

    .line 203
    .line 204
    :cond_4
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-virtual {p0, v1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v2

    .line 212
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-eqz v0, :cond_5

    .line 217
    .line 218
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    move-object v2, p2

    .line 231
    check-cast v2, Ljava/lang/Boolean;

    .line 232
    .line 233
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 234
    .line 235
    .line 236
    move-result v2

    .line 237
    invoke-virtual {v0, v2}, Lcom/android/launcher3/r4;->H(Z)V

    .line 238
    .line 239
    .line 240
    goto :goto_1

    .line 241
    :cond_5
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    const v2, 0x7f1403a6

    .line 246
    .line 247
    .line 248
    invoke-virtual {p0, v2}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    if-eqz v0, :cond_6

    .line 257
    .line 258
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 263
    .line 264
    .line 265
    move-result-object v0

    .line 266
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    move-object v2, p2

    .line 271
    check-cast v2, Ljava/lang/Boolean;

    .line 272
    .line 273
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 274
    .line 275
    .line 276
    move-result v2

    .line 277
    invoke-virtual {v0, v2}, Lcom/android/launcher3/r4;->D(Z)V

    .line 278
    .line 279
    .line 280
    goto :goto_1

    .line 281
    :cond_6
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    const v2, 0x7f1403bd

    .line 286
    .line 287
    .line 288
    invoke-virtual {p0, v2}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v2

    .line 292
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 293
    .line 294
    .line 295
    move-result v0

    .line 296
    if-eqz v0, :cond_7

    .line 297
    .line 298
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    move-object v2, p2

    .line 311
    check-cast v2, Ljava/lang/Boolean;

    .line 312
    .line 313
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 314
    .line 315
    .line 316
    move-result v4

    .line 317
    invoke-virtual {v0, v4}, Lcom/android/launcher3/r4;->M(Z)V

    .line 318
    .line 319
    .line 320
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 329
    .line 330
    .line 331
    move-result v2

    .line 332
    const-string v4, "launcher_unlock_animation"

    .line 333
    .line 334
    invoke-static {v0, v4, v2}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 335
    .line 336
    .line 337
    goto :goto_1

    .line 338
    :cond_7
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    const v2, 0x7f1403a1

    .line 343
    .line 344
    .line 345
    invoke-virtual {p0, v2}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object v2

    .line 349
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 350
    .line 351
    .line 352
    move-result v0

    .line 353
    if-eqz v0, :cond_8

    .line 354
    .line 355
    iput-boolean v3, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->w:Z

    .line 356
    .line 357
    :cond_8
    :goto_1
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object v0

    .line 361
    invoke-virtual {p0, v1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object v1

    .line 365
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 366
    .line 367
    .line 368
    move-result v0

    .line 369
    if-eqz v0, :cond_9

    .line 370
    .line 371
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 372
    .line 373
    .line 374
    move-result-object v0

    .line 375
    invoke-static {v0}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 376
    .line 377
    .line 378
    move-result-object v0

    .line 379
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 380
    .line 381
    .line 382
    move-result-object v0

    .line 383
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 384
    .line 385
    .line 386
    move-result-object v1

    .line 387
    move-object v2, p2

    .line 388
    check-cast v2, Ljava/lang/Boolean;

    .line 389
    .line 390
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 391
    .line 392
    .line 393
    move-result v2

    .line 394
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 395
    .line 396
    .line 397
    move-result-object v0

    .line 398
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 399
    .line 400
    .line 401
    goto/16 :goto_2

    .line 402
    .line 403
    :cond_9
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 404
    .line 405
    .line 406
    move-result-object v0

    .line 407
    const v1, 0x7f1403b3

    .line 408
    .line 409
    .line 410
    invoke-virtual {p0, v1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 411
    .line 412
    .line 413
    move-result-object v1

    .line 414
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 415
    .line 416
    .line 417
    move-result v0

    .line 418
    if-eqz v0, :cond_a

    .line 419
    .line 420
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 421
    .line 422
    .line 423
    move-result-object v0

    .line 424
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 425
    .line 426
    .line 427
    move-result-object v0

    .line 428
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 429
    .line 430
    .line 431
    move-result-object v0

    .line 432
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 433
    .line 434
    .line 435
    move-result-object v1

    .line 436
    move-object v2, p2

    .line 437
    check-cast v2, Ljava/lang/Boolean;

    .line 438
    .line 439
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 440
    .line 441
    .line 442
    move-result v2

    .line 443
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/r4;->I(Landroid/content/Context;Z)V

    .line 444
    .line 445
    .line 446
    goto :goto_2

    .line 447
    :cond_a
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 448
    .line 449
    .line 450
    move-result-object v0

    .line 451
    const v1, 0x7f1403a3

    .line 452
    .line 453
    .line 454
    invoke-virtual {p0, v1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 455
    .line 456
    .line 457
    move-result-object v2

    .line 458
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 459
    .line 460
    .line 461
    move-result v0

    .line 462
    if-eqz v0, :cond_b

    .line 463
    .line 464
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 465
    .line 466
    .line 467
    move-result-object v0

    .line 468
    invoke-static {v0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 469
    .line 470
    .line 471
    move-result-object v0

    .line 472
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 473
    .line 474
    .line 475
    move-result-object v0

    .line 476
    invoke-virtual {p0, v1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 477
    .line 478
    .line 479
    move-result-object v1

    .line 480
    move-object v2, p2

    .line 481
    check-cast v2, Ljava/lang/Boolean;

    .line 482
    .line 483
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 484
    .line 485
    .line 486
    move-result v2

    .line 487
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 488
    .line 489
    .line 490
    move-result-object v0

    .line 491
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 492
    .line 493
    .line 494
    sget-object v0, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 495
    .line 496
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 497
    .line 498
    .line 499
    move-result-object v1

    .line 500
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 501
    .line 502
    .line 503
    move-result-object v0

    .line 504
    move-object v4, v0

    .line 505
    check-cast v4, Lcom/android/launcher3/F1;

    .line 506
    .line 507
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 508
    .line 509
    .line 510
    move-result-object v5

    .line 511
    const/4 v9, 0x0

    .line 512
    const/4 v10, 0x1

    .line 513
    const/4 v6, 0x0

    .line 514
    const/4 v7, 0x0

    .line 515
    const/4 v8, 0x0

    .line 516
    invoke-virtual/range {v4 .. v10}, Lcom/android/launcher3/F1;->q0(Landroid/content/Context;ZZZZZ)V

    .line 517
    .line 518
    .line 519
    goto :goto_2

    .line 520
    :cond_b
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 521
    .line 522
    .line 523
    move-result-object v0

    .line 524
    move-object v1, p2

    .line 525
    check-cast v1, Ljava/lang/Boolean;

    .line 526
    .line 527
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 528
    .line 529
    .line 530
    move-result v1

    .line 531
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->X(Ljava/lang/String;Z)V

    .line 532
    .line 533
    .line 534
    :goto_2
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 535
    .line 536
    .line 537
    move-result-object v0

    .line 538
    const-string v1, "pref_allowRotation"

    .line 539
    .line 540
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 541
    .line 542
    .line 543
    move-result v0

    .line 544
    if-eqz v0, :cond_c

    .line 545
    .line 546
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 547
    .line 548
    .line 549
    move-result-object v0

    .line 550
    if-eqz v0, :cond_c

    .line 551
    .line 552
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 553
    .line 554
    .line 555
    move-result-object v0

    .line 556
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->s2()LQ1/d;

    .line 557
    .line 558
    .line 559
    move-result-object v0

    .line 560
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 561
    .line 562
    .line 563
    move-result-object v2

    .line 564
    invoke-static {v2}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 565
    .line 566
    .line 567
    move-result-object v2

    .line 568
    invoke-interface {v0, v2, v1}, Lcom/android/launcher3/F3;->onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 569
    .line 570
    .line 571
    :cond_c
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 572
    .line 573
    .line 574
    move-result-object p1

    .line 575
    check-cast p2, Ljava/lang/Boolean;

    .line 576
    .line 577
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 578
    .line 579
    .line 580
    move-result p2

    .line 581
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->M(Ljava/lang/String;Z)V

    .line 582
    .line 583
    .line 584
    return v3
.end method

.method public f(Landroidx/preference/Preference;)Z
    .locals 9

    .line 1
    const-string v0, "SettingsAtyFragment"

    .line 2
    .line 3
    const-string v1, "onPreferenceClick"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    const v3, 0x7f1403bc

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v3}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    const-string v4, "isFromSettings"

    .line 28
    .line 29
    const v5, 0x7f140155

    .line 30
    .line 31
    .line 32
    const v6, 0xa245

    .line 33
    .line 34
    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    iget-wide v2, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->s:J

    .line 38
    .line 39
    sub-long/2addr v2, v0

    .line 40
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    .line 41
    .line 42
    .line 43
    move-result-wide v2

    .line 44
    const-wide/16 v7, 0x1f4

    .line 45
    .line 46
    cmp-long v2, v2, v7

    .line 47
    .line 48
    if-lez v2, :cond_8

    .line 49
    .line 50
    iput-wide v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->s:J

    .line 51
    .line 52
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const v1, 0x7f14014f

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-static {v0, v1}, Lh1/a;->M(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->B()Lcom/android/launcher3/H5$c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    sget-object v1, Lcom/android/launcher3/H5$c;->h:Lcom/android/launcher3/H5$c;

    .line 87
    .line 88
    if-ne v0, v1, :cond_0

    .line 89
    .line 90
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->E0()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-nez v0, :cond_0

    .line 103
    .line 104
    new-instance v0, Lx1/h;

    .line 105
    .line 106
    invoke-direct {v0}, Lx1/h;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    new-instance v2, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$a;

    .line 114
    .line 115
    invoke-direct {v2, p0, p1}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment$a;-><init>(Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;Landroidx/preference/Preference;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0, v1, v2}, Lx1/h;->a(Landroid/content/Context;Lx1/h$c;)V

    .line 119
    .line 120
    .line 121
    goto/16 :goto_0

    .line 122
    .line 123
    :cond_0
    new-instance v0, Landroid/content/Intent;

    .line 124
    .line 125
    invoke-virtual {p1}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    const-class v1, Lcom/android/launcher3/settings/SubscriptActivity;

    .line 130
    .line 131
    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 132
    .line 133
    .line 134
    invoke-static {}, Lcom/android/launcher3/settings/SettingsActivityMFV;->q0()Z

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    invoke-virtual {v0, v4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-virtual {p0, v0, v6}, Landroidx/activity/h;->startActivityForResult(Landroid/content/Intent;I)V

    .line 146
    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :cond_1
    const v0, 0x7f1403a2

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_2

    .line 162
    .line 163
    new-instance p1, Landroid/content/Intent;

    .line 164
    .line 165
    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 166
    .line 167
    .line 168
    const-string v0, "com.zte.beautify"

    .line 169
    .line 170
    const-string v1, "com.zte.beautify.IconChooseActivity"

    .line 171
    .line 172
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 173
    .line 174
    .line 175
    :try_start_0
    invoke-virtual {p0, p1}, Landroidx/fragment/app/n;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :catch_0
    move-exception p0

    .line 181
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 182
    .line 183
    .line 184
    goto/16 :goto_0

    .line 185
    .line 186
    :cond_2
    const v0, 0x7f1403b0

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    if-eqz v0, :cond_3

    .line 198
    .line 199
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    const v1, 0x7f14014d

    .line 204
    .line 205
    .line 206
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    invoke-static {v0, v1}, Lh1/a;->M(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    new-instance v0, Landroid/content/Intent;

    .line 226
    .line 227
    invoke-virtual {p1}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    const-class v1, Lcom/android/launcher3/settings/DesktopGridActivity;

    .line 232
    .line 233
    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {p0, v0, v6}, Landroidx/activity/h;->startActivityForResult(Landroid/content/Intent;I)V

    .line 237
    .line 238
    .line 239
    goto/16 :goto_0

    .line 240
    .line 241
    :cond_3
    const v0, 0x7f1403b2

    .line 242
    .line 243
    .line 244
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    if-eqz v0, :cond_4

    .line 253
    .line 254
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    const v1, 0x7f14014e

    .line 259
    .line 260
    .line 261
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    invoke-static {v0, v1}, Lh1/a;->M(Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    new-instance v0, Landroid/content/Intent;

    .line 277
    .line 278
    invoke-virtual {p1}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 279
    .line 280
    .line 281
    move-result-object p1

    .line 282
    const-class v1, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;

    .line 283
    .line 284
    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 285
    .line 286
    .line 287
    invoke-static {}, Lcom/android/launcher3/settings/SettingsActivityMFV;->q0()Z

    .line 288
    .line 289
    .line 290
    move-result p1

    .line 291
    invoke-virtual {v0, v4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 292
    .line 293
    .line 294
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 295
    .line 296
    .line 297
    move-result-object p0

    .line 298
    invoke-virtual {p0, v0, v6}, Landroidx/activity/h;->startActivityForResult(Landroid/content/Intent;I)V

    .line 299
    .line 300
    .line 301
    goto/16 :goto_0

    .line 302
    .line 303
    :cond_4
    const v0, 0x7f1403bb

    .line 304
    .line 305
    .line 306
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 311
    .line 312
    .line 313
    move-result v0

    .line 314
    if-eqz v0, :cond_5

    .line 315
    .line 316
    invoke-direct {p0, p0}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->Z(Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;)V

    .line 317
    .line 318
    .line 319
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 320
    .line 321
    .line 322
    move-result-object p1

    .line 323
    const v0, 0x7f140153

    .line 324
    .line 325
    .line 326
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object p1

    .line 330
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 331
    .line 332
    .line 333
    move-result-object p0

    .line 334
    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object p0

    .line 338
    invoke-static {p1, p0}, Lh1/a;->M(Ljava/lang/String;Ljava/lang/String;)V

    .line 339
    .line 340
    .line 341
    goto :goto_0

    .line 342
    :cond_5
    const v0, 0x7f1403b7

    .line 343
    .line 344
    .line 345
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object v0

    .line 349
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 350
    .line 351
    .line 352
    move-result v0

    .line 353
    if-eqz v0, :cond_6

    .line 354
    .line 355
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 356
    .line 357
    .line 358
    move-result-object p0

    .line 359
    new-instance v0, Landroid/content/Intent;

    .line 360
    .line 361
    invoke-virtual {p1}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 362
    .line 363
    .line 364
    move-result-object p1

    .line 365
    const-class v1, Lcom/android/launcher3/settings/RecentAppStyleActivity;

    .line 366
    .line 367
    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 368
    .line 369
    .line 370
    invoke-virtual {p0, v0, v6}, Landroidx/activity/h;->startActivityForResult(Landroid/content/Intent;I)V

    .line 371
    .line 372
    .line 373
    goto :goto_0

    .line 374
    :cond_6
    const v0, 0x7f1403af

    .line 375
    .line 376
    .line 377
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 378
    .line 379
    .line 380
    move-result-object v0

    .line 381
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 382
    .line 383
    .line 384
    move-result v0

    .line 385
    if-eqz v0, :cond_7

    .line 386
    .line 387
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 388
    .line 389
    .line 390
    move-result-object v0

    .line 391
    new-instance v1, Landroid/content/Intent;

    .line 392
    .line 393
    invoke-virtual {p1}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 394
    .line 395
    .line 396
    move-result-object p1

    .line 397
    const-class v2, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;

    .line 398
    .line 399
    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 400
    .line 401
    .line 402
    invoke-virtual {v0, v1, v6}, Landroidx/activity/h;->startActivityForResult(Landroid/content/Intent;I)V

    .line 403
    .line 404
    .line 405
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 406
    .line 407
    .line 408
    move-result-object p1

    .line 409
    const v0, 0x7f14014c

    .line 410
    .line 411
    .line 412
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object p1

    .line 416
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 417
    .line 418
    .line 419
    move-result-object p0

    .line 420
    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 421
    .line 422
    .line 423
    move-result-object p0

    .line 424
    invoke-static {p1, p0}, Lh1/a;->M(Ljava/lang/String;Ljava/lang/String;)V

    .line 425
    .line 426
    .line 427
    goto :goto_0

    .line 428
    :cond_7
    const v0, 0x7f1403ae

    .line 429
    .line 430
    .line 431
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 432
    .line 433
    .line 434
    move-result-object v0

    .line 435
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 436
    .line 437
    .line 438
    move-result v0

    .line 439
    if-eqz v0, :cond_8

    .line 440
    .line 441
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 442
    .line 443
    .line 444
    move-result-object p0

    .line 445
    new-instance v0, Landroid/content/Intent;

    .line 446
    .line 447
    invoke-virtual {p1}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 448
    .line 449
    .line 450
    move-result-object p1

    .line 451
    const-class v1, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;

    .line 452
    .line 453
    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 454
    .line 455
    .line 456
    invoke-virtual {p0, v0, v6}, Landroidx/activity/h;->startActivityForResult(Landroid/content/Intent;I)V

    .line 457
    .line 458
    .line 459
    :cond_8
    :goto_0
    const/4 p0, 0x1

    .line 460
    return p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 10

    .line 1
    invoke-super {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const v0, 0x7f1403aa

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroidx/preference/PreferenceCategory;

    .line 20
    .line 21
    const v0, 0x7f1403a9

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {p0, v1}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Landroidx/preference/PreferenceCategory;

    .line 33
    .line 34
    const v1, 0x7f1403a0

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {p0, v1}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Landroidx/preference/SwitchPreference;

    .line 46
    .line 47
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-static {v2}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->M0()Z

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2, v1}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 63
    .line 64
    .line 65
    const v1, 0x7f1403bc

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, v1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {p0, v1}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 77
    .line 78
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->p()Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    const/4 v3, 0x0

    .line 87
    if-eqz v2, :cond_0

    .line 88
    .line 89
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v2, v1}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_0
    const v2, 0x7f1403cd

    .line 98
    .line 99
    .line 100
    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->L0(I)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v1, p0}, Landroidx/preference/Preference;->F0(Landroidx/preference/Preference$e;)V

    .line 104
    .line 105
    .line 106
    if-nez p1, :cond_1

    .line 107
    .line 108
    invoke-virtual {v1, v3}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->v0(Z)V

    .line 109
    .line 110
    .line 111
    :cond_1
    :goto_0
    const v1, 0x7f1403b0

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0, v1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {p0, v1}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    check-cast v1, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 123
    .line 124
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->p()Z

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    if-nez v2, :cond_4

    .line 133
    .line 134
    invoke-static {}, Lx1/O;->k1()Z

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    if-eqz v2, :cond_2

    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_2
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    iget-boolean v2, v2, Lcom/android/launcher3/r4;->F:Z

    .line 154
    .line 155
    if-eqz v2, :cond_3

    .line 156
    .line 157
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->s()Z

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    if-nez v2, :cond_3

    .line 166
    .line 167
    invoke-virtual {v1, p0}, Landroidx/preference/Preference;->F0(Landroidx/preference/Preference$e;)V

    .line 168
    .line 169
    .line 170
    if-nez p1, :cond_5

    .line 171
    .line 172
    invoke-virtual {v1, v3}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->v0(Z)V

    .line 173
    .line 174
    .line 175
    goto :goto_2

    .line 176
    :cond_3
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    invoke-virtual {v2, v1}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 181
    .line 182
    .line 183
    goto :goto_2

    .line 184
    :cond_4
    :goto_1
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    invoke-virtual {v2, v1}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 189
    .line 190
    .line 191
    :cond_5
    :goto_2
    const v1, 0x7f1403b2

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0, v1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    invoke-virtual {p0, v1}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    check-cast v1, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 203
    .line 204
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 209
    .line 210
    .line 211
    move-result-object v2

    .line 212
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 213
    .line 214
    .line 215
    move-result-object v2

    .line 216
    iget-boolean v2, v2, Lcom/android/launcher3/r4;->f:Z

    .line 217
    .line 218
    if-eqz v2, :cond_a

    .line 219
    .line 220
    invoke-static {}, Lx1/O;->k1()Z

    .line 221
    .line 222
    .line 223
    move-result v2

    .line 224
    if-nez v2, :cond_a

    .line 225
    .line 226
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 227
    .line 228
    .line 229
    move-result-object v2

    .line 230
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 235
    .line 236
    .line 237
    move-result-object v2

    .line 238
    iget-boolean v2, v2, Lcom/android/launcher3/r4;->i0:Z

    .line 239
    .line 240
    if-nez v2, :cond_a

    .line 241
    .line 242
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    iget-boolean v2, v2, Lcom/android/launcher3/r4;->j0:Z

    .line 255
    .line 256
    if-nez v2, :cond_a

    .line 257
    .line 258
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 263
    .line 264
    .line 265
    move-result-object v4

    .line 266
    invoke-virtual {v4}, Lcom/android/launcher3/resource/B;->s()Z

    .line 267
    .line 268
    .line 269
    move-result v4

    .line 270
    if-eqz v4, :cond_6

    .line 271
    .line 272
    const v4, 0x7f140387

    .line 273
    .line 274
    .line 275
    goto :goto_3

    .line 276
    :cond_6
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 277
    .line 278
    .line 279
    move-result-object v4

    .line 280
    invoke-virtual {v4}, Lcom/android/launcher3/resource/B;->p()Z

    .line 281
    .line 282
    .line 283
    move-result v4

    .line 284
    if-eqz v4, :cond_7

    .line 285
    .line 286
    const v4, 0x7f140383

    .line 287
    .line 288
    .line 289
    goto :goto_3

    .line 290
    :cond_7
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 291
    .line 292
    .line 293
    move-result-object v4

    .line 294
    invoke-static {v4}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 295
    .line 296
    .line 297
    move-result-object v4

    .line 298
    invoke-virtual {v4}, Lcom/android/launcher3/H5;->M0()Z

    .line 299
    .line 300
    .line 301
    move-result v4

    .line 302
    if-eqz v4, :cond_8

    .line 303
    .line 304
    const v4, 0x7f14038c

    .line 305
    .line 306
    .line 307
    goto :goto_3

    .line 308
    :cond_8
    const v4, 0x7f140385

    .line 309
    .line 310
    .line 311
    :goto_3
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v2

    .line 315
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 316
    .line 317
    .line 318
    move-result-object v4

    .line 319
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 320
    .line 321
    .line 322
    move-result-object v4

    .line 323
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 324
    .line 325
    .line 326
    move-result-object v4

    .line 327
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->Z:Z

    .line 328
    .line 329
    if-eqz v4, :cond_9

    .line 330
    .line 331
    invoke-virtual {v1, v2}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a1(Ljava/lang/CharSequence;)V

    .line 332
    .line 333
    .line 334
    goto :goto_4

    .line 335
    :cond_9
    invoke-virtual {v1, v2}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->J0(Ljava/lang/CharSequence;)V

    .line 336
    .line 337
    .line 338
    :goto_4
    invoke-virtual {v1, p0}, Landroidx/preference/Preference;->F0(Landroidx/preference/Preference$e;)V

    .line 339
    .line 340
    .line 341
    if-nez p1, :cond_b

    .line 342
    .line 343
    invoke-virtual {v1, v3}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->v0(Z)V

    .line 344
    .line 345
    .line 346
    goto :goto_5

    .line 347
    :cond_a
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 348
    .line 349
    .line 350
    move-result-object v2

    .line 351
    invoke-virtual {v2, v1}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 352
    .line 353
    .line 354
    :cond_b
    :goto_5
    const v1, 0x7f1403bb

    .line 355
    .line 356
    .line 357
    invoke-virtual {p0, v1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object v2

    .line 361
    invoke-virtual {p0, v2}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 362
    .line 363
    .line 364
    move-result-object v2

    .line 365
    check-cast v2, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 366
    .line 367
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 368
    .line 369
    .line 370
    move-result-object v4

    .line 371
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 372
    .line 373
    .line 374
    move-result-object v4

    .line 375
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 376
    .line 377
    .line 378
    move-result-object v4

    .line 379
    invoke-virtual {v4}, Lcom/android/launcher3/H5;->y0()Z

    .line 380
    .line 381
    .line 382
    move-result v4

    .line 383
    if-eqz v4, :cond_c

    .line 384
    .line 385
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 386
    .line 387
    .line 388
    move-result-object v4

    .line 389
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 390
    .line 391
    .line 392
    move-result-object v4

    .line 393
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 394
    .line 395
    .line 396
    move-result-object v4

    .line 397
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->e0:Z

    .line 398
    .line 399
    if-eqz v4, :cond_d

    .line 400
    .line 401
    :cond_c
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->e()Z

    .line 402
    .line 403
    .line 404
    move-result v4

    .line 405
    if-nez v4, :cond_e

    .line 406
    .line 407
    :cond_d
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 408
    .line 409
    .line 410
    move-result-object v4

    .line 411
    invoke-virtual {v4, v2}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 412
    .line 413
    .line 414
    goto :goto_7

    .line 415
    :cond_e
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 416
    .line 417
    .line 418
    move-result-object v4

    .line 419
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 420
    .line 421
    .line 422
    move-result-object v4

    .line 423
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 424
    .line 425
    .line 426
    move-result-object v4

    .line 427
    iget v4, v4, Lcom/android/launcher3/r4;->q:I

    .line 428
    .line 429
    if-nez v4, :cond_10

    .line 430
    .line 431
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 432
    .line 433
    .line 434
    move-result-object v4

    .line 435
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 436
    .line 437
    .line 438
    move-result-object v4

    .line 439
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 440
    .line 441
    .line 442
    move-result-object v4

    .line 443
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->Z:Z

    .line 444
    .line 445
    const v5, 0x7f1403df

    .line 446
    .line 447
    .line 448
    if-eqz v4, :cond_f

    .line 449
    .line 450
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 451
    .line 452
    .line 453
    move-result-object v4

    .line 454
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 455
    .line 456
    .line 457
    move-result-object v4

    .line 458
    invoke-virtual {v2, v4}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a1(Ljava/lang/CharSequence;)V

    .line 459
    .line 460
    .line 461
    goto :goto_6

    .line 462
    :cond_f
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 463
    .line 464
    .line 465
    move-result-object v4

    .line 466
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 467
    .line 468
    .line 469
    move-result-object v4

    .line 470
    invoke-virtual {v2, v4}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->J0(Ljava/lang/CharSequence;)V

    .line 471
    .line 472
    .line 473
    goto :goto_6

    .line 474
    :cond_10
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 475
    .line 476
    .line 477
    move-result-object v4

    .line 478
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 479
    .line 480
    .line 481
    move-result-object v4

    .line 482
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 483
    .line 484
    .line 485
    move-result-object v4

    .line 486
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->Z:Z

    .line 487
    .line 488
    const v5, 0x7f1403e0

    .line 489
    .line 490
    .line 491
    if-eqz v4, :cond_11

    .line 492
    .line 493
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 494
    .line 495
    .line 496
    move-result-object v4

    .line 497
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 498
    .line 499
    .line 500
    move-result-object v4

    .line 501
    invoke-virtual {v2, v4}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a1(Ljava/lang/CharSequence;)V

    .line 502
    .line 503
    .line 504
    goto :goto_6

    .line 505
    :cond_11
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 506
    .line 507
    .line 508
    move-result-object v4

    .line 509
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 510
    .line 511
    .line 512
    move-result-object v4

    .line 513
    invoke-virtual {v2, v4}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->J0(Ljava/lang/CharSequence;)V

    .line 514
    .line 515
    .line 516
    :goto_6
    invoke-virtual {v2, p0}, Landroidx/preference/Preference;->F0(Landroidx/preference/Preference$e;)V

    .line 517
    .line 518
    .line 519
    :goto_7
    const v2, 0x7f1403b4

    .line 520
    .line 521
    .line 522
    invoke-virtual {p0, v2}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 523
    .line 524
    .line 525
    move-result-object v2

    .line 526
    invoke-virtual {p0, v2}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 527
    .line 528
    .line 529
    move-result-object v2

    .line 530
    check-cast v2, Landroidx/preference/SwitchPreference;

    .line 531
    .line 532
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 533
    .line 534
    .line 535
    move-result-object v4

    .line 536
    invoke-virtual {v4}, Lcom/android/launcher3/resource/B;->p()Z

    .line 537
    .line 538
    .line 539
    move-result v4

    .line 540
    if-eqz v4, :cond_12

    .line 541
    .line 542
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 543
    .line 544
    .line 545
    move-result-object v4

    .line 546
    invoke-virtual {v4, v2}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 547
    .line 548
    .line 549
    goto :goto_8

    .line 550
    :cond_12
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 551
    .line 552
    .line 553
    move-result-object v4

    .line 554
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 555
    .line 556
    .line 557
    move-result-object v4

    .line 558
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 559
    .line 560
    .line 561
    move-result-object v4

    .line 562
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->h:Z

    .line 563
    .line 564
    invoke-virtual {v2, v4}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 565
    .line 566
    .line 567
    invoke-virtual {v2, p0}, Landroidx/preference/Preference;->E0(Landroidx/preference/Preference$d;)V

    .line 568
    .line 569
    .line 570
    :goto_8
    const v2, 0x7f1403a2

    .line 571
    .line 572
    .line 573
    invoke-virtual {p0, v2}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 574
    .line 575
    .line 576
    move-result-object v2

    .line 577
    invoke-virtual {p0, v2}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 578
    .line 579
    .line 580
    move-result-object v2

    .line 581
    check-cast v2, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 582
    .line 583
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 584
    .line 585
    .line 586
    move-result-object v4

    .line 587
    invoke-virtual {v4}, Lcom/android/launcher3/resource/B;->p()Z

    .line 588
    .line 589
    .line 590
    move-result v4

    .line 591
    const-string v5, "com.zte.beautify"

    .line 592
    .line 593
    if-nez v4, :cond_15

    .line 594
    .line 595
    invoke-static {}, Lx1/c0;->d()Z

    .line 596
    .line 597
    .line 598
    move-result v4

    .line 599
    if-eqz v4, :cond_13

    .line 600
    .line 601
    goto :goto_9

    .line 602
    :cond_13
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 603
    .line 604
    .line 605
    move-result-object v4

    .line 606
    invoke-static {v4, v5}, Lx1/O;->h1(Landroid/content/Context;Ljava/lang/String;)Z

    .line 607
    .line 608
    .line 609
    move-result v4

    .line 610
    if-eqz v4, :cond_14

    .line 611
    .line 612
    invoke-virtual {v2, p0}, Landroidx/preference/Preference;->F0(Landroidx/preference/Preference$e;)V

    .line 613
    .line 614
    .line 615
    goto :goto_a

    .line 616
    :cond_14
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 617
    .line 618
    .line 619
    move-result-object v4

    .line 620
    invoke-virtual {v4, v2}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 621
    .line 622
    .line 623
    goto :goto_a

    .line 624
    :cond_15
    :goto_9
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 625
    .line 626
    .line 627
    move-result-object v4

    .line 628
    invoke-virtual {v4, v2}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 629
    .line 630
    .line 631
    :goto_a
    const v2, 0x7f1403b1

    .line 632
    .line 633
    .line 634
    invoke-virtual {p0, v2}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 635
    .line 636
    .line 637
    move-result-object v2

    .line 638
    invoke-virtual {p0, v2}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 639
    .line 640
    .line 641
    move-result-object v2

    .line 642
    check-cast v2, Landroidx/preference/SwitchPreference;

    .line 643
    .line 644
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 645
    .line 646
    .line 647
    move-result-object v4

    .line 648
    invoke-virtual {v4}, Lcom/android/launcher3/resource/B;->p()Z

    .line 649
    .line 650
    .line 651
    move-result v4

    .line 652
    if-eqz v4, :cond_16

    .line 653
    .line 654
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 655
    .line 656
    .line 657
    move-result-object v4

    .line 658
    invoke-virtual {v4, v2}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 659
    .line 660
    .line 661
    goto :goto_b

    .line 662
    :cond_16
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 663
    .line 664
    .line 665
    move-result-object v4

    .line 666
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 667
    .line 668
    .line 669
    move-result-object v4

    .line 670
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 671
    .line 672
    .line 673
    move-result-object v4

    .line 674
    invoke-virtual {v4}, Lcom/android/launcher3/H5;->y0()Z

    .line 675
    .line 676
    .line 677
    move-result v4

    .line 678
    if-eqz v4, :cond_17

    .line 679
    .line 680
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 681
    .line 682
    .line 683
    move-result-object v4

    .line 684
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 685
    .line 686
    .line 687
    move-result-object v4

    .line 688
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 689
    .line 690
    .line 691
    move-result-object v4

    .line 692
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->e0:Z

    .line 693
    .line 694
    if-eqz v4, :cond_18

    .line 695
    .line 696
    :cond_17
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 697
    .line 698
    .line 699
    move-result-object v4

    .line 700
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 701
    .line 702
    .line 703
    move-result-object v4

    .line 704
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 705
    .line 706
    .line 707
    move-result-object v4

    .line 708
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->i:Z

    .line 709
    .line 710
    if-nez v4, :cond_18

    .line 711
    .line 712
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 713
    .line 714
    .line 715
    move-result-object v4

    .line 716
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 717
    .line 718
    .line 719
    move-result-object v4

    .line 720
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 721
    .line 722
    .line 723
    move-result-object v4

    .line 724
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->j:Z

    .line 725
    .line 726
    invoke-virtual {v2, v4}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 727
    .line 728
    .line 729
    invoke-virtual {v2, p0}, Landroidx/preference/Preference;->E0(Landroidx/preference/Preference$d;)V

    .line 730
    .line 731
    .line 732
    goto :goto_b

    .line 733
    :cond_18
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 734
    .line 735
    .line 736
    move-result-object v4

    .line 737
    invoke-virtual {v4, v2}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 738
    .line 739
    .line 740
    :goto_b
    const v2, 0x7f1403b3

    .line 741
    .line 742
    .line 743
    invoke-virtual {p0, v2}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 744
    .line 745
    .line 746
    move-result-object v2

    .line 747
    invoke-virtual {p0, v2}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 748
    .line 749
    .line 750
    move-result-object v2

    .line 751
    check-cast v2, Landroidx/preference/SwitchPreference;

    .line 752
    .line 753
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 754
    .line 755
    .line 756
    move-result-object v4

    .line 757
    invoke-virtual {v4}, Lcom/android/launcher3/resource/B;->p()Z

    .line 758
    .line 759
    .line 760
    move-result v4

    .line 761
    if-nez v4, :cond_1a

    .line 762
    .line 763
    invoke-static {}, Lx1/O;->k1()Z

    .line 764
    .line 765
    .line 766
    move-result v4

    .line 767
    if-eqz v4, :cond_19

    .line 768
    .line 769
    goto :goto_c

    .line 770
    :cond_19
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 771
    .line 772
    .line 773
    move-result-object v4

    .line 774
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 775
    .line 776
    .line 777
    move-result-object v4

    .line 778
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 779
    .line 780
    .line 781
    move-result-object v4

    .line 782
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->k:Z

    .line 783
    .line 784
    invoke-virtual {v2, v4}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 785
    .line 786
    .line 787
    invoke-virtual {v2, p0}, Landroidx/preference/Preference;->E0(Landroidx/preference/Preference$d;)V

    .line 788
    .line 789
    .line 790
    goto :goto_d

    .line 791
    :cond_1a
    :goto_c
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 792
    .line 793
    .line 794
    move-result-object v4

    .line 795
    invoke-virtual {v4, v2}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 796
    .line 797
    .line 798
    :goto_d
    const v2, 0x7f1403a6

    .line 799
    .line 800
    .line 801
    invoke-virtual {p0, v2}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 802
    .line 803
    .line 804
    move-result-object v2

    .line 805
    invoke-virtual {p0, v2}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 806
    .line 807
    .line 808
    move-result-object v2

    .line 809
    check-cast v2, Landroidx/preference/SwitchPreference;

    .line 810
    .line 811
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 812
    .line 813
    .line 814
    move-result-object v4

    .line 815
    invoke-virtual {v4}, Lcom/android/launcher3/resource/B;->p()Z

    .line 816
    .line 817
    .line 818
    move-result v4

    .line 819
    if-eqz v4, :cond_1b

    .line 820
    .line 821
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 822
    .line 823
    .line 824
    move-result-object v4

    .line 825
    invoke-virtual {v4, v2}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 826
    .line 827
    .line 828
    goto :goto_e

    .line 829
    :cond_1b
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 830
    .line 831
    .line 832
    move-result-object v4

    .line 833
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 834
    .line 835
    .line 836
    move-result-object v4

    .line 837
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 838
    .line 839
    .line 840
    move-result-object v4

    .line 841
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->p:Z

    .line 842
    .line 843
    invoke-virtual {v2, v4}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 844
    .line 845
    .line 846
    invoke-virtual {v2, p0}, Landroidx/preference/Preference;->E0(Landroidx/preference/Preference$d;)V

    .line 847
    .line 848
    .line 849
    :goto_e
    const v2, 0x7f1403ac

    .line 850
    .line 851
    .line 852
    invoke-virtual {p0, v2}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 853
    .line 854
    .line 855
    move-result-object v2

    .line 856
    invoke-virtual {p0, v2}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 857
    .line 858
    .line 859
    move-result-object v2

    .line 860
    check-cast v2, Landroidx/preference/SwitchPreference;

    .line 861
    .line 862
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 863
    .line 864
    .line 865
    move-result-object v4

    .line 866
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 867
    .line 868
    .line 869
    move-result-object v4

    .line 870
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 871
    .line 872
    .line 873
    move-result-object v4

    .line 874
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->z:Z

    .line 875
    .line 876
    const/4 v6, 0x1

    .line 877
    if-eqz v4, :cond_1e

    .line 878
    .line 879
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 880
    .line 881
    .line 882
    move-result-object v4

    .line 883
    invoke-virtual {v4}, Lcom/android/launcher3/resource/B;->p()Z

    .line 884
    .line 885
    .line 886
    move-result v4

    .line 887
    if-nez v4, :cond_1e

    .line 888
    .line 889
    invoke-static {}, Lx1/O;->k1()Z

    .line 890
    .line 891
    .line 892
    move-result v4

    .line 893
    if-eqz v4, :cond_1c

    .line 894
    .line 895
    goto :goto_f

    .line 896
    :cond_1c
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 897
    .line 898
    .line 899
    move-result-object v4

    .line 900
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 901
    .line 902
    .line 903
    move-result-object v4

    .line 904
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 905
    .line 906
    .line 907
    move-result-object v4

    .line 908
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->t:Z

    .line 909
    .line 910
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 911
    .line 912
    .line 913
    move-result-object v7

    .line 914
    invoke-static {v7}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 915
    .line 916
    .line 917
    move-result-object v7

    .line 918
    invoke-virtual {v7}, Lcom/android/launcher3/H5;->K0()Z

    .line 919
    .line 920
    .line 921
    move-result v7

    .line 922
    if-eqz v7, :cond_1d

    .line 923
    .line 924
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 925
    .line 926
    .line 927
    move-result-object v4

    .line 928
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 929
    .line 930
    .line 931
    move-result-object v4

    .line 932
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 933
    .line 934
    .line 935
    move-result-object v4

    .line 936
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 937
    .line 938
    .line 939
    move-result-object v7

    .line 940
    invoke-virtual {v4, v7}, Lcom/android/launcher3/r4;->B(Landroid/content/Context;)Z

    .line 941
    .line 942
    .line 943
    move-result v4

    .line 944
    :cond_1d
    invoke-virtual {v2, v4}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 945
    .line 946
    .line 947
    invoke-virtual {v2, p0}, Landroidx/preference/Preference;->E0(Landroidx/preference/Preference$d;)V

    .line 948
    .line 949
    .line 950
    iput-boolean v6, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->t:Z

    .line 951
    .line 952
    goto :goto_10

    .line 953
    :cond_1e
    :goto_f
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 954
    .line 955
    .line 956
    move-result-object v4

    .line 957
    invoke-virtual {v4, v2}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 958
    .line 959
    .line 960
    iput-boolean v3, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->t:Z

    .line 961
    .line 962
    :goto_10
    const v2, 0x7f1403bd

    .line 963
    .line 964
    .line 965
    invoke-virtual {p0, v2}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 966
    .line 967
    .line 968
    move-result-object v4

    .line 969
    invoke-virtual {p0, v4}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 970
    .line 971
    .line 972
    move-result-object v4

    .line 973
    check-cast v4, Landroidx/preference/SwitchPreference;

    .line 974
    .line 975
    invoke-static {}, Lx1/O;->L3()Z

    .line 976
    .line 977
    .line 978
    move-result v7

    .line 979
    if-eqz v7, :cond_1f

    .line 980
    .line 981
    invoke-static {}, Lx1/O;->k1()Z

    .line 982
    .line 983
    .line 984
    move-result v7

    .line 985
    if-nez v7, :cond_1f

    .line 986
    .line 987
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 988
    .line 989
    .line 990
    move-result-object v7

    .line 991
    invoke-static {v7}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 992
    .line 993
    .line 994
    move-result-object v7

    .line 995
    invoke-virtual {v7}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 996
    .line 997
    .line 998
    move-result-object v7

    .line 999
    iget-boolean v7, v7, Lcom/android/launcher3/r4;->u:Z

    .line 1000
    .line 1001
    invoke-virtual {v4, v7}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 1002
    .line 1003
    .line 1004
    invoke-virtual {v4, p0}, Landroidx/preference/Preference;->E0(Landroidx/preference/Preference$d;)V

    .line 1005
    .line 1006
    .line 1007
    goto :goto_11

    .line 1008
    :cond_1f
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 1009
    .line 1010
    .line 1011
    move-result-object v7

    .line 1012
    invoke-virtual {v7, v4}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 1013
    .line 1014
    .line 1015
    :goto_11
    const v4, 0x7f1403ad

    .line 1016
    .line 1017
    .line 1018
    invoke-virtual {p0, v4}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1019
    .line 1020
    .line 1021
    move-result-object v7

    .line 1022
    invoke-virtual {p0, v7}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 1023
    .line 1024
    .line 1025
    move-result-object v7

    .line 1026
    check-cast v7, Landroidx/preference/SwitchPreference;

    .line 1027
    .line 1028
    if-eqz v7, :cond_20

    .line 1029
    .line 1030
    invoke-static {}, Lx1/S;->r()Z

    .line 1031
    .line 1032
    .line 1033
    :cond_20
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1034
    .line 1035
    .line 1036
    move-result-object v8

    .line 1037
    invoke-static {v8}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 1038
    .line 1039
    .line 1040
    move-result-object v8

    .line 1041
    invoke-virtual {v8}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 1042
    .line 1043
    .line 1044
    move-result-object v8

    .line 1045
    iget-boolean v8, v8, Lcom/android/launcher3/r4;->w:Z

    .line 1046
    .line 1047
    if-eqz v8, :cond_29

    .line 1048
    .line 1049
    invoke-static {}, Lx1/O;->k1()Z

    .line 1050
    .line 1051
    .line 1052
    move-result v8

    .line 1053
    if-eqz v8, :cond_21

    .line 1054
    .line 1055
    goto/16 :goto_13

    .line 1056
    .line 1057
    :cond_21
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1058
    .line 1059
    .line 1060
    move-result-object v8

    .line 1061
    sget-object v9, Lcom/android/launcher3/r4;->A0:Ljava/lang/String;

    .line 1062
    .line 1063
    invoke-static {v8, v9}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 1064
    .line 1065
    .line 1066
    move-result v8

    .line 1067
    if-eqz v8, :cond_22

    .line 1068
    .line 1069
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1070
    .line 1071
    .line 1072
    move-result-object v8

    .line 1073
    invoke-static {v8}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 1074
    .line 1075
    .line 1076
    move-result-object v8

    .line 1077
    invoke-virtual {v8}, Lcom/android/launcher3/H5;->H0()Z

    .line 1078
    .line 1079
    .line 1080
    move-result v8

    .line 1081
    if-nez v8, :cond_23

    .line 1082
    .line 1083
    :cond_22
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1084
    .line 1085
    .line 1086
    move-result-object v8

    .line 1087
    invoke-static {v8}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 1088
    .line 1089
    .line 1090
    move-result-object v8

    .line 1091
    invoke-virtual {v8}, Lcom/android/launcher3/H5;->J0()Z

    .line 1092
    .line 1093
    .line 1094
    move-result v8

    .line 1095
    if-eqz v8, :cond_28

    .line 1096
    .line 1097
    :cond_23
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1098
    .line 1099
    .line 1100
    move-result-object v8

    .line 1101
    invoke-static {v8}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 1102
    .line 1103
    .line 1104
    move-result-object v8

    .line 1105
    invoke-virtual {v8}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 1106
    .line 1107
    .line 1108
    move-result-object v8

    .line 1109
    iget-object v8, v8, Lcom/android/launcher3/r4;->D:Ljava/lang/String;

    .line 1110
    .line 1111
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1112
    .line 1113
    .line 1114
    move-result-object v9

    .line 1115
    invoke-static {v9}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 1116
    .line 1117
    .line 1118
    move-result-object v9

    .line 1119
    invoke-virtual {v9}, Lcom/android/launcher3/H5;->J0()Z

    .line 1120
    .line 1121
    .line 1122
    move-result v9

    .line 1123
    if-eqz v9, :cond_24

    .line 1124
    .line 1125
    const v8, 0x7f14007a

    .line 1126
    .line 1127
    .line 1128
    invoke-virtual {p0, v8}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1129
    .line 1130
    .line 1131
    move-result-object v8

    .line 1132
    invoke-virtual {v7, v8}, Landroidx/preference/Preference;->M0(Ljava/lang/CharSequence;)V

    .line 1133
    .line 1134
    .line 1135
    const v8, 0x7f140377

    .line 1136
    .line 1137
    .line 1138
    invoke-virtual {p0, v8}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1139
    .line 1140
    .line 1141
    move-result-object v8

    .line 1142
    invoke-virtual {v7, v8}, Landroidx/preference/Preference;->J0(Ljava/lang/CharSequence;)V

    .line 1143
    .line 1144
    .line 1145
    goto :goto_12

    .line 1146
    :cond_24
    const-string v9, "rakuten"

    .line 1147
    .line 1148
    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1149
    .line 1150
    .line 1151
    move-result v9

    .line 1152
    if-eqz v9, :cond_25

    .line 1153
    .line 1154
    const v8, 0x7f14010b

    .line 1155
    .line 1156
    .line 1157
    invoke-virtual {v7, v8}, Landroidx/preference/Preference;->L0(I)V

    .line 1158
    .line 1159
    .line 1160
    goto :goto_12

    .line 1161
    :cond_25
    const-string v9, "vertu"

    .line 1162
    .line 1163
    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1164
    .line 1165
    .line 1166
    move-result v8

    .line 1167
    if-eqz v8, :cond_26

    .line 1168
    .line 1169
    const v8, 0x7f14010d

    .line 1170
    .line 1171
    .line 1172
    invoke-virtual {p0, v8}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1173
    .line 1174
    .line 1175
    move-result-object v8

    .line 1176
    invoke-virtual {v7, v8}, Landroidx/preference/Preference;->M0(Ljava/lang/CharSequence;)V

    .line 1177
    .line 1178
    .line 1179
    const v8, 0x7f140108

    .line 1180
    .line 1181
    .line 1182
    invoke-virtual {p0, v8}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1183
    .line 1184
    .line 1185
    move-result-object v8

    .line 1186
    invoke-virtual {v7, v8}, Landroidx/preference/Preference;->J0(Ljava/lang/CharSequence;)V

    .line 1187
    .line 1188
    .line 1189
    :cond_26
    :goto_12
    iput-boolean v6, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->u:Z

    .line 1190
    .line 1191
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1192
    .line 1193
    .line 1194
    move-result-object v8

    .line 1195
    invoke-static {v8}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 1196
    .line 1197
    .line 1198
    move-result-object v8

    .line 1199
    invoke-virtual {v8}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 1200
    .line 1201
    .line 1202
    move-result-object v8

    .line 1203
    iget-boolean v8, v8, Lcom/android/launcher3/r4;->s:Z

    .line 1204
    .line 1205
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1206
    .line 1207
    .line 1208
    move-result-object v9

    .line 1209
    invoke-static {v9}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 1210
    .line 1211
    .line 1212
    move-result-object v9

    .line 1213
    invoke-virtual {v9}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 1214
    .line 1215
    .line 1216
    move-result-object v9

    .line 1217
    invoke-virtual {v9}, Lcom/android/launcher3/r4;->w()Z

    .line 1218
    .line 1219
    .line 1220
    move-result v9

    .line 1221
    if-eqz v9, :cond_27

    .line 1222
    .line 1223
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1224
    .line 1225
    .line 1226
    move-result-object v8

    .line 1227
    invoke-static {v8}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 1228
    .line 1229
    .line 1230
    move-result-object v8

    .line 1231
    invoke-virtual {v8}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 1232
    .line 1233
    .line 1234
    move-result-object v8

    .line 1235
    invoke-virtual {v8, p1}, Lcom/android/launcher3/r4;->C(Landroid/content/Context;)Z

    .line 1236
    .line 1237
    .line 1238
    move-result v8

    .line 1239
    :cond_27
    invoke-virtual {v7, v8}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 1240
    .line 1241
    .line 1242
    invoke-virtual {v7, p0}, Landroidx/preference/Preference;->E0(Landroidx/preference/Preference$d;)V

    .line 1243
    .line 1244
    .line 1245
    goto :goto_14

    .line 1246
    :cond_28
    iput-boolean v3, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->u:Z

    .line 1247
    .line 1248
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 1249
    .line 1250
    .line 1251
    move-result-object p1

    .line 1252
    invoke-virtual {p1, v7}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 1253
    .line 1254
    .line 1255
    goto :goto_14

    .line 1256
    :cond_29
    :goto_13
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 1257
    .line 1258
    .line 1259
    move-result-object p1

    .line 1260
    invoke-virtual {p1, v7}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 1261
    .line 1262
    .line 1263
    iput-boolean v3, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->u:Z

    .line 1264
    .line 1265
    :goto_14
    const p1, 0x7f1403ae

    .line 1266
    .line 1267
    .line 1268
    invoke-virtual {p0, p1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1269
    .line 1270
    .line 1271
    move-result-object p1

    .line 1272
    invoke-virtual {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 1273
    .line 1274
    .line 1275
    move-result-object p1

    .line 1276
    check-cast p1, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 1277
    .line 1278
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 1279
    .line 1280
    .line 1281
    move-result-object v7

    .line 1282
    invoke-virtual {v7, p1}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 1283
    .line 1284
    .line 1285
    const-string p1, "pref_allowRotation"

    .line 1286
    .line 1287
    invoke-virtual {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 1288
    .line 1289
    .line 1290
    move-result-object v7

    .line 1291
    check-cast v7, Landroidx/preference/SwitchPreference;

    .line 1292
    .line 1293
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 1294
    .line 1295
    .line 1296
    move-result-object v8

    .line 1297
    invoke-virtual {v8}, Lcom/android/launcher3/resource/B;->p()Z

    .line 1298
    .line 1299
    .line 1300
    move-result v8

    .line 1301
    if-nez v8, :cond_2c

    .line 1302
    .line 1303
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1304
    .line 1305
    .line 1306
    move-result-object v8

    .line 1307
    invoke-static {v8}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 1308
    .line 1309
    .line 1310
    move-result-object v8

    .line 1311
    invoke-virtual {v8}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 1312
    .line 1313
    .line 1314
    move-result-object v8

    .line 1315
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1316
    .line 1317
    .line 1318
    move-result-object v9

    .line 1319
    invoke-virtual {v8, v9}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 1320
    .line 1321
    .line 1322
    move-result-object v8

    .line 1323
    if-nez v8, :cond_2a

    .line 1324
    .line 1325
    goto :goto_15

    .line 1326
    :cond_2a
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1327
    .line 1328
    .line 1329
    move-result-object v8

    .line 1330
    invoke-static {v8}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 1331
    .line 1332
    .line 1333
    move-result-object v8

    .line 1334
    invoke-virtual {v8}, Lcom/android/launcher3/H5;->P0()Z

    .line 1335
    .line 1336
    .line 1337
    move-result v8

    .line 1338
    if-nez v8, :cond_2b

    .line 1339
    .line 1340
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 1341
    .line 1342
    .line 1343
    move-result-object v8

    .line 1344
    invoke-virtual {v8, v7}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 1345
    .line 1346
    .line 1347
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1348
    .line 1349
    .line 1350
    move-result-object v7

    .line 1351
    invoke-static {v7}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 1352
    .line 1353
    .line 1354
    move-result-object v7

    .line 1355
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 1356
    .line 1357
    .line 1358
    move-result-object v7

    .line 1359
    invoke-interface {v7, p1, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1360
    .line 1361
    .line 1362
    goto :goto_16

    .line 1363
    :cond_2b
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1364
    .line 1365
    .line 1366
    move-result-object v3

    .line 1367
    invoke-static {v3}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 1368
    .line 1369
    .line 1370
    move-result-object v3

    .line 1371
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1372
    .line 1373
    .line 1374
    move-result-object v8

    .line 1375
    invoke-static {v8}, LQ1/d;->e(Landroid/content/Context;)Z

    .line 1376
    .line 1377
    .line 1378
    move-result v8

    .line 1379
    invoke-interface {v3, p1, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 1380
    .line 1381
    .line 1382
    move-result v3

    .line 1383
    invoke-virtual {v7, v3}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 1384
    .line 1385
    .line 1386
    invoke-virtual {v7, p0}, Landroidx/preference/Preference;->E0(Landroidx/preference/Preference$d;)V

    .line 1387
    .line 1388
    .line 1389
    goto :goto_16

    .line 1390
    :cond_2c
    :goto_15
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 1391
    .line 1392
    .line 1393
    move-result-object v8

    .line 1394
    invoke-virtual {v8, v7}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 1395
    .line 1396
    .line 1397
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1398
    .line 1399
    .line 1400
    move-result-object v7

    .line 1401
    invoke-static {v7}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 1402
    .line 1403
    .line 1404
    move-result-object v7

    .line 1405
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 1406
    .line 1407
    .line 1408
    move-result-object v7

    .line 1409
    invoke-interface {v7, p1, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1410
    .line 1411
    .line 1412
    :goto_16
    const v3, 0x7f1403b8

    .line 1413
    .line 1414
    .line 1415
    invoke-virtual {p0, v3}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1416
    .line 1417
    .line 1418
    move-result-object v3

    .line 1419
    invoke-virtual {p0, v3}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 1420
    .line 1421
    .line 1422
    move-result-object v3

    .line 1423
    check-cast v3, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 1424
    .line 1425
    const v7, 0x7f1403ba

    .line 1426
    .line 1427
    .line 1428
    invoke-virtual {p0, v7}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1429
    .line 1430
    .line 1431
    move-result-object v7

    .line 1432
    invoke-virtual {p0, v7}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 1433
    .line 1434
    .line 1435
    move-result-object v7

    .line 1436
    check-cast v7, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 1437
    .line 1438
    const v8, 0x7f1403b9

    .line 1439
    .line 1440
    .line 1441
    invoke-virtual {p0, v8}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1442
    .line 1443
    .line 1444
    move-result-object v8

    .line 1445
    invoke-virtual {p0, v8}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 1446
    .line 1447
    .line 1448
    move-result-object v8

    .line 1449
    check-cast v8, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 1450
    .line 1451
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 1452
    .line 1453
    .line 1454
    move-result-object v9

    .line 1455
    invoke-virtual {v9}, Lcom/android/launcher3/resource/B;->p()Z

    .line 1456
    .line 1457
    .line 1458
    move-result v9

    .line 1459
    if-eqz v9, :cond_2d

    .line 1460
    .line 1461
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 1462
    .line 1463
    .line 1464
    move-result-object v5

    .line 1465
    invoke-virtual {v5, v3}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 1466
    .line 1467
    .line 1468
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 1469
    .line 1470
    .line 1471
    move-result-object v3

    .line 1472
    invoke-virtual {v3, v7}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 1473
    .line 1474
    .line 1475
    invoke-virtual {v8, p0}, Landroidx/preference/Preference;->F0(Landroidx/preference/Preference$e;)V

    .line 1476
    .line 1477
    .line 1478
    goto :goto_18

    .line 1479
    :cond_2d
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1480
    .line 1481
    .line 1482
    move-result-object v9

    .line 1483
    invoke-static {v9}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 1484
    .line 1485
    .line 1486
    move-result-object v9

    .line 1487
    invoke-virtual {v9}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 1488
    .line 1489
    .line 1490
    move-result-object v9

    .line 1491
    iget-boolean v9, v9, Lcom/android/launcher3/r4;->J:Z

    .line 1492
    .line 1493
    if-nez v9, :cond_2f

    .line 1494
    .line 1495
    invoke-static {}, Lx1/O;->V0()Z

    .line 1496
    .line 1497
    .line 1498
    move-result v9

    .line 1499
    if-nez v9, :cond_2f

    .line 1500
    .line 1501
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1502
    .line 1503
    .line 1504
    move-result-object v9

    .line 1505
    invoke-static {v9, v5}, Lx1/O;->h1(Landroid/content/Context;Ljava/lang/String;)Z

    .line 1506
    .line 1507
    .line 1508
    move-result v5

    .line 1509
    if-nez v5, :cond_2e

    .line 1510
    .line 1511
    goto :goto_17

    .line 1512
    :cond_2e
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 1513
    .line 1514
    .line 1515
    move-result-object v5

    .line 1516
    invoke-virtual {v5, v7}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 1517
    .line 1518
    .line 1519
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 1520
    .line 1521
    .line 1522
    move-result-object v5

    .line 1523
    invoke-virtual {v5, v8}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 1524
    .line 1525
    .line 1526
    invoke-virtual {v3, p0}, Landroidx/preference/Preference;->F0(Landroidx/preference/Preference$e;)V

    .line 1527
    .line 1528
    .line 1529
    goto :goto_18

    .line 1530
    :cond_2f
    :goto_17
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 1531
    .line 1532
    .line 1533
    move-result-object v5

    .line 1534
    invoke-virtual {v5, v3}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 1535
    .line 1536
    .line 1537
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 1538
    .line 1539
    .line 1540
    move-result-object v3

    .line 1541
    invoke-virtual {v3, v8}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 1542
    .line 1543
    .line 1544
    invoke-virtual {v7, p0}, Landroidx/preference/Preference;->F0(Landroidx/preference/Preference$e;)V

    .line 1545
    .line 1546
    .line 1547
    :goto_18
    const v3, 0x7f1403b7

    .line 1548
    .line 1549
    .line 1550
    invoke-virtual {p0, v3}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1551
    .line 1552
    .line 1553
    move-result-object v5

    .line 1554
    invoke-virtual {p0, v5}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 1555
    .line 1556
    .line 1557
    move-result-object v5

    .line 1558
    check-cast v5, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 1559
    .line 1560
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1561
    .line 1562
    .line 1563
    move-result-object v7

    .line 1564
    invoke-static {v7}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 1565
    .line 1566
    .line 1567
    move-result-object v7

    .line 1568
    invoke-virtual {v7}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 1569
    .line 1570
    .line 1571
    move-result-object v7

    .line 1572
    iget-boolean v7, v7, Lcom/android/launcher3/r4;->n0:Z

    .line 1573
    .line 1574
    if-eqz v7, :cond_31

    .line 1575
    .line 1576
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1577
    .line 1578
    .line 1579
    move-result-object v7

    .line 1580
    invoke-static {v7}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 1581
    .line 1582
    .line 1583
    move-result-object v7

    .line 1584
    invoke-virtual {v7}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 1585
    .line 1586
    .line 1587
    move-result-object v7

    .line 1588
    iget v7, v7, Lcom/android/launcher3/r4;->o0:I

    .line 1589
    .line 1590
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1591
    .line 1592
    .line 1593
    move-result-object v8

    .line 1594
    invoke-static {v8}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 1595
    .line 1596
    .line 1597
    move-result-object v8

    .line 1598
    invoke-virtual {p0, v3}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1599
    .line 1600
    .line 1601
    move-result-object v9

    .line 1602
    invoke-interface {v8, v9, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 1603
    .line 1604
    .line 1605
    move-result v7

    .line 1606
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 1607
    .line 1608
    .line 1609
    move-result-object v8

    .line 1610
    if-ne v7, v6, :ls_stack_summary_non_normal_2

    .line 1611
    .line 1612
    const v7, 0x7f1403c2

    .line 1613
    .line 1614
    .line 1615
    goto :goto_19

    :ls_stack_summary_non_normal_2
    const/4 v6, 0x3

    if-ne v7, v6, :cond_30

    const v7, 0x7f1404b7

    const/4 v6, 0x1

    goto :goto_19

    .line 1616
    :cond_30
    const/4 v6, 0x1

    const v7, 0x7f1403c1

    .line 1617
    .line 1618
    .line 1619
    :goto_19
    invoke-virtual {v8, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 1620
    .line 1621
    .line 1622
    move-result-object v7

    .line 1623
    invoke-virtual {v5, v7}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a1(Ljava/lang/CharSequence;)V

    .line 1624
    .line 1625
    .line 1626
    invoke-virtual {v5, p0}, Landroidx/preference/Preference;->F0(Landroidx/preference/Preference$e;)V

    .line 1627
    .line 1628
    .line 1629
    goto :goto_1a

    .line 1630
    :cond_31
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 1631
    .line 1632
    .line 1633
    move-result-object v7

    .line 1634
    invoke-virtual {v7, v5}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 1635
    .line 1636
    .line 1637
    :goto_1a
    const v5, 0x7f1403af

    .line 1638
    .line 1639
    .line 1640
    invoke-virtual {p0, v5}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1641
    .line 1642
    .line 1643
    move-result-object v5

    .line 1644
    invoke-virtual {p0, v5}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 1645
    .line 1646
    .line 1647
    move-result-object v5

    .line 1648
    check-cast v5, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 1649
    .line 1650
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 1651
    .line 1652
    .line 1653
    move-result-object v7

    .line 1654
    invoke-virtual {v7}, Lcom/android/launcher3/resource/B;->p()Z

    .line 1655
    .line 1656
    .line 1657
    move-result v7

    .line 1658
    if-eqz v7, :cond_34

    .line 1659
    .line 1660
    if-eqz v5, :cond_34

    .line 1661
    .line 1662
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1663
    .line 1664
    .line 1665
    move-result-object v7

    .line 1666
    invoke-static {v7}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 1667
    .line 1668
    .line 1669
    move-result-object v7

    .line 1670
    invoke-virtual {v7}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 1671
    .line 1672
    .line 1673
    move-result-object v7

    .line 1674
    iget-boolean v7, v7, Lcom/android/launcher3/r4;->l:Z

    .line 1675
    .line 1676
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1677
    .line 1678
    .line 1679
    move-result-object v8

    .line 1680
    invoke-static {v8}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 1681
    .line 1682
    .line 1683
    move-result-object v8

    .line 1684
    invoke-virtual {v8}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 1685
    .line 1686
    .line 1687
    move-result-object v8

    .line 1688
    iget-object v8, v8, Lcom/android/launcher3/r4;->m:Ljava/lang/String;

    .line 1689
    .line 1690
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 1691
    .line 1692
    .line 1693
    move-result-object v9

    .line 1694
    if-eqz v7, :cond_33

    .line 1695
    .line 1696
    const-string v7, "pointer_clock_default"

    .line 1697
    .line 1698
    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1699
    .line 1700
    .line 1701
    move-result v7

    .line 1702
    if-eqz v7, :cond_32

    .line 1703
    .line 1704
    const v7, 0x7f140181

    .line 1705
    .line 1706
    .line 1707
    goto :goto_1b

    .line 1708
    :cond_32
    const v7, 0x7f14017f

    .line 1709
    .line 1710
    .line 1711
    goto :goto_1b

    .line 1712
    :cond_33
    const v7, 0x7f140180

    .line 1713
    .line 1714
    .line 1715
    :goto_1b
    invoke-virtual {v9, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 1716
    .line 1717
    .line 1718
    move-result-object v7

    .line 1719
    invoke-virtual {v5, v7}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a1(Ljava/lang/CharSequence;)V

    .line 1720
    .line 1721
    .line 1722
    invoke-virtual {v5, p0}, Landroidx/preference/Preference;->F0(Landroidx/preference/Preference$e;)V

    .line 1723
    .line 1724
    .line 1725
    goto :goto_1c

    .line 1726
    :cond_34
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 1727
    .line 1728
    .line 1729
    move-result-object v7

    .line 1730
    invoke-virtual {v7, v5}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 1731
    .line 1732
    .line 1733
    :goto_1c
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 1734
    .line 1735
    .line 1736
    move-result-object v5

    .line 1737
    invoke-virtual {v5}, Lcom/android/launcher3/resource/B;->p()Z

    .line 1738
    .line 1739
    .line 1740
    move-result v5

    .line 1741
    if-eqz v5, :cond_35

    .line 1742
    .line 1743
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1744
    .line 1745
    .line 1746
    move-result-object v0

    .line 1747
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 1748
    .line 1749
    .line 1750
    move-result-object v0

    .line 1751
    check-cast v0, Landroidx/preference/PreferenceCategory;

    .line 1752
    .line 1753
    const v5, 0x7f1403a8

    .line 1754
    .line 1755
    .line 1756
    invoke-virtual {p0, v5}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1757
    .line 1758
    .line 1759
    move-result-object v5

    .line 1760
    invoke-virtual {p0, v5}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 1761
    .line 1762
    .line 1763
    move-result-object v5

    .line 1764
    check-cast v5, Landroidx/preference/PreferenceCategory;

    .line 1765
    .line 1766
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 1767
    .line 1768
    .line 1769
    move-result-object v7

    .line 1770
    invoke-virtual {v7, v0}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 1771
    .line 1772
    .line 1773
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 1774
    .line 1775
    .line 1776
    move-result-object v0

    .line 1777
    invoke-virtual {v0, v5}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 1778
    .line 1779
    .line 1780
    :cond_35
    const v0, 0x7f1403a3

    .line 1781
    .line 1782
    .line 1783
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1784
    .line 1785
    .line 1786
    move-result-object v5

    .line 1787
    invoke-virtual {p0, v5}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 1788
    .line 1789
    .line 1790
    move-result-object v5

    .line 1791
    check-cast v5, Landroidx/preference/SwitchPreference;

    .line 1792
    .line 1793
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 1794
    .line 1795
    .line 1796
    move-result-object v7

    .line 1797
    invoke-virtual {v7}, Lcom/android/launcher3/resource/B;->x()Z

    .line 1798
    .line 1799
    .line 1800
    move-result v7

    .line 1801
    if-nez v7, :cond_37

    .line 1802
    .line 1803
    invoke-static {}, LR0/m;->a()LR0/m;

    .line 1804
    .line 1805
    .line 1806
    move-result-object v7

    .line 1807
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1808
    .line 1809
    .line 1810
    move-result-object v8

    .line 1811
    invoke-virtual {v7, v8}, LR0/m;->b(Landroid/content/Context;)I

    .line 1812
    .line 1813
    .line 1814
    move-result v7

    .line 1815
    const/4 v8, 0x2

    .line 1816
    if-ne v7, v8, :cond_36

    .line 1817
    .line 1818
    goto :goto_1d

    .line 1819
    :cond_36
    invoke-virtual {v5, p0}, Landroidx/preference/Preference;->E0(Landroidx/preference/Preference$d;)V

    .line 1820
    .line 1821
    .line 1822
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 1823
    .line 1824
    .line 1825
    move-result-object v7

    .line 1826
    invoke-static {v7}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 1827
    .line 1828
    .line 1829
    move-result-object v7

    .line 1830
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1831
    .line 1832
    .line 1833
    move-result-object v8

    .line 1834
    invoke-interface {v7, v8, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 1835
    .line 1836
    .line 1837
    move-result v6

    .line 1838
    invoke-virtual {v5, v6}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 1839
    .line 1840
    .line 1841
    goto :goto_1e

    .line 1842
    :cond_37
    :goto_1d
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 1843
    .line 1844
    .line 1845
    move-result-object v6

    .line 1846
    invoke-virtual {v6, v5}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 1847
    .line 1848
    .line 1849
    :goto_1e
    invoke-virtual {p0, v3}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1850
    .line 1851
    .line 1852
    move-result-object v3

    .line 1853
    invoke-virtual {p0, v3}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 1854
    .line 1855
    .line 1856
    move-result-object v3

    .line 1857
    if-nez v3, :cond_38

    .line 1858
    .line 1859
    invoke-virtual {p0, v1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1860
    .line 1861
    .line 1862
    move-result-object v1

    .line 1863
    invoke-virtual {p0, v1}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 1864
    .line 1865
    .line 1866
    move-result-object v1

    .line 1867
    if-nez v1, :cond_38

    .line 1868
    .line 1869
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1870
    .line 1871
    .line 1872
    move-result-object v0

    .line 1873
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 1874
    .line 1875
    .line 1876
    move-result-object v0

    .line 1877
    if-nez v0, :cond_38

    .line 1878
    .line 1879
    invoke-virtual {p0, v2}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1880
    .line 1881
    .line 1882
    move-result-object v0

    .line 1883
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 1884
    .line 1885
    .line 1886
    move-result-object v0

    .line 1887
    if-nez v0, :cond_38

    .line 1888
    .line 1889
    invoke-virtual {p0, v4}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1890
    .line 1891
    .line 1892
    move-result-object v0

    .line 1893
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 1894
    .line 1895
    .line 1896
    move-result-object v0

    .line 1897
    if-nez v0, :cond_38

    .line 1898
    .line 1899
    invoke-virtual {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 1900
    .line 1901
    .line 1902
    move-result-object p1

    .line 1903
    if-nez p1, :cond_38

    .line 1904
    .line 1905
    const p1, 0x7f1403ab

    .line 1906
    .line 1907
    .line 1908
    invoke-virtual {p0, p1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 1909
    .line 1910
    .line 1911
    move-result-object p1

    .line 1912
    invoke-virtual {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 1913
    .line 1914
    .line 1915
    move-result-object p1

    .line 1916
    check-cast p1, Landroidx/preference/PreferenceCategory;

    .line 1917
    .line 1918
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 1919
    .line 1920
    .line 1921
    move-result-object v0

    .line 1922
    invoke-virtual {v0, p1}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 1923
    .line 1924
    .line 1925
    :cond_38
    invoke-direct {p0}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->T()V

    .line 1926
    .line 1927
    .line 1928
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/n;->onPause()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->V()V

    .line 5
    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->w:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->f()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const v0, 0x7f1403a1

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Landroidx/preference/SwitchPreference;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroidx/preference/TwoStatePreference;->U0()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-static {p0, v0, v1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->l0(Landroid/content/Context;ZZ)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/n;->onResume()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/settings/SettingsActivityMFV$LauncherSettingsFragment;->U()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public v(Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 0

    .line 1
    const p1, 0x7f17000f

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->l(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
