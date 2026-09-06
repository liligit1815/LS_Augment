.class public Lcom/android/systemui/shared/system/QuickStepContract;
.super Ljava/lang/Object;
.source "QuickStepContract.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/shared/system/QuickStepContract$SystemUiStateFlags;
    }
.end annotation


# static fields
.field public static final ALLOW_BACK_GESTURE_IN_SHADE:Z

.field public static final NAV_BAR_MODE_3BUTTON_OVERLAY:Ljava/lang/String; = "com.android.internal.systemui.navbar.threebutton"

.field public static final NAV_BAR_MODE_GESTURAL_OVERLAY:Ljava/lang/String; = "com.android.internal.systemui.navbar.gestural"

.field public static final QUICKSTEP_TOUCH_SLOP_RATIO:F = 3.0f

.field public static final SYSUI_STATE_A11Y_BUTTON_CLICKABLE:J = 0x10L

.field public static final SYSUI_STATE_A11Y_BUTTON_LONG_CLICKABLE:J = 0x20L

.field public static final SYSUI_STATE_ALLOW_GESTURE_IGNORING_BAR_VISIBILITY:J = 0x20000L

.field public static final SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED:J = 0x2000L

.field public static final SYSUI_STATE_AWAKE:J = 0x10000000L

.field public static final SYSUI_STATE_BACK_DISABLED:J = 0x400000L

.field public static final SYSUI_STATE_BACK_DISMISS_IME:J = 0x1000000000L

.field public static final SYSUI_STATE_BOUNCER_SHOWING:J = 0x8L

.field public static final SYSUI_STATE_BUBBLES_EXPANDED:J = 0x4000L

.field public static final SYSUI_STATE_BUBBLES_MANAGE_MENU_EXPANDED:J = 0x800000L

.field public static final SYSUI_STATE_COMMUNAL_HUB_SHOWING:J = 0x800000000L

.field public static final SYSUI_STATE_DEVICE_DOZING:J = 0x200000L

.field public static final SYSUI_STATE_DEVICE_DREAMING:J = 0x8000000L

.field public static final SYSUI_STATE_DIALOG_SHOWING:J = 0x8000L

.field public static final SYSUI_STATE_DISABLE_GESTURE_PIP_ANIMATING:J = 0x400000000L

.field public static final SYSUI_STATE_DISABLE_GESTURE_SPLIT_INVOCATION:J = 0x1000L

.field public static final SYSUI_STATE_FREEFORM_ACTIVE_IN_DESKTOP_MODE:J = 0x4000000L

.field public static final SYSUI_STATE_HOME_DISABLED:J = 0x100L

.field public static final SYSUI_STATE_IME_SWITCHER_BUTTON_VISIBLE:J = 0x100000L

.field public static final SYSUI_STATE_IME_VISIBLE:J = 0x40000L

.field public static final SYSUI_STATE_MAGNIFICATION_OVERLAP:J = 0x80000L

.field public static final SYSUI_STATE_NAV_BAR_HIDDEN:J = 0x2L

.field public static final SYSUI_STATE_NOTIFICATION_PANEL_EXPANDED:J = 0x4L

.field public static final SYSUI_STATE_NOTIFICATION_PANEL_VISIBLE:J = 0x40000000L

.field public static final SYSUI_STATE_ONE_HANDED_ACTIVE:J = 0x10000L

.field public static final SYSUI_STATE_OVERVIEW_DISABLED:J = 0x80L

.field public static final SYSUI_STATE_QUICK_SETTINGS_EXPANDED:J = 0x800L

.field public static final SYSUI_STATE_SCREEN_PINNING:J = 0x1L

.field public static final SYSUI_STATE_SEARCH_DISABLED:J = 0x400L

.field public static final SYSUI_STATE_SHORTCUT_HELPER_SHOWING:J = 0x100000000L

.field public static final SYSUI_STATE_STATUS_BAR_KEYGUARD_GOING_AWAY:J = 0x80000000L

.field public static final SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING:J = 0x40L

.field public static final SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED:J = 0x200L

.field public static final SYSUI_STATE_TOUCHPAD_GESTURES_DISABLED:J = 0x200000000L

.field public static final SYSUI_STATE_VOICE_INTERACTION_WINDOW_SHOWING:J = 0x2000000L

.field public static final SYSUI_STATE_WAKEFULNESS_MASK:J = 0x30000000L

.field public static final SYSUI_STATE_WAKEFULNESS_TRANSITION:J = 0x20000000L

.field private static final TAG:Ljava/lang/String; = "QuickStepContract"

.field public static final WAKEFULNESS_ASLEEP:J = 0x0L

.field public static final WAKEFULNESS_AWAKE:J = 0x10000000L

.field public static final WAKEFULNESS_GOING_TO_SLEEP:J = 0x20000000L

.field public static final WAKEFULNESS_WAKING:J = 0x30000000L


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/systemui/shared/Flags;->shadeAllowBackGesture()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sput-boolean v0, Lcom/android/systemui/shared/system/QuickStepContract;->ALLOW_BACK_GESTURE_IN_SHADE:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static addInterface(Landroid/os/IInterface;Landroid/os/Bundle;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/os/IInterface;->asBinder()Landroid/os/IBinder;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    :try_start_0
    invoke-interface {p0}, Landroid/os/IBinder;->getInterfaceDescriptor()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putIBinder(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catch_0
    move-exception p1

    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v1, "Invalid interface description "

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v0, "QuickStepContract"

    .line 36
    .line 37
    invoke-static {v0, p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method private static getBackGestureDisabledMask(Z)J
    .locals 4

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const-wide/16 v0, 0x42

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-wide/16 v0, 0x40

    .line 7
    .line 8
    :goto_0
    sget-boolean p0, Lcom/android/systemui/shared/system/QuickStepContract;->ALLOW_BACK_GESTURE_IN_SHADE:Z

    .line 9
    .line 10
    if-nez p0, :cond_1

    .line 11
    .line 12
    const-wide/16 v2, 0x4

    .line 13
    .line 14
    or-long/2addr v0, v2

    .line 15
    :cond_1
    return-wide v0
.end method

.method public static final getQuickStepTouchSlopPx(Landroid/content/Context;)F
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    int-to-float p0, p0

    .line 10
    const/high16 v0, 0x40400000    # 3.0f

    .line 11
    .line 12
    mul-float/2addr p0, v0

    .line 13
    return p0
.end method

.method public static getSystemUiStateString(J)Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/util/StringJoiner;

    .line 2
    .line 3
    const-string v1, "|"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/StringJoiner;-><init>(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v1, 0x1

    .line 9
    .line 10
    and-long/2addr v1, p0

    .line 11
    const-wide/16 v3, 0x0

    .line 12
    .line 13
    cmp-long v1, v1, v3

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    const-string v1, "screen_pinned"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 20
    .line 21
    .line 22
    :cond_0
    const-wide/16 v1, 0x80

    .line 23
    .line 24
    and-long/2addr v1, p0

    .line 25
    cmp-long v1, v1, v3

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    const-string v1, "overview_disabled"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 32
    .line 33
    .line 34
    :cond_1
    const-wide/16 v1, 0x100

    .line 35
    .line 36
    and-long/2addr v1, p0

    .line 37
    cmp-long v1, v1, v3

    .line 38
    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    const-string v1, "home_disabled"

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 44
    .line 45
    .line 46
    :cond_2
    const-wide/16 v1, 0x400

    .line 47
    .line 48
    and-long/2addr v1, p0

    .line 49
    cmp-long v1, v1, v3

    .line 50
    .line 51
    if-eqz v1, :cond_3

    .line 52
    .line 53
    const-string v1, "search_disabled"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 56
    .line 57
    .line 58
    :cond_3
    const-wide/16 v1, 0x2

    .line 59
    .line 60
    and-long/2addr v1, p0

    .line 61
    cmp-long v1, v1, v3

    .line 62
    .line 63
    if-eqz v1, :cond_4

    .line 64
    .line 65
    const-string v1, "navbar_hidden"

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 68
    .line 69
    .line 70
    :cond_4
    const-wide/16 v1, 0x4

    .line 71
    .line 72
    and-long/2addr v1, p0

    .line 73
    cmp-long v1, v1, v3

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    const-string v1, "notif_expanded"

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 80
    .line 81
    .line 82
    :cond_5
    const-wide/16 v1, 0x800

    .line 83
    .line 84
    and-long/2addr v1, p0

    .line 85
    cmp-long v1, v1, v3

    .line 86
    .line 87
    if-eqz v1, :cond_6

    .line 88
    .line 89
    const-string v1, "qs_visible"

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 92
    .line 93
    .line 94
    :cond_6
    const-wide/16 v1, 0x40

    .line 95
    .line 96
    and-long/2addr v1, p0

    .line 97
    cmp-long v1, v1, v3

    .line 98
    .line 99
    if-eqz v1, :cond_7

    .line 100
    .line 101
    const-string v1, "keygrd_visible"

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 104
    .line 105
    .line 106
    :cond_7
    const-wide/16 v1, 0x200

    .line 107
    .line 108
    and-long/2addr v1, p0

    .line 109
    cmp-long v1, v1, v3

    .line 110
    .line 111
    if-eqz v1, :cond_8

    .line 112
    .line 113
    const-string v1, "keygrd_occluded"

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 116
    .line 117
    .line 118
    :cond_8
    const-wide/16 v1, 0x8

    .line 119
    .line 120
    and-long/2addr v1, p0

    .line 121
    cmp-long v1, v1, v3

    .line 122
    .line 123
    if-eqz v1, :cond_9

    .line 124
    .line 125
    const-string v1, "bouncer_visible"

    .line 126
    .line 127
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 128
    .line 129
    .line 130
    :cond_9
    const-wide/32 v1, 0x8000

    .line 131
    .line 132
    .line 133
    and-long/2addr v1, p0

    .line 134
    cmp-long v1, v1, v3

    .line 135
    .line 136
    if-eqz v1, :cond_a

    .line 137
    .line 138
    const-string v1, "dialog_showing"

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 141
    .line 142
    .line 143
    :cond_a
    const-wide/16 v1, 0x10

    .line 144
    .line 145
    and-long/2addr v1, p0

    .line 146
    cmp-long v1, v1, v3

    .line 147
    .line 148
    if-eqz v1, :cond_b

    .line 149
    .line 150
    const-string v1, "a11y_click"

    .line 151
    .line 152
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 153
    .line 154
    .line 155
    :cond_b
    const-wide/16 v1, 0x20

    .line 156
    .line 157
    and-long/2addr v1, p0

    .line 158
    cmp-long v1, v1, v3

    .line 159
    .line 160
    if-eqz v1, :cond_c

    .line 161
    .line 162
    const-string v1, "a11y_long_click"

    .line 163
    .line 164
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 165
    .line 166
    .line 167
    :cond_c
    const-wide/16 v1, 0x1000

    .line 168
    .line 169
    and-long/2addr v1, p0

    .line 170
    cmp-long v1, v1, v3

    .line 171
    .line 172
    if-eqz v1, :cond_d

    .line 173
    .line 174
    const-string v1, "disable_gesture_split_invocation"

    .line 175
    .line 176
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 177
    .line 178
    .line 179
    :cond_d
    const-wide/16 v1, 0x2000

    .line 180
    .line 181
    and-long/2addr v1, p0

    .line 182
    cmp-long v1, v1, v3

    .line 183
    .line 184
    if-eqz v1, :cond_e

    .line 185
    .line 186
    const-string v1, "asst_gesture_constrain"

    .line 187
    .line 188
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 189
    .line 190
    .line 191
    :cond_e
    const-wide/16 v1, 0x4000

    .line 192
    .line 193
    and-long/2addr v1, p0

    .line 194
    cmp-long v1, v1, v3

    .line 195
    .line 196
    if-eqz v1, :cond_f

    .line 197
    .line 198
    const-string v1, "bubbles_expanded"

    .line 199
    .line 200
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 201
    .line 202
    .line 203
    :cond_f
    const-wide/32 v1, 0x10000

    .line 204
    .line 205
    .line 206
    and-long/2addr v1, p0

    .line 207
    cmp-long v1, v1, v3

    .line 208
    .line 209
    if-eqz v1, :cond_10

    .line 210
    .line 211
    const-string v1, "one_handed_active"

    .line 212
    .line 213
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 214
    .line 215
    .line 216
    :cond_10
    const-wide/32 v1, 0x20000

    .line 217
    .line 218
    .line 219
    and-long/2addr v1, p0

    .line 220
    cmp-long v1, v1, v3

    .line 221
    .line 222
    if-eqz v1, :cond_11

    .line 223
    .line 224
    const-string v1, "allow_gesture"

    .line 225
    .line 226
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 227
    .line 228
    .line 229
    :cond_11
    const-wide/32 v1, 0x40000

    .line 230
    .line 231
    .line 232
    and-long/2addr v1, p0

    .line 233
    cmp-long v1, v1, v3

    .line 234
    .line 235
    if-eqz v1, :cond_12

    .line 236
    .line 237
    const-string v1, "ime_visible"

    .line 238
    .line 239
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 240
    .line 241
    .line 242
    :cond_12
    const-wide/32 v1, 0x80000

    .line 243
    .line 244
    .line 245
    and-long/2addr v1, p0

    .line 246
    cmp-long v1, v1, v3

    .line 247
    .line 248
    if-eqz v1, :cond_13

    .line 249
    .line 250
    const-string v1, "magnification_overlap"

    .line 251
    .line 252
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 253
    .line 254
    .line 255
    :cond_13
    const-wide/32 v1, 0x100000

    .line 256
    .line 257
    .line 258
    and-long/2addr v1, p0

    .line 259
    cmp-long v1, v1, v3

    .line 260
    .line 261
    if-eqz v1, :cond_14

    .line 262
    .line 263
    const-string v1, "ime_switcher_button_visible"

    .line 264
    .line 265
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 266
    .line 267
    .line 268
    :cond_14
    const-wide/32 v1, 0x200000

    .line 269
    .line 270
    .line 271
    and-long/2addr v1, p0

    .line 272
    cmp-long v1, v1, v3

    .line 273
    .line 274
    if-eqz v1, :cond_15

    .line 275
    .line 276
    const-string v1, "device_dozing"

    .line 277
    .line 278
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 279
    .line 280
    .line 281
    :cond_15
    const-wide/32 v1, 0x400000

    .line 282
    .line 283
    .line 284
    and-long/2addr v1, p0

    .line 285
    cmp-long v1, v1, v3

    .line 286
    .line 287
    if-eqz v1, :cond_16

    .line 288
    .line 289
    const-string v1, "back_disabled"

    .line 290
    .line 291
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 292
    .line 293
    .line 294
    :cond_16
    const-wide/32 v1, 0x800000

    .line 295
    .line 296
    .line 297
    and-long/2addr v1, p0

    .line 298
    cmp-long v1, v1, v3

    .line 299
    .line 300
    if-eqz v1, :cond_17

    .line 301
    .line 302
    const-string v1, "bubbles_mange_menu_expanded"

    .line 303
    .line 304
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 305
    .line 306
    .line 307
    :cond_17
    const-wide/32 v1, 0x2000000

    .line 308
    .line 309
    .line 310
    and-long/2addr v1, p0

    .line 311
    cmp-long v1, v1, v3

    .line 312
    .line 313
    if-eqz v1, :cond_18

    .line 314
    .line 315
    const-string v1, "vis_win_showing"

    .line 316
    .line 317
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 318
    .line 319
    .line 320
    :cond_18
    const-wide/32 v1, 0x4000000

    .line 321
    .line 322
    .line 323
    and-long/2addr v1, p0

    .line 324
    cmp-long v1, v1, v3

    .line 325
    .line 326
    if-eqz v1, :cond_19

    .line 327
    .line 328
    const-string v1, "freeform_active_in_desktop_mode"

    .line 329
    .line 330
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 331
    .line 332
    .line 333
    :cond_19
    const-wide/32 v1, 0x8000000

    .line 334
    .line 335
    .line 336
    and-long/2addr v1, p0

    .line 337
    cmp-long v1, v1, v3

    .line 338
    .line 339
    if-eqz v1, :cond_1a

    .line 340
    .line 341
    const-string v1, "device_dreaming"

    .line 342
    .line 343
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 344
    .line 345
    .line 346
    :cond_1a
    const-wide/32 v1, 0x20000000

    .line 347
    .line 348
    .line 349
    and-long/2addr v1, p0

    .line 350
    cmp-long v1, v1, v3

    .line 351
    .line 352
    if-eqz v1, :cond_1b

    .line 353
    .line 354
    const-string v1, "wakefulness_transition"

    .line 355
    .line 356
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 357
    .line 358
    .line 359
    :cond_1b
    const-wide/32 v1, 0x10000000

    .line 360
    .line 361
    .line 362
    and-long/2addr v1, p0

    .line 363
    cmp-long v1, v1, v3

    .line 364
    .line 365
    if-eqz v1, :cond_1c

    .line 366
    .line 367
    const-string v1, "awake"

    .line 368
    .line 369
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 370
    .line 371
    .line 372
    :cond_1c
    const-wide/32 v1, 0x40000000

    .line 373
    .line 374
    .line 375
    and-long/2addr v1, p0

    .line 376
    cmp-long v1, v1, v3

    .line 377
    .line 378
    if-eqz v1, :cond_1d

    .line 379
    .line 380
    const-string v1, "notif_visible"

    .line 381
    .line 382
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 383
    .line 384
    .line 385
    :cond_1d
    const-wide v1, 0x80000000L

    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    and-long/2addr v1, p0

    .line 391
    cmp-long v1, v1, v3

    .line 392
    .line 393
    if-eqz v1, :cond_1e

    .line 394
    .line 395
    const-string v1, "keygrd_going_away"

    .line 396
    .line 397
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 398
    .line 399
    .line 400
    :cond_1e
    const-wide v1, 0x100000000L

    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    and-long/2addr v1, p0

    .line 406
    cmp-long v1, v1, v3

    .line 407
    .line 408
    if-eqz v1, :cond_1f

    .line 409
    .line 410
    const-string v1, "shortcut_helper_showing"

    .line 411
    .line 412
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 413
    .line 414
    .line 415
    :cond_1f
    const-wide v1, 0x200000000L

    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    and-long/2addr v1, p0

    .line 421
    cmp-long v1, v1, v3

    .line 422
    .line 423
    if-eqz v1, :cond_20

    .line 424
    .line 425
    const-string v1, "touchpad_gestures_disabled"

    .line 426
    .line 427
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 428
    .line 429
    .line 430
    :cond_20
    const-wide v1, 0x400000000L

    .line 431
    .line 432
    .line 433
    .line 434
    .line 435
    and-long/2addr v1, p0

    .line 436
    cmp-long v1, v1, v3

    .line 437
    .line 438
    if-eqz v1, :cond_21

    .line 439
    .line 440
    const-string v1, "disable_gesture_pip_animating"

    .line 441
    .line 442
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 443
    .line 444
    .line 445
    :cond_21
    const-wide v1, 0x800000000L

    .line 446
    .line 447
    .line 448
    .line 449
    .line 450
    and-long/2addr v1, p0

    .line 451
    cmp-long v1, v1, v3

    .line 452
    .line 453
    if-eqz v1, :cond_22

    .line 454
    .line 455
    const-string v1, "communal_hub_showing"

    .line 456
    .line 457
    invoke-virtual {v0, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 458
    .line 459
    .line 460
    :cond_22
    const-wide v1, 0x1000000000L

    .line 461
    .line 462
    .line 463
    .line 464
    .line 465
    and-long/2addr p0, v1

    .line 466
    cmp-long p0, p0, v3

    .line 467
    .line 468
    if-eqz p0, :cond_23

    .line 469
    .line 470
    const-string p0, "back_dismiss_ime"

    .line 471
    .line 472
    invoke-virtual {v0, p0}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 473
    .line 474
    .line 475
    :cond_23
    invoke-virtual {v0}, Ljava/util/StringJoiner;->toString()Ljava/lang/String;

    .line 476
    .line 477
    .line 478
    move-result-object p0

    .line 479
    return-object p0
.end method

.method public static getWindowCornerRadius(Landroid/content/Context;)F
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/internal/policy/ScreenDecorationsUtils;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static isAssistantGestureDisabled(J)Z
    .locals 6

    .line 1
    const-wide/32 v0, 0x20000

    .line 2
    .line 3
    .line 4
    and-long/2addr v0, p0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-wide/16 v0, -0x3

    .line 12
    .line 13
    and-long/2addr p0, v0

    .line 14
    :cond_0
    const-wide/16 v0, 0xc0b

    .line 15
    .line 16
    and-long/2addr v0, p0

    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    return v1

    .line 23
    :cond_1
    const-wide/16 v4, 0x4

    .line 24
    .line 25
    and-long/2addr v4, p0

    .line 26
    cmp-long v0, v4, v2

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const-wide/16 v4, 0x40

    .line 31
    .line 32
    and-long/2addr p0, v4

    .line 33
    cmp-long p0, p0, v2

    .line 34
    .line 35
    if-nez p0, :cond_2

    .line 36
    .line 37
    return v1

    .line 38
    :cond_2
    const/4 p0, 0x0

    .line 39
    return p0
.end method

.method public static isBackGestureDisabled(JZ)Z
    .locals 7

    .line 1
    const-wide/16 v0, 0x8

    .line 2
    .line 3
    and-long/2addr v0, p0

    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v0, v0, v2

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-nez v0, :cond_4

    .line 10
    .line 11
    const-wide/32 v4, 0x8000

    .line 12
    .line 13
    .line 14
    and-long/2addr v4, p0

    .line 15
    cmp-long v0, v4, v2

    .line 16
    .line 17
    if-nez v0, :cond_4

    .line 18
    .line 19
    const-wide/32 v4, 0x2000000

    .line 20
    .line 21
    .line 22
    and-long/2addr v4, p0

    .line 23
    cmp-long v0, v4, v2

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const-wide v4, 0x800000000L

    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    and-long/2addr v4, p0

    .line 34
    cmp-long v0, v4, v2

    .line 35
    .line 36
    const/4 v4, 0x1

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    const-wide/16 v5, 0x800

    .line 40
    .line 41
    and-long/2addr p0, v5

    .line 42
    cmp-long p0, p0, v2

    .line 43
    .line 44
    if-nez p0, :cond_1

    .line 45
    .line 46
    return v4

    .line 47
    :cond_1
    return v1

    .line 48
    :cond_2
    const-wide/32 v5, 0x20000

    .line 49
    .line 50
    .line 51
    and-long/2addr v5, p0

    .line 52
    cmp-long v0, v5, v2

    .line 53
    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    const-wide/16 v5, -0x3

    .line 57
    .line 58
    and-long/2addr p0, v5

    .line 59
    :cond_3
    invoke-static {p2}, Lcom/android/systemui/shared/system/QuickStepContract;->getBackGestureDisabledMask(Z)J

    .line 60
    .line 61
    .line 62
    move-result-wide v5

    .line 63
    and-long/2addr p0, v5

    .line 64
    cmp-long p0, p0, v2

    .line 65
    .line 66
    if-eqz p0, :cond_4

    .line 67
    .line 68
    return v4

    .line 69
    :cond_4
    :goto_0
    return v1
.end method

.method public static isGesturalMode(I)Z
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p0, v0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public static isLegacyMode(I)Z
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public static isSwipeUpMode(I)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, v0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public static supportsRoundedCornersOnWindows(Landroid/content/res/Resources;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/internal/policy/ScreenDecorationsUtils;->supportsRoundedCornersOnWindows(Landroid/content/res/Resources;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
