.class public final Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;
.super Landroidx/preference/PreferenceGroup;
.source "DevOptionsUiHelper.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$a;,
        Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$b;,
        Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$c;
    }
.end annotation


# static fields
.field public static final e0:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->e0:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    const-string v0, "c"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1, p2}, Landroidx/preference/PreferenceGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 7
    .line 8
    .line 9
    const p1, 0x7f0e00bd

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->C0(I)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->H0(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic A1(Landroidx/preference/Preference;Landroid/net/Uri;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->J1(Landroidx/preference/Preference;Landroid/net/Uri;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic B1(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Landroid/content/SharedPreferences;Landroidx/preference/h;Landroidx/preference/Preference;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->Y1(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Landroid/content/SharedPreferences;Landroidx/preference/h;Landroidx/preference/Preference;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic C1(Landroid/content/SharedPreferences;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)I
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->c2(Landroid/content/SharedPreferences;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final synthetic D1(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Ljava/lang/String;Landroidx/preference/PreferenceGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->O1(Ljava/lang/String;Landroidx/preference/PreferenceGroup;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final E1()V
    .locals 11

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v1, "com.android.quickstep.action.GESTURE_SANDBOX"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/high16 v1, 0x10000000

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v2, "addFlags(...)"

    .line 27
    .line 28
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string v2, "Gesture Navigation Sandbox"

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    const/4 v4, 0x2

    .line 35
    invoke-static {p0, v2, v3, v4, v3}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->k2(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Landroidx/preference/PreferenceCategory;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    new-instance v5, Landroidx/preference/Preference;

    .line 40
    .line 41
    invoke-virtual {v2}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    invoke-direct {v5, v6}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 46
    .line 47
    .line 48
    const-string v6, "Launch Gesture Tutorial Steps menu"

    .line 49
    .line 50
    invoke-virtual {v5, v6}, Landroidx/preference/Preference;->M0(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    new-instance v6, Landroid/content/Intent;

    .line 54
    .line 55
    invoke-direct {v6, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 56
    .line 57
    .line 58
    const/4 v7, 0x1

    .line 59
    const-string v8, "use_tutorial_menu"

    .line 60
    .line 61
    invoke-virtual {v6, v8, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 62
    .line 63
    .line 64
    move-result-object v6

    .line 65
    invoke-virtual {v5, v6}, Landroidx/preference/Preference;->A0(Landroid/content/Intent;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2, v5}, Landroidx/preference/PreferenceGroup;->V0(Landroidx/preference/Preference;)Z

    .line 69
    .line 70
    .line 71
    new-instance v5, Landroidx/preference/Preference;

    .line 72
    .line 73
    invoke-virtual {v2}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    invoke-direct {v5, v6}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 78
    .line 79
    .line 80
    const-string v6, "Launch Full Gesture Tutorial"

    .line 81
    .line 82
    invoke-virtual {v5, v6}, Landroidx/preference/Preference;->M0(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    new-instance v6, Landroid/content/Intent;

    .line 86
    .line 87
    invoke-direct {v6, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 88
    .line 89
    .line 90
    const/4 v7, 0x0

    .line 91
    invoke-virtual {v6, v8, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 92
    .line 93
    .line 94
    move-result-object v6

    .line 95
    invoke-virtual {v5, v6}, Landroidx/preference/Preference;->A0(Landroid/content/Intent;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v2, v5}, Landroidx/preference/PreferenceGroup;->V0(Landroidx/preference/Preference;)Z

    .line 99
    .line 100
    .line 101
    new-instance v5, Landroidx/preference/Preference;

    .line 102
    .line 103
    invoke-virtual {v2}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 104
    .line 105
    .line 106
    move-result-object v6

    .line 107
    invoke-direct {v5, v6}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 108
    .line 109
    .line 110
    const-string v6, "Launch Back Tutorial"

    .line 111
    .line 112
    invoke-virtual {v5, v6}, Landroidx/preference/Preference;->M0(Ljava/lang/CharSequence;)V

    .line 113
    .line 114
    .line 115
    new-instance v6, Landroid/content/Intent;

    .line 116
    .line 117
    invoke-direct {v6, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v6, v8, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 121
    .line 122
    .line 123
    move-result-object v6

    .line 124
    const-string v9, "BACK_NAVIGATION"

    .line 125
    .line 126
    filled-new-array {v9}, [Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v9

    .line 130
    const-string v10, "tutorial_steps"

    .line 131
    .line 132
    invoke-virtual {v6, v10, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 133
    .line 134
    .line 135
    move-result-object v6

    .line 136
    invoke-virtual {v5, v6}, Landroidx/preference/Preference;->A0(Landroid/content/Intent;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v2, v5}, Landroidx/preference/PreferenceGroup;->V0(Landroidx/preference/Preference;)Z

    .line 140
    .line 141
    .line 142
    new-instance v5, Landroidx/preference/Preference;

    .line 143
    .line 144
    invoke-virtual {v2}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 145
    .line 146
    .line 147
    move-result-object v6

    .line 148
    invoke-direct {v5, v6}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 149
    .line 150
    .line 151
    const-string v6, "Launch Home Tutorial"

    .line 152
    .line 153
    invoke-virtual {v5, v6}, Landroidx/preference/Preference;->M0(Ljava/lang/CharSequence;)V

    .line 154
    .line 155
    .line 156
    new-instance v6, Landroid/content/Intent;

    .line 157
    .line 158
    invoke-direct {v6, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v6, v8, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 162
    .line 163
    .line 164
    move-result-object v6

    .line 165
    const-string v9, "HOME_NAVIGATION"

    .line 166
    .line 167
    filled-new-array {v9}, [Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v9

    .line 171
    invoke-virtual {v6, v10, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 172
    .line 173
    .line 174
    move-result-object v6

    .line 175
    invoke-virtual {v5, v6}, Landroidx/preference/Preference;->A0(Landroid/content/Intent;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v2, v5}, Landroidx/preference/PreferenceGroup;->V0(Landroidx/preference/Preference;)Z

    .line 179
    .line 180
    .line 181
    new-instance v5, Landroidx/preference/Preference;

    .line 182
    .line 183
    invoke-virtual {v2}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 184
    .line 185
    .line 186
    move-result-object v6

    .line 187
    invoke-direct {v5, v6}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 188
    .line 189
    .line 190
    const-string v6, "Launch Overview Tutorial"

    .line 191
    .line 192
    invoke-virtual {v5, v6}, Landroidx/preference/Preference;->M0(Ljava/lang/CharSequence;)V

    .line 193
    .line 194
    .line 195
    new-instance v6, Landroid/content/Intent;

    .line 196
    .line 197
    invoke-direct {v6, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v6, v8, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    const-string v6, "OVERVIEW_NAVIGATION"

    .line 205
    .line 206
    filled-new-array {v6}, [Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v6

    .line 210
    invoke-virtual {v0, v10, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-virtual {v5, v0}, Landroidx/preference/Preference;->A0(Landroid/content/Intent;)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v2, v5}, Landroidx/preference/PreferenceGroup;->V0(Landroidx/preference/Preference;)Z

    .line 218
    .line 219
    .line 220
    const-string v0, "Other activity targets"

    .line 221
    .line 222
    invoke-static {p0, v0, v3, v4, v3}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->k2(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Landroidx/preference/PreferenceCategory;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    new-instance v0, Landroidx/preference/Preference;

    .line 227
    .line 228
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 229
    .line 230
    .line 231
    move-result-object v2

    .line 232
    invoke-direct {v0, v2}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 233
    .line 234
    .line 235
    const-string v2, "Launch Secondary Display"

    .line 236
    .line 237
    invoke-virtual {v0, v2}, Landroidx/preference/Preference;->M0(Ljava/lang/CharSequence;)V

    .line 238
    .line 239
    .line 240
    new-instance v2, Landroid/content/Intent;

    .line 241
    .line 242
    invoke-virtual {v0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 243
    .line 244
    .line 245
    move-result-object v3

    .line 246
    const-class v4, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 247
    .line 248
    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {v2, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    invoke-virtual {v0, v1}, Landroidx/preference/Preference;->A0(Landroid/content/Intent;)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceGroup;->V0(Landroidx/preference/Preference;)Z

    .line 259
    .line 260
    .line 261
    return-void
.end method

.method private final F1()V
    .locals 5

    .line 1
    sget-object v0, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "getContext(...)"

    .line 8
    .line 9
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    const/4 v1, 0x2

    .line 21
    const-string v2, "Workspace grid layout"

    .line 22
    .line 23
    invoke-static {p0, v2, v0, v1, v0}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->k2(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Landroidx/preference/PreferenceCategory;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Landroidx/preference/Preference;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-direct {v1, v2}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    const-string v2, "Export"

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->M0(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    sget-object v2, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 42
    .line 43
    const-string v3, "MAIN_EXECUTOR"

    .line 44
    .line 45
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    new-instance v3, Ld2/a;

    .line 49
    .line 50
    invoke-direct {v3, v1}, Ld2/a;-><init>(Landroidx/preference/Preference;)V

    .line 51
    .line 52
    .line 53
    const-string v4, "android.intent.action.CREATE_DOCUMENT"

    .line 54
    .line 55
    invoke-direct {p0, v4, v2, v3}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->N1(Ljava/lang/String;Ljava/util/concurrent/Executor;Lu4/l;)Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->A0(Landroid/content/Intent;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceGroup;->V0(Landroidx/preference/Preference;)Z

    .line 63
    .line 64
    .line 65
    new-instance v1, Landroidx/preference/Preference;

    .line 66
    .line 67
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-direct {v1, v2}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 72
    .line 73
    .line 74
    const-string v2, "Import"

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->M0(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    sget-object v2, Lcom/android/launcher3/util/m0;->d:Lcom/android/launcher3/util/p1;

    .line 80
    .line 81
    const-string v3, "ORDERED_BG_EXECUTOR"

    .line 82
    .line 83
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    new-instance v3, Ld2/k;

    .line 87
    .line 88
    invoke-direct {v3, v1}, Ld2/k;-><init>(Landroidx/preference/Preference;)V

    .line 89
    .line 90
    .line 91
    const-string v4, "android.intent.action.OPEN_DOCUMENT"

    .line 92
    .line 93
    invoke-direct {p0, v4, v2, v3}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->N1(Ljava/lang/String;Ljava/util/concurrent/Executor;Lu4/l;)Landroid/content/Intent;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {v1, p0}, Landroidx/preference/Preference;->A0(Landroid/content/Intent;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceGroup;->V0(Landroidx/preference/Preference;)Z

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method private static final G1(Landroidx/preference/Preference;Landroid/net/Uri;)Lh4/t;
    .locals 3

    .line 1
    const-string v0, "uri"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/launcher3/util/g1;->a:Lcom/android/launcher3/util/g1;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "getContext(...)"

    .line 13
    .line 14
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    new-instance v2, Ld2/e;

    .line 18
    .line 19
    invoke-direct {v2, p0, p1}, Ld2/e;-><init>(Landroidx/preference/Preference;Landroid/net/Uri;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/util/g1;->h(Landroid/content/Context;Lu4/l;)V

    .line 23
    .line 24
    .line 25
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 26
    .line 27
    return-object p0
.end method

.method private static final H1(Landroidx/preference/Preference;Landroid/net/Uri;Ljava/lang/String;)Lh4/t;
    .locals 2

    .line 1
    const-string v0, "layoutXml"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p1}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :try_start_0
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 19
    .line 20
    const-string v1, "UTF_8"

    .line 21
    .line 22
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    const-string v0, "getBytes(...)"

    .line 30
    .line 31
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    invoke-virtual {p1, p2}, Ljava/io/OutputStream;->write([B)V

    .line 37
    .line 38
    .line 39
    sget-object p2, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    :goto_0
    const/4 p2, 0x0

    .line 45
    invoke-static {p1, p2}, Lr4/a;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 49
    .line 50
    new-instance p2, Ld2/j;

    .line 51
    .line 52
    invoke-direct {p2, p0}, Ld2/j;-><init>(Landroidx/preference/Preference;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 59
    .line 60
    return-object p0

    .line 61
    :goto_1
    :try_start_1
    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 62
    :catchall_1
    move-exception p2

    .line 63
    invoke-static {p1, p0}, Lr4/a;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    throw p2
.end method

.method private static final I1(Landroidx/preference/Preference;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "File saved"

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private static final J1(Landroidx/preference/Preference;Landroid/net/Uri;)Lh4/t;
    .locals 2

    .line 1
    const-string v0, "uri"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/4 v0, 0x0

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    :try_start_0
    invoke-virtual {p1}, Ljava/io/InputStream;->readAllBytes()[B

    .line 22
    .line 23
    .line 24
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-static {p1, v0}, Lr4/a;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    sget-object p1, Lcom/android/launcher3/util/g1;->a:Lcom/android/launcher3/util/g1;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string v0, "getContext(...)"

    .line 38
    .line 39
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, p0, v1}, Lcom/android/launcher3/util/g1;->m(Landroid/content/Context;[B)V

    .line 43
    .line 44
    .line 45
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 46
    .line 47
    return-object p0

    .line 48
    :catchall_0
    move-exception p0

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    :goto_0
    :try_start_1
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    .line 52
    invoke-static {p1, v0}, Lr4/a;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    return-object p0

    .line 56
    :goto_1
    :try_start_2
    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 57
    :catchall_1
    move-exception v0

    .line 58
    invoke-static {p1, p0}, Lr4/a;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    throw v0
.end method

.method private final varargs K1(Landroidx/preference/PreferenceCategory;Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 1

    .line 1
    new-instance p0, Landroidx/preference/Preference;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p2}, Landroidx/preference/Preference;->M0(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    const-string v0, "Tap to reset"

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->J0(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ld2/c;

    .line 19
    .line 20
    invoke-direct {v0, p1, p2, p3}, Ld2/c;-><init>(Landroidx/preference/PreferenceCategory;Ljava/lang/String;[Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->F0(Landroidx/preference/Preference$e;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p0}, Landroidx/preference/PreferenceGroup;->V0(Landroidx/preference/Preference;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0
.end method

.method private static final L1(Landroidx/preference/PreferenceCategory;Ljava/lang/String;[Ljava/lang/String;Landroidx/preference/Preference;)Z
    .locals 4

    .line 1
    const-string v0, "<unused var>"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p3, Lcom/android/launcher3/J3;->c:Lcom/android/launcher3/J3$a;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "getContext(...)"

    .line 13
    .line 14
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p3, v0}, Lcom/android/launcher3/J3$a;->g(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    array-length v0, p2

    .line 26
    const/4 v1, 0x0

    .line 27
    move v2, v1

    .line 28
    :goto_0
    if-ge v2, v0, :cond_0

    .line 29
    .line 30
    aget-object v3, p2, v2

    .line 31
    .line 32
    invoke-interface {p3, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 33
    .line 34
    .line 35
    add-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    new-instance p2, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string p3, "Reset "

    .line 51
    .line 52
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 67
    .line 68
    .line 69
    const/4 p0, 0x1

    .line 70
    return p0
.end method

.method private final M1()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x2

    .line 3
    const-string v2, "Onboarding Flows"

    .line 4
    .line 5
    invoke-static {p0, v2, v0, v1, v0}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->k2(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Landroidx/preference/PreferenceCategory;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "Reset these if you want to see the education again."

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroidx/preference/Preference;->J0(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    sget-object v1, Lcom/android/launcher3/util/H1;->f:Lcom/android/launcher3/X;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/android/launcher3/X;->c()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sget-object v2, Lcom/android/launcher3/util/H1;->c:Lcom/android/launcher3/util/H1$a;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/android/launcher3/util/H1$a;->b()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "All Apps Bounce"

    .line 31
    .line 32
    invoke-direct {p0, v0, v2, v1}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->K1(Landroidx/preference/PreferenceCategory;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    sget-object v1, Lcom/android/launcher3/util/H1;->d:Lcom/android/launcher3/util/H1$a;

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/android/launcher3/util/H1$a;->b()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    sget-object v2, Lcom/android/launcher3/util/H1;->g:Lcom/android/launcher3/X;

    .line 42
    .line 43
    invoke-virtual {v2}, Lcom/android/launcher3/X;->c()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const-string v2, "Hybrid Hotseat Education"

    .line 52
    .line 53
    invoke-direct {p0, v0, v2, v1}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->K1(Landroidx/preference/PreferenceCategory;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    sget-object v1, Lcom/android/launcher3/util/H1;->b:Lcom/android/launcher3/util/H1$a;

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/android/launcher3/util/H1$a;->b()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    filled-new-array {v1}, [Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const-string v2, "Taskbar Education"

    .line 67
    .line 68
    invoke-direct {p0, v0, v2, v1}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->K1(Landroidx/preference/PreferenceCategory;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    sget-object v1, Lcom/android/launcher3/util/H1;->h:Lcom/android/launcher3/X;

    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/android/launcher3/X;->c()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    filled-new-array {v1}, [Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    const-string v2, "Taskbar Search Education"

    .line 82
    .line 83
    invoke-direct {p0, v0, v2, v1}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->K1(Landroidx/preference/PreferenceCategory;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    sget-object v1, Lcom/android/launcher3/util/H1;->e:Lcom/android/launcher3/util/H1$a;

    .line 87
    .line 88
    invoke-virtual {v1}, Lcom/android/launcher3/util/H1$a;->b()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    filled-new-array {v1}, [Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    const-string v2, "All Apps Visited Count"

    .line 97
    .line 98
    invoke-direct {p0, v0, v2, v1}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->K1(Landroidx/preference/PreferenceCategory;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method private final N1(Ljava/lang/String;Ljava/util/concurrent/Executor;Lu4/l;)Landroid/content/Intent;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/Executor;",
            "Lu4/l<",
            "-",
            "Landroid/net/Uri;",
            "Lh4/t;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/app/PendingIntent;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$d;

    .line 4
    .line 5
    invoke-direct {v1, p2, p3}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$d;-><init>(Ljava/util/concurrent/Executor;Lu4/l;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Landroid/app/PendingIntent;-><init>(Landroid/content/IIntentSender;)V

    .line 9
    .line 10
    .line 11
    new-instance p2, Lcom/android/launcher3/util/A2;

    .line 12
    .line 13
    const/4 p3, 0x0

    .line 14
    invoke-direct {p2, v0, p3}, Lcom/android/launcher3/util/A2;-><init>(Landroid/app/PendingIntent;I)V

    .line 15
    .line 16
    .line 17
    new-instance p3, Landroid/content/Intent;

    .line 18
    .line 19
    invoke-direct {p3, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string p1, "android.intent.category.OPENABLE"

    .line 23
    .line 24
    invoke-virtual {p3, p1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string p3, "text/xml"

    .line 29
    .line 30
    invoke-virtual {p1, p3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string p3, "android.intent.extra.TITLE"

    .line 35
    .line 36
    const-string v0, "launcher_grid.xml"

    .line 37
    .line 38
    invoke-virtual {p1, p3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p2, Lcom/android/launcher3/util/A2;->i:Landroid/content/Intent;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {p0, p2}, Lcom/android/launcher3/proxy/ProxyActivityStarter;->a(Landroid/content/Context;Lcom/android/launcher3/util/A2;)Landroid/content/Intent;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string p1, "getLaunchIntent(...)"

    .line 53
    .line 54
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-object p0
.end method

.method private final O1(Ljava/lang/String;Landroidx/preference/PreferenceGroup;)V
    .locals 17

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    invoke-virtual {v1}, Landroidx/preference/PreferenceGroup;->a1()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/4 v3, 0x0

    .line 10
    move v4, v3

    .line 11
    move v5, v4

    .line 12
    :goto_0
    if-ge v4, v2, :cond_3

    .line 13
    .line 14
    invoke-virtual {v1, v4}, Landroidx/preference/PreferenceGroup;->Z0(I)Landroidx/preference/Preference;

    .line 15
    .line 16
    .line 17
    move-result-object v6

    .line 18
    const-string v7, "getPreference(...)"

    .line 19
    .line 20
    invoke-static {v6, v7}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    instance-of v7, v6, Landroidx/preference/PreferenceGroup;

    .line 24
    .line 25
    if-eqz v7, :cond_0

    .line 26
    .line 27
    move-object v7, v6

    .line 28
    check-cast v7, Landroidx/preference/PreferenceGroup;

    .line 29
    .line 30
    move-object/from16 v8, p0

    .line 31
    .line 32
    invoke-direct {v8, v0, v7}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->O1(Ljava/lang/String;Landroidx/preference/PreferenceGroup;)V

    .line 33
    .line 34
    .line 35
    goto :goto_3

    .line 36
    :cond_0
    move-object/from16 v8, p0

    .line 37
    .line 38
    invoke-virtual {v6}, Landroidx/preference/Preference;->I()Ljava/lang/CharSequence;

    .line 39
    .line 40
    .line 41
    move-result-object v7

    .line 42
    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v7

    .line 46
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 47
    .line 48
    .line 49
    move-result-object v9

    .line 50
    const-string v10, "getDefault(...)"

    .line 51
    .line 52
    invoke-static {v9, v10}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v7, v9}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v11

    .line 59
    const-string v7, "toLowerCase(...)"

    .line 60
    .line 61
    invoke-static {v11, v7}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    const/4 v15, 0x4

    .line 65
    const/16 v16, 0x0

    .line 66
    .line 67
    const-string v12, "_"

    .line 68
    .line 69
    const-string v13, " "

    .line 70
    .line 71
    const/4 v14, 0x0

    .line 72
    invoke-static/range {v11 .. v16}, LD4/g;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v7

    .line 76
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 77
    .line 78
    .line 79
    move-result v9

    .line 80
    if-nez v9, :cond_1

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_1
    const/4 v9, 0x2

    .line 84
    const/4 v10, 0x0

    .line 85
    invoke-static {v7, v0, v3, v9, v10}, LD4/g;->y(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v7

    .line 89
    if-eqz v7, :cond_2

    .line 90
    .line 91
    :goto_1
    const/4 v7, 0x1

    .line 92
    goto :goto_2

    .line 93
    :cond_2
    move v7, v3

    .line 94
    :goto_2
    invoke-virtual {v6, v7}, Landroidx/preference/Preference;->N0(Z)V

    .line 95
    .line 96
    .line 97
    :goto_3
    invoke-virtual {v6}, Landroidx/preference/Preference;->P()Z

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    or-int/2addr v5, v6

    .line 102
    add-int/lit8 v4, v4, 0x1

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_3
    invoke-virtual {v1, v5}, Landroidx/preference/Preference;->N0(Z)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method private final P1(Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo<",
            "Ljava/lang/Boolean;",
            ">;)Z"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/android/quickstep/util/DeviceConfigHelper;->Companion:Lcom/android/quickstep/util/DeviceConfigHelper$Companion;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/DeviceConfigHelper$Companion;->getPrefs()Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1}, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->getKey()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->getKey()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p1}, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->getValueInCode()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    const-string v2, "launcher"

    .line 26
    .line 27
    invoke-static {v2, v1, p1}, Landroid/provider/DeviceConfig;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method

.method private final Q1(Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/android/quickstep/util/DeviceConfigHelper;->Companion:Lcom/android/quickstep/util/DeviceConfigHelper$Companion;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/DeviceConfigHelper$Companion;->getPrefs()Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1}, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->getKey()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->getKey()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p1}, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->getValueInCode()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ljava/lang/Number;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    const-string v2, "launcher"

    .line 26
    .line 27
    invoke-static {v2, v1, p1}, Landroid/provider/DeviceConfig;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method private final R1(Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)Landroid/text/Spanned;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo<",
            "*>;)",
            "Landroid/text/Spanned;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/android/quickstep/util/DeviceConfigHelper;->Companion:Lcom/android/quickstep/util/DeviceConfigHelper$Companion;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/DeviceConfigHelper$Companion;->getPrefs()Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1}, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->getKey()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const-string p0, "<font color=\'red\'><b>[OVERRIDDEN]</b></font><br>"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p0, ""

    .line 21
    .line 22
    :goto_0
    invoke-virtual {p1}, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->getDesc()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method private final S1(Landroidx/preference/PreferenceGroup;)V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/util/T1;->a:Lcom/android/launcher3/util/I;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "null cannot be cast to non-null type com.android.launcher3.uioverrides.plugins.PluginManagerWrapperImpl"

    .line 14
    .line 15
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    check-cast v1, Le2/b;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const-string v3, "com.android.systemui.permission.PLUGIN"

    .line 29
    .line 30
    filled-new-array {v3}, [Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    const/16 v4, 0x200

    .line 35
    .line 36
    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackagesHoldingPermissions([Ljava/lang/String;I)Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    const-string v4, "getPackagesHoldingPermissions(...)"

    .line 41
    .line 42
    invoke-static {v3, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    new-instance v4, Ljava/util/ArrayList;

    .line 46
    .line 47
    const/16 v5, 0xa

    .line 48
    .line 49
    invoke-static {v3, v5}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 50
    .line 51
    .line 52
    move-result v6

    .line 53
    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 54
    .line 55
    .line 56
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    if-eqz v6, :cond_0

    .line 65
    .line 66
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    check-cast v6, Landroid/content/pm/PackageInfo;

    .line 71
    .line 72
    iget-object v6, v6, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 73
    .line 74
    invoke-interface {v4, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_0
    invoke-virtual {v1}, Le2/b;->e()Ljava/util/Set;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    const-string v6, "getPluginActions(...)"

    .line 83
    .line 84
    invoke-static {v3, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    new-instance v6, Ljava/util/ArrayList;

    .line 88
    .line 89
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 97
    .line 98
    .line 99
    move-result v7

    .line 100
    if-eqz v7, :cond_3

    .line 101
    .line 102
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v7

    .line 106
    check-cast v7, Ljava/lang/String;

    .line 107
    .line 108
    new-instance v8, Landroid/content/Intent;

    .line 109
    .line 110
    invoke-direct {v8, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    const/16 v7, 0x240

    .line 114
    .line 115
    invoke-virtual {v2, v8, v7}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    .line 116
    .line 117
    .line 118
    move-result-object v7

    .line 119
    const-string v8, "queryIntentServices(...)"

    .line 120
    .line 121
    invoke-static {v7, v8}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    new-instance v8, Ljava/util/ArrayList;

    .line 125
    .line 126
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 130
    .line 131
    .line 132
    move-result-object v7

    .line 133
    :cond_1
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 134
    .line 135
    .line 136
    move-result v9

    .line 137
    if-eqz v9, :cond_2

    .line 138
    .line 139
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v9

    .line 143
    move-object v10, v9

    .line 144
    check-cast v10, Landroid/content/pm/ResolveInfo;

    .line 145
    .line 146
    iget-object v10, v10, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    .line 147
    .line 148
    iget-object v10, v10, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    .line 149
    .line 150
    invoke-interface {v4, v10}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v10

    .line 154
    if-eqz v10, :cond_1

    .line 155
    .line 156
    invoke-interface {v8, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    goto :goto_2

    .line 160
    :cond_2
    invoke-static {v6, v8}, Li4/m;->x(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 161
    .line 162
    .line 163
    goto :goto_1

    .line 164
    :cond_3
    new-instance v3, Ljava/util/LinkedHashMap;

    .line 165
    .line 166
    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    .line 167
    .line 168
    .line 169
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 174
    .line 175
    .line 176
    move-result v6

    .line 177
    if-eqz v6, :cond_5

    .line 178
    .line 179
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object v6

    .line 183
    move-object v7, v6

    .line 184
    check-cast v7, Landroid/content/pm/ResolveInfo;

    .line 185
    .line 186
    iget-object v7, v7, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    .line 187
    .line 188
    iget-object v8, v7, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    .line 189
    .line 190
    iget-object v7, v7, Landroid/content/pm/ServiceInfo;->processName:Ljava/lang/String;

    .line 191
    .line 192
    new-instance v9, Ljava/lang/StringBuilder;

    .line 193
    .line 194
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    const-string v8, "-"

    .line 201
    .line 202
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v7

    .line 212
    invoke-interface {v3, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v8

    .line 216
    if-nez v8, :cond_4

    .line 217
    .line 218
    new-instance v8, Ljava/util/ArrayList;

    .line 219
    .line 220
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 221
    .line 222
    .line 223
    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    :cond_4
    check-cast v8, Ljava/util/List;

    .line 227
    .line 228
    invoke-interface {v8, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    goto :goto_3

    .line 232
    :cond_5
    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 233
    .line 234
    .line 235
    move-result-object v3

    .line 236
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 237
    .line 238
    .line 239
    move-result-object v3

    .line 240
    :goto_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 241
    .line 242
    .line 243
    move-result v4

    .line 244
    if-eqz v4, :cond_e

    .line 245
    .line 246
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v4

    .line 250
    check-cast v4, Ljava/util/List;

    .line 251
    .line 252
    const/4 v6, 0x0

    .line 253
    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object v7

    .line 257
    invoke-static {v7}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 258
    .line 259
    .line 260
    check-cast v7, Landroid/content/pm/ResolveInfo;

    .line 261
    .line 262
    iget-object v8, v7, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    .line 263
    .line 264
    iget-object v8, v8, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    .line 265
    .line 266
    const/4 v9, 0x0

    .line 267
    const-string v10, "package"

    .line 268
    .line 269
    invoke-static {v10, v8, v9}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    .line 270
    .line 271
    .line 272
    move-result-object v8

    .line 273
    new-instance v9, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$c;

    .line 274
    .line 275
    new-instance v10, Ld2/l;

    .line 276
    .line 277
    invoke-direct {v10, v0, v8}, Ld2/l;-><init>(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Landroid/net/Uri;)V

    .line 278
    .line 279
    .line 280
    invoke-direct {v9, v0, v10}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$c;-><init>(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lu4/p;)V

    .line 281
    .line 282
    .line 283
    const/4 v10, 0x1

    .line 284
    invoke-virtual {v9, v10}, Landroidx/preference/Preference;->H0(Z)V

    .line 285
    .line 286
    .line 287
    invoke-virtual {v7, v2}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    .line 288
    .line 289
    .line 290
    move-result-object v7

    .line 291
    invoke-virtual {v9, v7}, Landroidx/preference/Preference;->M0(Ljava/lang/CharSequence;)V

    .line 292
    .line 293
    .line 294
    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    .line 295
    .line 296
    .line 297
    move-result v7

    .line 298
    if-eqz v7, :cond_7

    .line 299
    .line 300
    :cond_6
    move v7, v10

    .line 301
    goto :goto_5

    .line 302
    :cond_7
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 303
    .line 304
    .line 305
    move-result-object v7

    .line 306
    :cond_8
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 307
    .line 308
    .line 309
    move-result v11

    .line 310
    if-eqz v11, :cond_6

    .line 311
    .line 312
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 313
    .line 314
    .line 315
    move-result-object v11

    .line 316
    check-cast v11, Landroid/content/pm/ResolveInfo;

    .line 317
    .line 318
    invoke-virtual {v1}, Le2/b;->f()Le2/a;

    .line 319
    .line 320
    .line 321
    move-result-object v12

    .line 322
    iget-object v11, v11, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    .line 323
    .line 324
    invoke-virtual {v11}, Landroid/content/pm/ServiceInfo;->getComponentName()Landroid/content/ComponentName;

    .line 325
    .line 326
    .line 327
    move-result-object v11

    .line 328
    invoke-virtual {v12, v11}, Le2/a;->isEnabled(Landroid/content/ComponentName;)Z

    .line 329
    .line 330
    .line 331
    move-result v11

    .line 332
    if-nez v11, :cond_8

    .line 333
    .line 334
    move v7, v6

    .line 335
    :goto_5
    invoke-virtual {v9, v7}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 336
    .line 337
    .line 338
    new-instance v7, Ljava/util/ArrayList;

    .line 339
    .line 340
    invoke-static {v4, v5}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 341
    .line 342
    .line 343
    move-result v11

    .line 344
    invoke-direct {v7, v11}, Ljava/util/ArrayList;-><init>(I)V

    .line 345
    .line 346
    .line 347
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 348
    .line 349
    .line 350
    move-result-object v11

    .line 351
    :goto_6
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    .line 352
    .line 353
    .line 354
    move-result v12

    .line 355
    if-eqz v12, :cond_9

    .line 356
    .line 357
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 358
    .line 359
    .line 360
    move-result-object v12

    .line 361
    check-cast v12, Landroid/content/pm/ResolveInfo;

    .line 362
    .line 363
    iget-object v12, v12, Landroid/content/pm/ResolveInfo;->filter:Landroid/content/IntentFilter;

    .line 364
    .line 365
    invoke-interface {v7, v12}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 366
    .line 367
    .line 368
    goto :goto_6

    .line 369
    :cond_9
    new-instance v13, Ljava/util/ArrayList;

    .line 370
    .line 371
    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 372
    .line 373
    .line 374
    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 375
    .line 376
    .line 377
    move-result-object v7

    .line 378
    :cond_a
    :goto_7
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 379
    .line 380
    .line 381
    move-result v11

    .line 382
    if-eqz v11, :cond_d

    .line 383
    .line 384
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 385
    .line 386
    .line 387
    move-result-object v11

    .line 388
    move-object v12, v11

    .line 389
    check-cast v12, Landroid/content/IntentFilter;

    .line 390
    .line 391
    if-eqz v12, :cond_b

    .line 392
    .line 393
    invoke-virtual {v12}, Landroid/content/IntentFilter;->countActions()I

    .line 394
    .line 395
    .line 396
    move-result v12

    .line 397
    goto :goto_8

    .line 398
    :cond_b
    move v12, v6

    .line 399
    :goto_8
    if-lez v12, :cond_c

    .line 400
    .line 401
    move v12, v10

    .line 402
    goto :goto_9

    .line 403
    :cond_c
    move v12, v6

    .line 404
    :goto_9
    if-eqz v12, :cond_a

    .line 405
    .line 406
    invoke-interface {v13, v11}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 407
    .line 408
    .line 409
    goto :goto_7

    .line 410
    :cond_d
    new-instance v19, Ld2/m;

    .line 411
    .line 412
    invoke-direct/range {v19 .. v19}, Ld2/m;-><init>()V

    .line 413
    .line 414
    .line 415
    const/16 v20, 0x1d

    .line 416
    .line 417
    const/16 v21, 0x0

    .line 418
    .line 419
    const/4 v14, 0x0

    .line 420
    const-string v15, "Plugins: "

    .line 421
    .line 422
    const/16 v16, 0x0

    .line 423
    .line 424
    const/16 v17, 0x0

    .line 425
    .line 426
    const/16 v18, 0x0

    .line 427
    .line 428
    invoke-static/range {v13 .. v21}, Li4/m;->k0(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lu4/l;ILjava/lang/Object;)Ljava/lang/String;

    .line 429
    .line 430
    .line 431
    move-result-object v6

    .line 432
    invoke-virtual {v9, v6}, Landroidx/preference/Preference;->J0(Ljava/lang/CharSequence;)V

    .line 433
    .line 434
    .line 435
    new-instance v6, Ld2/n;

    .line 436
    .line 437
    invoke-direct {v6, v4, v1, v8}, Ld2/n;-><init>(Ljava/util/List;Le2/b;Landroid/net/Uri;)V

    .line 438
    .line 439
    .line 440
    invoke-virtual {v9, v6}, Landroidx/preference/Preference;->E0(Landroidx/preference/Preference$d;)V

    .line 441
    .line 442
    .line 443
    move-object/from16 v4, p1

    .line 444
    .line 445
    invoke-virtual {v4, v9}, Landroidx/preference/PreferenceGroup;->V0(Landroidx/preference/Preference;)Z

    .line 446
    .line 447
    .line 448
    goto/16 :goto_4

    .line 449
    .line 450
    :cond_e
    return-void
.end method

.method private static final T1(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Landroid/net/Uri;Landroidx/preference/h;Landroidx/preference/SwitchPreference;)Lh4/t;
    .locals 1

    .line 1
    const-string v0, "holder"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "<unused var>"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p2, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 12
    .line 13
    new-instance p3, Ld2/d;

    .line 14
    .line 15
    invoke-direct {p3, p0, p1}, Ld2/d;-><init>(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Landroid/net/Uri;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 19
    .line 20
    .line 21
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 22
    .line 23
    return-object p0
.end method

.method private static final U1(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Landroid/net/Uri;Landroid/view/View;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p2, Landroid/content/Intent;

    .line 6
    .line 7
    const-string v0, "android.settings.APPLICATION_DETAILS_SETTINGS"

    .line 8
    .line 9
    invoke-direct {p2, v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0
.end method

.method private static final V1(Landroid/content/IntentFilter;)Ljava/lang/CharSequence;
    .locals 13

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/content/IntentFilter;->getAction(I)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    const-string p0, "getAction(...)"

    .line 7
    .line 8
    invoke-static {v1, p0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v5, 0x4

    .line 12
    const/4 v6, 0x0

    .line 13
    const-string v2, "com.android.systemui.action.PLUGIN_"

    .line 14
    .line 15
    const-string v3, ""

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    invoke-static/range {v1 .. v6}, LD4/g;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v7

    .line 22
    const/4 v11, 0x4

    .line 23
    const/4 v12, 0x0

    .line 24
    const-string v8, "com.android.launcher3.action.PLUGIN_"

    .line 25
    .line 26
    const-string v9, ""

    .line 27
    .line 28
    const/4 v10, 0x0

    .line 29
    invoke-static/range {v7 .. v12}, LD4/g;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method private static final W1(Ljava/util/List;Le2/b;Landroid/net/Uri;Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 2

    .line 1
    const-string v0, "<unused var>"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p3, "null cannot be cast to non-null type kotlin.Boolean"

    .line 7
    .line 8
    invoke-static {p4, p3}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    check-cast p4, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    const/4 p4, 0x1

    .line 18
    xor-int/2addr p3, p4

    .line 19
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Landroid/content/pm/ResolveInfo;

    .line 34
    .line 35
    invoke-virtual {p1}, Le2/b;->f()Le2/a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/content/pm/ServiceInfo;->getComponentName()Landroid/content/ComponentName;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v1, v0, p3}, Le2/a;->setDisabled(Landroid/content/ComponentName;I)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    new-instance p0, Landroid/content/Intent;

    .line 50
    .line 51
    const-string p3, "android.intent.action.PACKAGE_CHANGED"

    .line 52
    .line 53
    invoke-direct {p0, p3, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, p0}, Le2/b;->g(Landroid/content/Intent;)V

    .line 57
    .line 58
    .line 59
    return p4
.end method

.method private final X1(Landroidx/preference/PreferenceGroup;)V
    .locals 7

    .line 1
    sget-object v0, Lcom/android/quickstep/util/DeviceConfigHelper;->Companion:Lcom/android/quickstep/util/DeviceConfigHelper$Companion;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/DeviceConfigHelper$Companion;->getPrefs()Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/util/DeviceConfigHelper$Companion;->getAllProps()Ljava/util/Map;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Li4/m;->E0(Ljava/lang/Iterable;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v2, Ld2/o;

    .line 20
    .line 21
    invoke-direct {v2, v1}, Ld2/o;-><init>(Landroid/content/SharedPreferences;)V

    .line 22
    .line 23
    .line 24
    new-instance v3, Ld2/p;

    .line 25
    .line 26
    invoke-direct {v3, v2}, Ld2/p;-><init>(Lu4/l;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v3}, Ljava/util/Comparator;->comparingInt(Ljava/util/function/ToIntFunction;)Ljava/util/Comparator;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    new-instance v3, Ld2/q;

    .line 34
    .line 35
    invoke-direct {v3}, Ld2/q;-><init>()V

    .line 36
    .line 37
    .line 38
    new-instance v4, Ld2/r;

    .line 39
    .line 40
    invoke-direct {v4, v3}, Ld2/r;-><init>(Lu4/l;)V

    .line 41
    .line 42
    .line 43
    invoke-interface {v2, v4}, Ljava/util/Comparator;->thenComparing(Ljava/util/function/Function;)Ljava/util/Comparator;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    const-string v3, "thenComparing(...)"

    .line 48
    .line 49
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, v2}, Li4/m;->x0(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    const/4 v4, 0x0

    .line 65
    if-eqz v3, :cond_1

    .line 66
    .line 67
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    check-cast v3, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;

    .line 72
    .line 73
    invoke-virtual {v3}, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->isInt()Z

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    if-nez v5, :cond_0

    .line 78
    .line 79
    const-string v5, "null cannot be cast to non-null type com.android.quickstep.util.DeviceConfigHelper.DebugInfo<kotlin.Boolean>"

    .line 80
    .line 81
    invoke-static {v3, v5}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    new-instance v5, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$c;

    .line 85
    .line 86
    new-instance v6, Ld2/s;

    .line 87
    .line 88
    invoke-direct {v6, v1, p0, v3}, Ld2/s;-><init>(Landroid/content/SharedPreferences;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)V

    .line 89
    .line 90
    .line 91
    invoke-direct {v5, p0, v6}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$c;-><init>(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lu4/p;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v3}, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->getKey()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v6

    .line 98
    invoke-virtual {v5, v6}, Landroidx/preference/Preference;->B0(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v5, v4}, Landroidx/preference/Preference;->H0(Z)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v3}, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->getKey()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    invoke-virtual {v5, v4}, Landroidx/preference/Preference;->M0(Ljava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    invoke-direct {p0, v3}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->R1(Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)Landroid/text/Spanned;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    invoke-virtual {v5, v4}, Landroidx/preference/Preference;->J0(Ljava/lang/CharSequence;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v3}, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->getKey()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    invoke-direct {p0, v3}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->P1(Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)Z

    .line 123
    .line 124
    .line 125
    move-result v6

    .line 126
    invoke-interface {v1, v4, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 127
    .line 128
    .line 129
    move-result v4

    .line 130
    invoke-virtual {v5, v4}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 131
    .line 132
    .line 133
    new-instance v4, Lcom/android/launcher3/uioverrides/flags/a;

    .line 134
    .line 135
    invoke-direct {v4, v1, v3, v5, p0}, Lcom/android/launcher3/uioverrides/flags/a;-><init>(Landroid/content/SharedPreferences;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$c;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v5, v4}, Landroidx/preference/Preference;->E0(Landroidx/preference/Preference$d;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p1, v5}, Landroidx/preference/PreferenceGroup;->V0(Landroidx/preference/Preference;)Z

    .line 142
    .line 143
    .line 144
    goto :goto_0

    .line 145
    :cond_1
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    if-eqz v2, :cond_3

    .line 154
    .line 155
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    check-cast v2, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;

    .line 160
    .line 161
    invoke-virtual {v2}, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->isInt()Z

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    if-eqz v3, :cond_2

    .line 166
    .line 167
    const-string v3, "null cannot be cast to non-null type com.android.quickstep.util.DeviceConfigHelper.DebugInfo<kotlin.Int>"

    .line 168
    .line 169
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    new-instance v3, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$b;

    .line 173
    .line 174
    new-instance v5, Ld2/b;

    .line 175
    .line 176
    invoke-direct {v5, p0, v2, v1}, Ld2/b;-><init>(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Landroid/content/SharedPreferences;)V

    .line 177
    .line 178
    .line 179
    invoke-direct {v3, p0, v5}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$b;-><init>(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lu4/p;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v2}, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->getKey()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v5

    .line 186
    invoke-virtual {v3, v5}, Landroidx/preference/Preference;->B0(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v3, v4}, Landroidx/preference/Preference;->H0(Z)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v2}, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->getKey()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v5

    .line 196
    invoke-virtual {v3, v5}, Landroidx/preference/Preference;->M0(Ljava/lang/CharSequence;)V

    .line 197
    .line 198
    .line 199
    invoke-direct {p0, v2}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->R1(Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)Landroid/text/Spanned;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    invoke-virtual {v3, v2}, Landroidx/preference/Preference;->J0(Ljava/lang/CharSequence;)V

    .line 204
    .line 205
    .line 206
    const v2, 0x7f0e00bc

    .line 207
    .line 208
    .line 209
    invoke-virtual {v3, v2}, Landroidx/preference/Preference;->O0(I)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p1, v3}, Landroidx/preference/PreferenceGroup;->V0(Landroidx/preference/Preference;)Z

    .line 213
    .line 214
    .line 215
    goto :goto_1

    .line 216
    :cond_3
    return-void
.end method

.method private static final Y1(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Landroid/content/SharedPreferences;Landroidx/preference/h;Landroidx/preference/Preference;)Lh4/t;
    .locals 8

    .line 1
    const-string v0, "holder"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "pref"

    .line 7
    .line 8
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const v0, 0x7f0b0489

    .line 12
    .line 13
    .line 14
    invoke-virtual {p3, v0}, Landroidx/preference/h;->a(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "null cannot be cast to non-null type com.android.launcher3.ExtendedEditText"

    .line 19
    .line 20
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    move-object v5, v0

    .line 24
    check-cast v5, Lcom/android/launcher3/ExtendedEditText;

    .line 25
    .line 26
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->Q1(Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v5, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    new-instance v2, Ld2/f;

    .line 34
    .line 35
    move-object v6, p0

    .line 36
    move-object v7, p1

    .line 37
    move-object v3, p2

    .line 38
    move-object v4, p4

    .line 39
    invoke-direct/range {v2 .. v7}, Ld2/f;-><init>(Landroid/content/SharedPreferences;Landroidx/preference/Preference;Lcom/android/launcher3/ExtendedEditText;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v5, v2}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 43
    .line 44
    .line 45
    new-instance p0, Ld2/g;

    .line 46
    .line 47
    invoke-direct {p0, v5, v6, v7}, Ld2/g;-><init>(Lcom/android/launcher3/ExtendedEditText;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v5, p0}, Lcom/android/launcher3/ExtendedEditText;->setOnBackKeyListener(Lcom/android/launcher3/ExtendedEditText$a;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p3, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 54
    .line 55
    new-instance v2, Ld2/h;

    .line 56
    .line 57
    invoke-direct/range {v2 .. v7}, Ld2/h;-><init>(Landroid/content/SharedPreferences;Landroidx/preference/Preference;Lcom/android/launcher3/ExtendedEditText;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 61
    .line 62
    .line 63
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 64
    .line 65
    return-object p0
.end method

.method private static final Z1(Landroid/content/SharedPreferences;Landroidx/preference/Preference;Lcom/android/launcher3/ExtendedEditText;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p5, 0x6

    .line 2
    if-ne p6, p5, :cond_0

    .line 3
    .line 4
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p5

    .line 12
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    invoke-interface {p0, p5, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 29
    .line 30
    .line 31
    invoke-direct {p3, p4}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->R1(Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)Landroid/text/Spanned;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->J0(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return p0
.end method

.method private static final a2(Lcom/android/launcher3/ExtendedEditText;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)Z
    .locals 0

    .line 1
    invoke-direct {p1, p2}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->Q1(Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0
.end method

.method private static final b2(Landroid/content/SharedPreferences;Landroidx/preference/Preference;Lcom/android/launcher3/ExtendedEditText;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p5

    .line 9
    invoke-interface {p0, p5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 14
    .line 15
    .line 16
    invoke-direct {p3, p4}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->Q1(Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p2, p0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p3, p4}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->R1(Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)Landroid/text/Spanned;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->J0(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0
.end method

.method private static final c2(Landroid/content/SharedPreferences;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)I
    .locals 1

    .line 1
    const-string v0, "prop"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->getKey()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-interface {p0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    xor-int/lit8 p0, p0, 0x1

    .line 15
    .line 16
    return p0
.end method

.method private static final d2(Lu4/l;Ljava/lang/Object;)I
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Number;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private static final e2(Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "prop"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->getKey()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method private static final f2(Lu4/l;Ljava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method private static final g2(Landroid/content/SharedPreferences;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Landroidx/preference/h;Landroidx/preference/SwitchPreference;)Lh4/t;
    .locals 1

    .line 1
    const-string v0, "holder"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "pref"

    .line 7
    .line 8
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p3, p3, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 12
    .line 13
    new-instance v0, Ld2/i;

    .line 14
    .line 15
    invoke-direct {v0, p0, p4, p1, p2}, Ld2/i;-><init>(Landroid/content/SharedPreferences;Landroidx/preference/SwitchPreference;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p3, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 19
    .line 20
    .line 21
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 22
    .line 23
    return-object p0
.end method

.method private static final h2(Landroid/content/SharedPreferences;Landroidx/preference/SwitchPreference;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p4

    .line 9
    invoke-interface {p0, p4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 14
    .line 15
    .line 16
    invoke-direct {p2, p3}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->P1(Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {p1, p0}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p2, p3}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->R1(Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)Landroid/text/Spanned;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p2, p0}, Landroidx/preference/Preference;->J0(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0
.end method

.method private static final i2(Landroid/content/SharedPreferences;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$c;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 1

    .line 1
    const-string v0, "<unused var>"

    .line 2
    .line 3
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p1}, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;->getKey()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p4

    .line 14
    const-string v0, "null cannot be cast to non-null type kotlin.Boolean"

    .line 15
    .line 16
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    check-cast p5, Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result p5

    .line 25
    invoke-interface {p0, p4, p5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 30
    .line 31
    .line 32
    invoke-direct {p3, p1}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->R1(Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)Landroid/text/Spanned;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p2, p0}, Landroidx/preference/Preference;->J0(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0
.end method

.method public static synthetic j1(Landroidx/preference/Preference;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->I1(Landroidx/preference/Preference;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final j2(Ljava/lang/String;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;
    .locals 2

    .line 1
    new-instance v0, Landroidx/preference/PreferenceCategory;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroidx/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Landroidx/preference/Preference;->M0(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p2}, Landroidx/preference/Preference;->J0(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceGroup;->V0(Landroidx/preference/Preference;)Z

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public static synthetic k1(Lu4/l;Ljava/lang/Object;)I
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->d2(Lu4/l;Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static synthetic k2(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Landroidx/preference/PreferenceCategory;
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->j2(Ljava/lang/String;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic l1(Landroidx/preference/Preference;Landroid/net/Uri;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->G1(Landroidx/preference/Preference;Landroid/net/Uri;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic m1(Landroid/content/SharedPreferences;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Landroidx/preference/h;Landroidx/preference/SwitchPreference;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->g2(Landroid/content/SharedPreferences;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Landroidx/preference/h;Landroidx/preference/SwitchPreference;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic n1(Ljava/util/List;Le2/b;Landroid/net/Uri;Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->W1(Ljava/util/List;Le2/b;Landroid/net/Uri;Landroidx/preference/Preference;Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic o1(Landroid/content/SharedPreferences;Landroidx/preference/Preference;Lcom/android/launcher3/ExtendedEditText;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->b2(Landroid/content/SharedPreferences;Landroidx/preference/Preference;Lcom/android/launcher3/ExtendedEditText;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic p1(Lu4/l;Ljava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->f2(Lu4/l;Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic q1(Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->e2(Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic r1(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Landroid/net/Uri;Landroidx/preference/h;Landroidx/preference/SwitchPreference;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->T1(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Landroid/net/Uri;Landroidx/preference/h;Landroidx/preference/SwitchPreference;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic s1(Landroid/content/SharedPreferences;Landroidx/preference/SwitchPreference;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->h2(Landroid/content/SharedPreferences;Landroidx/preference/SwitchPreference;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic t1(Landroid/content/IntentFilter;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->V1(Landroid/content/IntentFilter;)Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic u1(Lcom/android/launcher3/ExtendedEditText;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->a2(Lcom/android/launcher3/ExtendedEditText;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic v1(Landroid/content/SharedPreferences;Landroidx/preference/Preference;Lcom/android/launcher3/ExtendedEditText;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-static/range {p0 .. p7}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->Z1(Landroid/content/SharedPreferences;Landroidx/preference/Preference;Lcom/android/launcher3/ExtendedEditText;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic w1(Landroidx/preference/PreferenceCategory;Ljava/lang/String;[Ljava/lang/String;Landroidx/preference/Preference;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->L1(Landroidx/preference/PreferenceCategory;Ljava/lang/String;[Ljava/lang/String;Landroidx/preference/Preference;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic x1(Landroidx/preference/Preference;Landroid/net/Uri;Ljava/lang/String;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->H1(Landroidx/preference/Preference;Landroid/net/Uri;Ljava/lang/String;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic y1(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Landroid/net/Uri;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->U1(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Landroid/net/Uri;Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic z1(Landroid/content/SharedPreferences;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$c;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->i2(Landroid/content/SharedPreferences;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$c;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Landroidx/preference/Preference;Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method


# virtual methods
.method public T()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroidx/preference/PreferenceGroup;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/preference/PreferenceGroup;->d1()V

    .line 5
    .line 6
    .line 7
    const-string v0, "Server flags"

    .line 8
    .line 9
    const-string v1, "Long press to reset"

    .line 10
    .line 11
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->j2(Ljava/lang/String;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {p0, v0}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->X1(Landroidx/preference/PreferenceGroup;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Lcom/android/systemui/shared/plugins/PluginPrefs;->hasPlugins(Landroid/content/Context;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    const-string v0, "Plugins"

    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-static {p0, v0, v2, v1, v2}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->k2(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Landroidx/preference/PreferenceCategory;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-direct {p0, v0}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->S1(Landroidx/preference/PreferenceGroup;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->E1()V

    .line 40
    .line 41
    .line 42
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->M1()V

    .line 43
    .line 44
    .line 45
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->F1()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public W(Landroidx/preference/h;)V
    .locals 1

    .line 1
    const-string v0, "holder"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroidx/preference/Preference;->W(Landroidx/preference/h;)V

    .line 7
    .line 8
    .line 9
    const v0, 0x7f0b0263

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroidx/preference/h;->a(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Landroid/widget/TextView;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    new-instance v0, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$e;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$e;-><init>(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
