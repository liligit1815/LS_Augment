.class public abstract Lcom/android/systemui/shared/recents/ILauncherProxy$Stub;
.super Landroid/os/Binder;
.source "ILauncherProxy.java"

# interfaces
.implements Lcom/android/systemui/shared/recents/ILauncherProxy;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/shared/recents/ILauncherProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/shared/recents/ILauncherProxy$Stub$Proxy;
    }
.end annotation


# static fields
.field static final TRANSACTION_appTransitionPending:I = 0x23

.field static final TRANSACTION_checkNavBarModes:I = 0x1f

.field static final TRANSACTION_disable:I = 0x14

.field static final TRANSACTION_enterStageSplitFromRunningApp:I = 0x1a

.field static final TRANSACTION_finishBarAnimations:I = 0x20

.field static final TRANSACTION_onActiveNavBarRegionChanges:I = 0xc

.field static final TRANSACTION_onAssistantAvailable:I = 0xe

.field static final TRANSACTION_onAssistantOverrideInvoked:I = 0x1d

.field static final TRANSACTION_onAssistantVisibilityChanged:I = 0xf

.field static final TRANSACTION_onDisplayAddSystemDecorations:I = 0x25

.field static final TRANSACTION_onDisplayRemoveSystemDecorations:I = 0x27

.field static final TRANSACTION_onDisplayRemoved:I = 0x26

.field static final TRANSACTION_onInitialize:I = 0xd

.field static final TRANSACTION_onNavButtonsDarkIntensityChanged:I = 0x17

.field static final TRANSACTION_onNavigationBarLumaSamplingEnabled:I = 0x18

.field static final TRANSACTION_onNotificationEventUp:I = 0x28

.field static final TRANSACTION_onOverviewHidden:I = 0x9

.field static final TRANSACTION_onOverviewShown:I = 0x8

.field static final TRANSACTION_onOverviewToggle:I = 0x7

.field static final TRANSACTION_onRotationProposal:I = 0x13

.field static final TRANSACTION_onStatusBarVisibleChanged:I = 0x29

.field static final TRANSACTION_onSystemBarAttributesChanged:I = 0x15

.field static final TRANSACTION_onSystemUiStateChanged:I = 0x11

.field static final TRANSACTION_onTaskbarToggled:I = 0x1c

.field static final TRANSACTION_onTransitionModeUpdated:I = 0x16

.field static final TRANSACTION_onUnbind:I = 0x24

.field static final TRANSACTION_touchAutoDim:I = 0x21

.field static final TRANSACTION_transitionTo:I = 0x22

.field static final TRANSACTION_updateWallpaperVisibility:I = 0x1e


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "com.android.systemui.shared.recents.ILauncherProxy"

    .line 5
    .line 6
    invoke-virtual {p0, p0, v0}, Landroid/os/Binder;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/android/systemui/shared/recents/ILauncherProxy;
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
    const-string v0, "com.android.systemui.shared.recents.ILauncherProxy"

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
    instance-of v1, v0, Lcom/android/systemui/shared/recents/ILauncherProxy;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    check-cast v0, Lcom/android/systemui/shared/recents/ILauncherProxy;

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_1
    new-instance v0, Lcom/android/systemui/shared/recents/ILauncherProxy$Stub$Proxy;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Lcom/android/systemui/shared/recents/ILauncherProxy$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

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
    const-string v0, "com.android.systemui.shared.recents.ILauncherProxy"

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
    const/4 v0, 0x0

    .line 24
    packed-switch p1, :pswitch_data_0

    .line 25
    .line 26
    .line 27
    :pswitch_0
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :pswitch_1
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_2

    .line 37
    .line 38
    move v0, v1

    .line 39
    :cond_2
    invoke-interface {p0, v0}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onStatusBarVisibleChanged(Z)V

    .line 40
    .line 41
    .line 42
    goto/16 :goto_2

    .line 43
    .line 44
    :pswitch_2
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onNotificationEventUp()V

    .line 45
    .line 46
    .line 47
    goto/16 :goto_2

    .line 48
    .line 49
    :pswitch_3
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onDisplayRemoveSystemDecorations(I)V

    .line 54
    .line 55
    .line 56
    goto/16 :goto_2

    .line 57
    .line 58
    :pswitch_4
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onDisplayRemoved(I)V

    .line 63
    .line 64
    .line 65
    goto/16 :goto_2

    .line 66
    .line 67
    :pswitch_5
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onDisplayAddSystemDecorations(I)V

    .line 72
    .line 73
    .line 74
    goto/16 :goto_2

    .line 75
    .line 76
    :pswitch_6
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {p1}, Landroid/os/IRemoteCallback$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/IRemoteCallback;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onUnbind(Landroid/os/IRemoteCallback;)V

    .line 85
    .line 86
    .line 87
    goto/16 :goto_2

    .line 88
    .line 89
    :pswitch_7
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-eqz p1, :cond_3

    .line 94
    .line 95
    move v0, v1

    .line 96
    :cond_3
    invoke-interface {p0, v0}, Lcom/android/systemui/shared/recents/ILauncherProxy;->appTransitionPending(Z)V

    .line 97
    .line 98
    .line 99
    goto/16 :goto_2

    .line 100
    .line 101
    :pswitch_8
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 106
    .line 107
    .line 108
    move-result p3

    .line 109
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    if-eqz p2, :cond_4

    .line 114
    .line 115
    move v0, v1

    .line 116
    :cond_4
    invoke-interface {p0, p1, p3, v0}, Lcom/android/systemui/shared/recents/ILauncherProxy;->transitionTo(IIZ)V

    .line 117
    .line 118
    .line 119
    goto/16 :goto_2

    .line 120
    .line 121
    :pswitch_9
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    if-eqz p2, :cond_5

    .line 130
    .line 131
    move v0, v1

    .line 132
    :cond_5
    invoke-interface {p0, p1, v0}, Lcom/android/systemui/shared/recents/ILauncherProxy;->touchAutoDim(IZ)V

    .line 133
    .line 134
    .line 135
    goto/16 :goto_2

    .line 136
    .line 137
    :pswitch_a
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ILauncherProxy;->finishBarAnimations(I)V

    .line 142
    .line 143
    .line 144
    goto/16 :goto_2

    .line 145
    .line 146
    :pswitch_b
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ILauncherProxy;->checkNavBarModes(I)V

    .line 151
    .line 152
    .line 153
    goto/16 :goto_2

    .line 154
    .line 155
    :pswitch_c
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 160
    .line 161
    .line 162
    move-result p2

    .line 163
    if-eqz p2, :cond_6

    .line 164
    .line 165
    move v0, v1

    .line 166
    :cond_6
    invoke-interface {p0, p1, v0}, Lcom/android/systemui/shared/recents/ILauncherProxy;->updateWallpaperVisibility(IZ)V

    .line 167
    .line 168
    .line 169
    goto/16 :goto_2

    .line 170
    .line 171
    :pswitch_d
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onAssistantOverrideInvoked(I)V

    .line 176
    .line 177
    .line 178
    goto/16 :goto_2

    .line 179
    .line 180
    :pswitch_e
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onTaskbarToggled()V

    .line 181
    .line 182
    .line 183
    goto/16 :goto_2

    .line 184
    .line 185
    :pswitch_f
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    if-eqz p1, :cond_7

    .line 190
    .line 191
    move v0, v1

    .line 192
    :cond_7
    invoke-interface {p0, v0}, Lcom/android/systemui/shared/recents/ILauncherProxy;->enterStageSplitFromRunningApp(Z)V

    .line 193
    .line 194
    .line 195
    goto/16 :goto_2

    .line 196
    .line 197
    :pswitch_10
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 198
    .line 199
    .line 200
    move-result p1

    .line 201
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 202
    .line 203
    .line 204
    move-result p2

    .line 205
    if-eqz p2, :cond_8

    .line 206
    .line 207
    move v0, v1

    .line 208
    :cond_8
    invoke-interface {p0, p1, v0}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onNavigationBarLumaSamplingEnabled(IZ)V

    .line 209
    .line 210
    .line 211
    goto/16 :goto_2

    .line 212
    .line 213
    :pswitch_11
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    .line 214
    .line 215
    .line 216
    move-result p1

    .line 217
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onNavButtonsDarkIntensityChanged(F)V

    .line 218
    .line 219
    .line 220
    goto/16 :goto_2

    .line 221
    .line 222
    :pswitch_12
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 223
    .line 224
    .line 225
    move-result p1

    .line 226
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 227
    .line 228
    .line 229
    move-result p2

    .line 230
    if-eqz p2, :cond_9

    .line 231
    .line 232
    move v0, v1

    .line 233
    :cond_9
    invoke-interface {p0, p1, v0}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onTransitionModeUpdated(IZ)V

    .line 234
    .line 235
    .line 236
    goto/16 :goto_2

    .line 237
    .line 238
    :pswitch_13
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 239
    .line 240
    .line 241
    move-result p1

    .line 242
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 243
    .line 244
    .line 245
    move-result p2

    .line 246
    invoke-interface {p0, p1, p2}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onSystemBarAttributesChanged(II)V

    .line 247
    .line 248
    .line 249
    goto/16 :goto_2

    .line 250
    .line 251
    :pswitch_14
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 252
    .line 253
    .line 254
    move-result p1

    .line 255
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 256
    .line 257
    .line 258
    move-result p3

    .line 259
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 260
    .line 261
    .line 262
    move-result p4

    .line 263
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 264
    .line 265
    .line 266
    move-result p2

    .line 267
    if-eqz p2, :cond_a

    .line 268
    .line 269
    move v0, v1

    .line 270
    :cond_a
    invoke-interface {p0, p1, p3, p4, v0}, Lcom/android/systemui/shared/recents/ILauncherProxy;->disable(IIIZ)V

    .line 271
    .line 272
    .line 273
    goto/16 :goto_2

    .line 274
    .line 275
    :pswitch_15
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 276
    .line 277
    .line 278
    move-result p1

    .line 279
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 280
    .line 281
    .line 282
    move-result p2

    .line 283
    if-eqz p2, :cond_b

    .line 284
    .line 285
    move v0, v1

    .line 286
    :cond_b
    invoke-interface {p0, p1, v0}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onRotationProposal(IZ)V

    .line 287
    .line 288
    .line 289
    goto/16 :goto_2

    .line 290
    .line 291
    :pswitch_16
    invoke-virtual {p2}, Landroid/os/Parcel;->readLong()J

    .line 292
    .line 293
    .line 294
    move-result-wide p3

    .line 295
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 296
    .line 297
    .line 298
    move-result p1

    .line 299
    invoke-interface {p0, p3, p4, p1}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onSystemUiStateChanged(JI)V

    .line 300
    .line 301
    .line 302
    goto :goto_2

    .line 303
    :pswitch_17
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    .line 304
    .line 305
    .line 306
    move-result p1

    .line 307
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onAssistantVisibilityChanged(F)V

    .line 308
    .line 309
    .line 310
    goto :goto_2

    .line 311
    :pswitch_18
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 312
    .line 313
    .line 314
    move-result p1

    .line 315
    if-eqz p1, :cond_c

    .line 316
    .line 317
    move p1, v1

    .line 318
    goto :goto_0

    .line 319
    :cond_c
    move p1, v0

    .line 320
    :goto_0
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 321
    .line 322
    .line 323
    move-result p2

    .line 324
    if-eqz p2, :cond_d

    .line 325
    .line 326
    move v0, v1

    .line 327
    :cond_d
    invoke-interface {p0, p1, v0}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onAssistantAvailable(ZZ)V

    .line 328
    .line 329
    .line 330
    goto :goto_2

    .line 331
    :pswitch_19
    sget-object p1, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 332
    .line 333
    invoke-static {p2, p1}, Lcom/android/systemui/shared/recents/ILauncherProxy$_Parcel;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 334
    .line 335
    .line 336
    move-result-object p1

    .line 337
    check-cast p1, Landroid/os/Bundle;

    .line 338
    .line 339
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onInitialize(Landroid/os/Bundle;)V

    .line 340
    .line 341
    .line 342
    goto :goto_2

    .line 343
    :pswitch_1a
    sget-object p1, Landroid/graphics/Region;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 344
    .line 345
    invoke-static {p2, p1}, Lcom/android/systemui/shared/recents/ILauncherProxy$_Parcel;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 346
    .line 347
    .line 348
    move-result-object p1

    .line 349
    check-cast p1, Landroid/graphics/Region;

    .line 350
    .line 351
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onActiveNavBarRegionChanges(Landroid/graphics/Region;)V

    .line 352
    .line 353
    .line 354
    goto :goto_2

    .line 355
    :pswitch_1b
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 356
    .line 357
    .line 358
    move-result p1

    .line 359
    if-eqz p1, :cond_e

    .line 360
    .line 361
    move p1, v1

    .line 362
    goto :goto_1

    .line 363
    :cond_e
    move p1, v0

    .line 364
    :goto_1
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 365
    .line 366
    .line 367
    move-result p2

    .line 368
    if-eqz p2, :cond_f

    .line 369
    .line 370
    move v0, v1

    .line 371
    :cond_f
    invoke-interface {p0, p1, v0}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onOverviewHidden(ZZ)V

    .line 372
    .line 373
    .line 374
    goto :goto_2

    .line 375
    :pswitch_1c
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 376
    .line 377
    .line 378
    move-result p1

    .line 379
    if-eqz p1, :cond_10

    .line 380
    .line 381
    move v0, v1

    .line 382
    :cond_10
    invoke-interface {p0, v0}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onOverviewShown(Z)V

    .line 383
    .line 384
    .line 385
    goto :goto_2

    .line 386
    :pswitch_1d
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ILauncherProxy;->onOverviewToggle()V

    .line 387
    .line 388
    .line 389
    :goto_2
    return v1

    .line 390
    nop

    .line 391
    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_0
        :pswitch_0
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_0
        :pswitch_16
        :pswitch_0
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_0
        :pswitch_f
        :pswitch_0
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
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
    .end packed-switch
.end method
