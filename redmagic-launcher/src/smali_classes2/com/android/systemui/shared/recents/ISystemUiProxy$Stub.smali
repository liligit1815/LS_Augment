.class public abstract Lcom/android/systemui/shared/recents/ISystemUiProxy$Stub;
.super Landroid/os/Binder;
.source "ISystemUiProxy.java"

# interfaces
.implements Lcom/android/systemui/shared/recents/ISystemUiProxy;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/shared/recents/ISystemUiProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/shared/recents/ISystemUiProxy$Stub$Proxy;
    }
.end annotation


# static fields
.field static final TRANSACTION_animateNavBarLongPress:I = 0x37

.field static final TRANSACTION_expandNotificationPanel:I = 0x1e

.field static final TRANSACTION_notifyAccessibilityButtonClicked:I = 0x10

.field static final TRANSACTION_notifyAccessibilityButtonLongClicked:I = 0x11

.field static final TRANSACTION_notifyGestureCourseIndentifiedCompleted:I = 0x43

.field static final TRANSACTION_notifyHomeGestureAnimationFinished:I = 0x42

.field static final TRANSACTION_notifyHomeGestureSuccess:I = 0x41

.field static final TRANSACTION_notifyInjectAllEvent:I = 0x45

.field static final TRANSACTION_notifyInjectEvent:I = 0x46

.field static final TRANSACTION_notifyKeyEvent:I = 0x47

.field static final TRANSACTION_notifyPrioritizedRotation:I = 0x1a

.field static final TRANSACTION_notifyTaskbarAutohideSuspend:I = 0x31

.field static final TRANSACTION_notifyTaskbarStatus:I = 0x30

.field static final TRANSACTION_onAssistantGestureCompletion:I = 0x13

.field static final TRANSACTION_onAssistantGestureStart:I = 0x3f

.field static final TRANSACTION_onAssistantProgress:I = 0xd

.field static final TRANSACTION_onBackEvent:I = 0x2d

.field static final TRANSACTION_onGestureCourseIndentifiedCompleted:I = 0x40

.field static final TRANSACTION_onGestureCourseProgress:I = 0x44

.field static final TRANSACTION_onImeSwitcherLongPress:I = 0x3a

.field static final TRANSACTION_onImeSwitcherPressed:I = 0x32

.field static final TRANSACTION_onKeyEvent:I = 0x3d

.field static final TRANSACTION_onLauncherDestroy:I = 0x3e

.field static final TRANSACTION_onOverviewShown:I = 0x7

.field static final TRANSACTION_onStatusBarTouchEvent:I = 0xa

.field static final TRANSACTION_onStatusBarTrackpadEvent:I = 0x35

.field static final TRANSACTION_setAssistantOverridesRequested:I = 0x36

.field static final TRANSACTION_setHomeRotationEnabled:I = 0x2e

.field static final TRANSACTION_setOverrideHomeButtonLongPress:I = 0x38

.field static final TRANSACTION_startAssistant:I = 0xe

.field static final TRANSACTION_startScreenPinning:I = 0x2

.field static final TRANSACTION_stopScreenPinning:I = 0x12

.field static final TRANSACTION_takeScreenshot:I = 0x34

.field static final TRANSACTION_toggleNotificationPanel:I = 0x33

.field static final TRANSACTION_toggleQuickSettingsPanel:I = 0x39

.field static final TRANSACTION_updateContextualEduStats:I = 0x3b


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "com.android.systemui.shared.recents.ISystemUiProxy"

    .line 5
    .line 6
    invoke-virtual {p0, p0, v0}, Landroid/os/Binder;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/android/systemui/shared/recents/ISystemUiProxy;
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    const-string v0, "com.android.systemui.shared.recents.ISystemUiProxy"

    .line 6
    .line 7
    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    instance-of v1, v0, Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    check-cast v0, Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_1
    new-instance v0, Lcom/android/systemui/shared/recents/ISystemUiProxy$Stub$Proxy;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Lcom/android/systemui/shared/recents/ISystemUiProxy$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .line 1
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const-string v0, "com.android.systemui.shared.recents.ISystemUiProxy"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-lt p1, v1, :cond_0

    .line 5
    .line 6
    const v2, 0xffffff

    .line 7
    .line 8
    .line 9
    if-gt p1, v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    const v2, 0x5f4e5446

    .line 15
    .line 16
    .line 17
    if-ne p1, v2, :cond_1

    .line 18
    .line 19
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return v1

    .line 23
    :cond_1
    const/4 v0, 0x2

    .line 24
    if-eq p1, v0, :cond_13

    .line 25
    .line 26
    const/4 v0, 0x7

    .line 27
    const/4 v2, 0x0

    .line 28
    if-eq p1, v0, :cond_11

    .line 29
    .line 30
    const/16 v0, 0xa

    .line 31
    .line 32
    if-eq p1, v0, :cond_10

    .line 33
    .line 34
    const/16 v0, 0x1a

    .line 35
    .line 36
    if-eq p1, v0, :cond_f

    .line 37
    .line 38
    const/16 v0, 0x1e

    .line 39
    .line 40
    if-eq p1, v0, :cond_e

    .line 41
    .line 42
    const/16 v0, 0xd

    .line 43
    .line 44
    if-eq p1, v0, :cond_d

    .line 45
    .line 46
    const/16 v0, 0xe

    .line 47
    .line 48
    if-eq p1, v0, :cond_c

    .line 49
    .line 50
    const/16 v0, 0x2d

    .line 51
    .line 52
    if-eq p1, v0, :cond_b

    .line 53
    .line 54
    const/16 v0, 0x2e

    .line 55
    .line 56
    if-eq p1, v0, :cond_9

    .line 57
    .line 58
    packed-switch p1, :pswitch_data_0

    .line 59
    .line 60
    .line 61
    packed-switch p1, :pswitch_data_1

    .line 62
    .line 63
    .line 64
    packed-switch p1, :pswitch_data_2

    .line 65
    .line 66
    .line 67
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    return p0

    .line 72
    :pswitch_0
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->notifyKeyEvent(I)V

    .line 77
    .line 78
    .line 79
    goto/16 :goto_2

    .line 80
    .line 81
    :pswitch_1
    sget-object p1, Landroid/view/MotionEvent;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 82
    .line 83
    invoke-static {p2, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy$_Parcel;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p3

    .line 87
    check-cast p3, Landroid/view/MotionEvent;

    .line 88
    .line 89
    invoke-static {p2, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy$_Parcel;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    check-cast p1, Landroid/view/MotionEvent;

    .line 94
    .line 95
    invoke-interface {p0, p3, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->notifyInjectEvent(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)V

    .line 96
    .line 97
    .line 98
    goto/16 :goto_2

    .line 99
    .line 100
    :pswitch_2
    sget-object p1, Landroid/view/MotionEvent;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 101
    .line 102
    invoke-static {p2, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy$_Parcel;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object p3

    .line 106
    check-cast p3, Landroid/view/MotionEvent;

    .line 107
    .line 108
    invoke-static {p2, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy$_Parcel;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p4

    .line 112
    check-cast p4, Landroid/view/MotionEvent;

    .line 113
    .line 114
    invoke-virtual {p2, p1}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-interface {p0, p3, p4, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->notifyInjectAllEvent(Landroid/view/MotionEvent;Landroid/view/MotionEvent;Ljava/util/List;)V

    .line 119
    .line 120
    .line 121
    goto/16 :goto_2

    .line 122
    .line 123
    :pswitch_3
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onGestureCourseProgress(F)V

    .line 128
    .line 129
    .line 130
    goto/16 :goto_2

    .line 131
    .line 132
    :pswitch_4
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->notifyGestureCourseIndentifiedCompleted(I)V

    .line 137
    .line 138
    .line 139
    goto/16 :goto_2

    .line 140
    .line 141
    :pswitch_5
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->notifyHomeGestureAnimationFinished()V

    .line 142
    .line 143
    .line 144
    goto/16 :goto_2

    .line 145
    .line 146
    :pswitch_6
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->notifyHomeGestureSuccess()V

    .line 147
    .line 148
    .line 149
    goto/16 :goto_2

    .line 150
    .line 151
    :pswitch_7
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onGestureCourseIndentifiedCompleted(I)V

    .line 156
    .line 157
    .line 158
    goto/16 :goto_2

    .line 159
    .line 160
    :pswitch_8
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    .line 165
    .line 166
    .line 167
    move-result p2

    .line 168
    invoke-interface {p0, p1, p2}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onAssistantGestureStart(FF)V

    .line 169
    .line 170
    .line 171
    goto/16 :goto_2

    .line 172
    .line 173
    :pswitch_9
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onLauncherDestroy()V

    .line 174
    .line 175
    .line 176
    goto/16 :goto_2

    .line 177
    .line 178
    :pswitch_a
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 183
    .line 184
    .line 185
    move-result p2

    .line 186
    invoke-interface {p0, p1, p2}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onKeyEvent(II)V

    .line 187
    .line 188
    .line 189
    goto/16 :goto_2

    .line 190
    .line 191
    :pswitch_b
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    if-eqz p1, :cond_2

    .line 196
    .line 197
    move v2, v1

    .line 198
    :cond_2
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-interface {p0, v2, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->updateContextualEduStats(ZLjava/lang/String;)V

    .line 203
    .line 204
    .line 205
    goto/16 :goto_2

    .line 206
    .line 207
    :pswitch_c
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onImeSwitcherLongPress()V

    .line 208
    .line 209
    .line 210
    goto/16 :goto_2

    .line 211
    .line 212
    :pswitch_d
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->toggleQuickSettingsPanel()V

    .line 213
    .line 214
    .line 215
    goto/16 :goto_2

    .line 216
    .line 217
    :pswitch_e
    invoke-virtual {p2}, Landroid/os/Parcel;->readLong()J

    .line 218
    .line 219
    .line 220
    move-result-wide p3

    .line 221
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    .line 222
    .line 223
    .line 224
    move-result p1

    .line 225
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 226
    .line 227
    .line 228
    move-result p2

    .line 229
    if-eqz p2, :cond_3

    .line 230
    .line 231
    move v2, v1

    .line 232
    :cond_3
    invoke-interface {p0, p3, p4, p1, v2}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->setOverrideHomeButtonLongPress(JFZ)V

    .line 233
    .line 234
    .line 235
    goto/16 :goto_2

    .line 236
    .line 237
    :pswitch_f
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 238
    .line 239
    .line 240
    move-result p1

    .line 241
    if-eqz p1, :cond_4

    .line 242
    .line 243
    move p1, v1

    .line 244
    goto :goto_0

    .line 245
    :cond_4
    move p1, v2

    .line 246
    :goto_0
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 247
    .line 248
    .line 249
    move-result p3

    .line 250
    if-eqz p3, :cond_5

    .line 251
    .line 252
    move v2, v1

    .line 253
    :cond_5
    invoke-virtual {p2}, Landroid/os/Parcel;->readLong()J

    .line 254
    .line 255
    .line 256
    move-result-wide p2

    .line 257
    invoke-interface {p0, p1, v2, p2, p3}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->animateNavBarLongPress(ZZJ)V

    .line 258
    .line 259
    .line 260
    goto/16 :goto_2

    .line 261
    .line 262
    :pswitch_10
    invoke-virtual {p2}, Landroid/os/Parcel;->createIntArray()[I

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->setAssistantOverridesRequested([I)V

    .line 267
    .line 268
    .line 269
    goto/16 :goto_2

    .line 270
    .line 271
    :pswitch_11
    sget-object p1, Landroid/view/MotionEvent;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 272
    .line 273
    invoke-static {p2, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy$_Parcel;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 274
    .line 275
    .line 276
    move-result-object p1

    .line 277
    check-cast p1, Landroid/view/MotionEvent;

    .line 278
    .line 279
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onStatusBarTrackpadEvent(Landroid/view/MotionEvent;)V

    .line 280
    .line 281
    .line 282
    goto/16 :goto_2

    .line 283
    .line 284
    :pswitch_12
    sget-object p1, Lcom/android/internal/util/ScreenshotRequest;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 285
    .line 286
    invoke-static {p2, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy$_Parcel;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object p1

    .line 290
    check-cast p1, Lcom/android/internal/util/ScreenshotRequest;

    .line 291
    .line 292
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->takeScreenshot(Lcom/android/internal/util/ScreenshotRequest;)V

    .line 293
    .line 294
    .line 295
    goto/16 :goto_2

    .line 296
    .line 297
    :pswitch_13
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->toggleNotificationPanel()V

    .line 298
    .line 299
    .line 300
    goto/16 :goto_2

    .line 301
    .line 302
    :pswitch_14
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onImeSwitcherPressed()V

    .line 303
    .line 304
    .line 305
    goto/16 :goto_2

    .line 306
    .line 307
    :pswitch_15
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 308
    .line 309
    .line 310
    move-result p1

    .line 311
    if-eqz p1, :cond_6

    .line 312
    .line 313
    move v2, v1

    .line 314
    :cond_6
    invoke-interface {p0, v2}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->notifyTaskbarAutohideSuspend(Z)V

    .line 315
    .line 316
    .line 317
    goto/16 :goto_2

    .line 318
    .line 319
    :pswitch_16
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 320
    .line 321
    .line 322
    move-result p1

    .line 323
    if-eqz p1, :cond_7

    .line 324
    .line 325
    move p1, v1

    .line 326
    goto :goto_1

    .line 327
    :cond_7
    move p1, v2

    .line 328
    :goto_1
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 329
    .line 330
    .line 331
    move-result p2

    .line 332
    if-eqz p2, :cond_8

    .line 333
    .line 334
    move v2, v1

    .line 335
    :cond_8
    invoke-interface {p0, p1, v2}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->notifyTaskbarStatus(ZZ)V

    .line 336
    .line 337
    .line 338
    goto/16 :goto_2

    .line 339
    .line 340
    :pswitch_17
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    .line 341
    .line 342
    .line 343
    move-result p1

    .line 344
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onAssistantGestureCompletion(F)V

    .line 345
    .line 346
    .line 347
    goto/16 :goto_2

    .line 348
    .line 349
    :pswitch_18
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->stopScreenPinning()V

    .line 350
    .line 351
    .line 352
    goto/16 :goto_2

    .line 353
    .line 354
    :pswitch_19
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->notifyAccessibilityButtonLongClicked()V

    .line 355
    .line 356
    .line 357
    goto :goto_2

    .line 358
    :pswitch_1a
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 359
    .line 360
    .line 361
    move-result p1

    .line 362
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->notifyAccessibilityButtonClicked(I)V

    .line 363
    .line 364
    .line 365
    goto :goto_2

    .line 366
    :cond_9
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 367
    .line 368
    .line 369
    move-result p1

    .line 370
    if-eqz p1, :cond_a

    .line 371
    .line 372
    move v2, v1

    .line 373
    :cond_a
    invoke-interface {p0, v2}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->setHomeRotationEnabled(Z)V

    .line 374
    .line 375
    .line 376
    goto :goto_2

    .line 377
    :cond_b
    sget-object p1, Landroid/view/KeyEvent;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 378
    .line 379
    invoke-static {p2, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy$_Parcel;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 380
    .line 381
    .line 382
    move-result-object p1

    .line 383
    check-cast p1, Landroid/view/KeyEvent;

    .line 384
    .line 385
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 386
    .line 387
    .line 388
    move-result p2

    .line 389
    invoke-interface {p0, p1, p2}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onBackEvent(Landroid/view/KeyEvent;I)V

    .line 390
    .line 391
    .line 392
    goto :goto_2

    .line 393
    :cond_c
    sget-object p1, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 394
    .line 395
    invoke-static {p2, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy$_Parcel;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 396
    .line 397
    .line 398
    move-result-object p1

    .line 399
    check-cast p1, Landroid/os/Bundle;

    .line 400
    .line 401
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->startAssistant(Landroid/os/Bundle;)V

    .line 402
    .line 403
    .line 404
    goto :goto_2

    .line 405
    :cond_d
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    .line 406
    .line 407
    .line 408
    move-result p1

    .line 409
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onAssistantProgress(F)V

    .line 410
    .line 411
    .line 412
    goto :goto_2

    .line 413
    :cond_e
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->expandNotificationPanel()V

    .line 414
    .line 415
    .line 416
    goto :goto_2

    .line 417
    :cond_f
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 418
    .line 419
    .line 420
    move-result p1

    .line 421
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->notifyPrioritizedRotation(I)V

    .line 422
    .line 423
    .line 424
    goto :goto_2

    .line 425
    :cond_10
    sget-object p1, Landroid/view/MotionEvent;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 426
    .line 427
    invoke-static {p2, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy$_Parcel;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 428
    .line 429
    .line 430
    move-result-object p1

    .line 431
    check-cast p1, Landroid/view/MotionEvent;

    .line 432
    .line 433
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onStatusBarTouchEvent(Landroid/view/MotionEvent;)V

    .line 434
    .line 435
    .line 436
    goto :goto_2

    .line 437
    :cond_11
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 438
    .line 439
    .line 440
    move-result p1

    .line 441
    if-eqz p1, :cond_12

    .line 442
    .line 443
    move v2, v1

    .line 444
    :cond_12
    invoke-interface {p0, v2}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onOverviewShown(Z)V

    .line 445
    .line 446
    .line 447
    goto :goto_2

    .line 448
    :cond_13
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 449
    .line 450
    .line 451
    move-result p1

    .line 452
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->startScreenPinning(I)V

    .line 453
    .line 454
    .line 455
    :goto_2
    return v1

    .line 456
    nop

    .line 457
    :pswitch_data_0
    .packed-switch 0x10
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
    .end packed-switch

    .line 458
    .line 459
    .line 460
    .line 461
    .line 462
    .line 463
    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    :pswitch_data_1
    .packed-switch 0x30
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
    .end packed-switch

    .line 470
    .line 471
    .line 472
    .line 473
    .line 474
    .line 475
    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
    .line 482
    .line 483
    .line 484
    .line 485
    .line 486
    .line 487
    .line 488
    .line 489
    .line 490
    .line 491
    .line 492
    .line 493
    .line 494
    .line 495
    .line 496
    .line 497
    :pswitch_data_2
    .packed-switch 0x3d
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
