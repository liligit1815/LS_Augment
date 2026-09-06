.class public abstract Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService$Stub;
.super Landroid/os/Binder;
.source "IDigitalHumanService.java"

# interfaces
.implements Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService$Stub$Proxy;
    }
.end annotation


# static fields
.field static final TRANSACTION_getAvatarHeight:I = 0x14

.field static final TRANSACTION_getAvatarLayoutParams:I = 0x15

.field static final TRANSACTION_getAvatarWidth:I = 0x13

.field static final TRANSACTION_getHumanScaleV2:I = 0x19

.field static final TRANSACTION_getScene:I = 0x7

.field static final TRANSACTION_isHumanInited:I = 0x3

.field static final TRANSACTION_isHumanRendered:I = 0x5

.field static final TRANSACTION_onSurfaceChanged:I = 0x9

.field static final TRANSACTION_onSurfaceCreated:I = 0x8

.field static final TRANSACTION_onSurfaceDestroyed:I = 0xa

.field static final TRANSACTION_onTouchEvent:I = 0xb

.field static final TRANSACTION_pauseMotion:I = 0xe

.field static final TRANSACTION_registerCallback:I = 0x1

.field static final TRANSACTION_resumeMotion:I = 0xd

.field static final TRANSACTION_setHumanRendered:I = 0x4

.field static final TRANSACTION_setHumanRotation:I = 0x12

.field static final TRANSACTION_setHumanScale:I = 0x17

.field static final TRANSACTION_setHumanScaleV2:I = 0x18

.field static final TRANSACTION_setSDKVersionCode:I = 0x16

.field static final TRANSACTION_startMotion:I = 0xc

.field static final TRANSACTION_startSpeak:I = 0x10

.field static final TRANSACTION_stopMotion:I = 0xf

.field static final TRANSACTION_stopSpeak:I = 0x11

.field static final TRANSACTION_switchScene:I = 0x6

.field static final TRANSACTION_unregisterCallback:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "cn.nubia.redmagickyi.digitalhuman.IDigitalHumanService"

    .line 5
    .line 6
    invoke-virtual {p0, p0, v0}, Landroid/os/Binder;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;
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
    const-string v0, "cn.nubia.redmagickyi.digitalhuman.IDigitalHumanService"

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
    instance-of v1, v0, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    check-cast v0, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_1
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService$Stub$Proxy;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

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
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const-string v0, "cn.nubia.redmagickyi.digitalhuman.IDigitalHumanService"

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
    if-eq p1, v2, :cond_1

    .line 18
    .line 19
    packed-switch p1, :pswitch_data_0

    .line 20
    .line 21
    .line 22
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :pswitch_0
    invoke-interface {p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->getHumanScaleV2()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :pswitch_1
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    .line 56
    .line 57
    .line 58
    move-result v7

    .line 59
    move-object v2, p0

    .line 60
    invoke-interface/range {v2 .. v7}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->setHumanScaleV2(FFFFF)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 64
    .line 65
    .line 66
    goto/16 :goto_0

    .line 67
    .line 68
    :pswitch_2
    move-object v2, p0

    .line 69
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    invoke-interface {v2, p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->setHumanScale(FF)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 81
    .line 82
    .line 83
    goto/16 :goto_0

    .line 84
    .line 85
    :pswitch_3
    move-object v2, p0

    .line 86
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    invoke-interface {v2, p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->setSDKVersionCode(I)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 94
    .line 95
    .line 96
    goto/16 :goto_0

    .line 97
    .line 98
    :pswitch_4
    move-object v2, p0

    .line 99
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    invoke-interface {v2, p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->getAvatarLayoutParams(FF)[F

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeFloatArray([F)V

    .line 115
    .line 116
    .line 117
    goto/16 :goto_0

    .line 118
    .line 119
    :pswitch_5
    move-object v2, p0

    .line 120
    invoke-interface {v2}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->getAvatarHeight()I

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 128
    .line 129
    .line 130
    goto/16 :goto_0

    .line 131
    .line 132
    :pswitch_6
    move-object v2, p0

    .line 133
    invoke-interface {v2}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->getAvatarWidth()I

    .line 134
    .line 135
    .line 136
    move-result p0

    .line 137
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 141
    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :pswitch_7
    move-object v2, p0

    .line 146
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    .line 147
    .line 148
    .line 149
    move-result p0

    .line 150
    invoke-interface {v2, p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->setHumanRotation(F)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 154
    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :pswitch_8
    move-object v2, p0

    .line 159
    invoke-interface {v2}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->stopSpeak()V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 163
    .line 164
    .line 165
    goto/16 :goto_0

    .line 166
    .line 167
    :pswitch_9
    move-object v2, p0

    .line 168
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-interface {v2, p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->startSpeak(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 176
    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :pswitch_a
    move-object v2, p0

    .line 181
    invoke-interface {v2}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->stopMotion()V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 185
    .line 186
    .line 187
    goto/16 :goto_0

    .line 188
    .line 189
    :pswitch_b
    move-object v2, p0

    .line 190
    invoke-interface {v2}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->pauseMotion()V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 194
    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :pswitch_c
    move-object v2, p0

    .line 199
    invoke-interface {v2}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->resumeMotion()V

    .line 200
    .line 201
    .line 202
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 203
    .line 204
    .line 205
    goto/16 :goto_0

    .line 206
    .line 207
    :pswitch_d
    move-object v2, p0

    .line 208
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 209
    .line 210
    .line 211
    move-result p0

    .line 212
    sget-object p1, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 213
    .line 214
    invoke-static {p2, p1}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    check-cast p1, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 219
    .line 220
    invoke-interface {v2, p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->startMotion(ILcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;)Z

    .line 221
    .line 222
    .line 223
    move-result p0

    .line 224
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 225
    .line 226
    .line 227
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 228
    .line 229
    .line 230
    goto/16 :goto_0

    .line 231
    .line 232
    :pswitch_e
    move-object v2, p0

    .line 233
    sget-object p0, Landroid/view/MotionEvent;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 234
    .line 235
    invoke-static {p2, p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    check-cast p0, Landroid/view/MotionEvent;

    .line 240
    .line 241
    invoke-interface {v2, p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->onTouchEvent(Landroid/view/MotionEvent;)V

    .line 242
    .line 243
    .line 244
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 245
    .line 246
    .line 247
    goto/16 :goto_0

    .line 248
    .line 249
    :pswitch_f
    move-object v2, p0

    .line 250
    sget-object p0, Landroid/view/Surface;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 251
    .line 252
    invoke-static {p2, p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object p0

    .line 256
    check-cast p0, Landroid/view/Surface;

    .line 257
    .line 258
    sget-object p1, Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 259
    .line 260
    invoke-static {p2, p1}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    check-cast p1, Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

    .line 265
    .line 266
    invoke-interface {v2, p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->onSurfaceDestroyed(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)V

    .line 267
    .line 268
    .line 269
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 270
    .line 271
    .line 272
    goto/16 :goto_0

    .line 273
    .line 274
    :pswitch_10
    move-object v2, p0

    .line 275
    sget-object p0, Landroid/view/Surface;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 276
    .line 277
    invoke-static {p2, p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object p0

    .line 281
    check-cast p0, Landroid/view/Surface;

    .line 282
    .line 283
    sget-object p1, Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 284
    .line 285
    invoke-static {p2, p1}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    check-cast p1, Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

    .line 290
    .line 291
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 292
    .line 293
    .line 294
    move-result p4

    .line 295
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 296
    .line 297
    .line 298
    move-result p2

    .line 299
    invoke-interface {v2, p0, p1, p4, p2}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->onSurfaceChanged(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;II)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 303
    .line 304
    .line 305
    goto/16 :goto_0

    .line 306
    .line 307
    :pswitch_11
    move-object v2, p0

    .line 308
    sget-object p0, Landroid/view/Surface;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 309
    .line 310
    invoke-static {p2, p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 311
    .line 312
    .line 313
    move-result-object p0

    .line 314
    check-cast p0, Landroid/view/Surface;

    .line 315
    .line 316
    sget-object p1, Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 317
    .line 318
    invoke-static {p2, p1}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    move-result-object p1

    .line 322
    check-cast p1, Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

    .line 323
    .line 324
    invoke-interface {v2, p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->onSurfaceCreated(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)V

    .line 325
    .line 326
    .line 327
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 328
    .line 329
    .line 330
    goto :goto_0

    .line 331
    :pswitch_12
    move-object v2, p0

    .line 332
    invoke-interface {v2}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->getScene()I

    .line 333
    .line 334
    .line 335
    move-result p0

    .line 336
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 337
    .line 338
    .line 339
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 340
    .line 341
    .line 342
    goto :goto_0

    .line 343
    :pswitch_13
    move-object v2, p0

    .line 344
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 345
    .line 346
    .line 347
    move-result p0

    .line 348
    invoke-interface {v2, p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->switchScene(I)V

    .line 349
    .line 350
    .line 351
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 352
    .line 353
    .line 354
    goto :goto_0

    .line 355
    :pswitch_14
    move-object v2, p0

    .line 356
    invoke-interface {v2}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->isHumanRendered()Z

    .line 357
    .line 358
    .line 359
    move-result p0

    .line 360
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 361
    .line 362
    .line 363
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 364
    .line 365
    .line 366
    goto :goto_0

    .line 367
    :pswitch_15
    move-object v2, p0

    .line 368
    invoke-interface {v2}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->setHumanRendered()V

    .line 369
    .line 370
    .line 371
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 372
    .line 373
    .line 374
    goto :goto_0

    .line 375
    :pswitch_16
    move-object v2, p0

    .line 376
    invoke-interface {v2}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->isHumanInited()Z

    .line 377
    .line 378
    .line 379
    move-result p0

    .line 380
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 381
    .line 382
    .line 383
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 384
    .line 385
    .line 386
    goto :goto_0

    .line 387
    :pswitch_17
    move-object v2, p0

    .line 388
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 389
    .line 390
    .line 391
    move-result-object p0

    .line 392
    invoke-static {p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

    .line 393
    .line 394
    .line 395
    move-result-object p0

    .line 396
    invoke-interface {v2, p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->unregisterCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)V

    .line 397
    .line 398
    .line 399
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 400
    .line 401
    .line 402
    goto :goto_0

    .line 403
    :pswitch_18
    move-object v2, p0

    .line 404
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 405
    .line 406
    .line 407
    move-result-object p0

    .line 408
    invoke-static {p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

    .line 409
    .line 410
    .line 411
    move-result-object p0

    .line 412
    invoke-interface {v2, p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->registerCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)V

    .line 413
    .line 414
    .line 415
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 416
    .line 417
    .line 418
    :goto_0
    return v1

    .line 419
    :cond_1
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 420
    .line 421
    .line 422
    return v1

    .line 423
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_18
        :pswitch_17
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
