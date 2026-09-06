.class final Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;
.super Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AttributeReflectionAction"
.end annotation


# static fields
.field static final COLOR_RESOURCE:I = 0x2

.field static final DIMEN_RESOURCE:I = 0x1

.field static final STRING_RESOURCE:I = 0x3


# instance fields
.field private final mAttrId:I

.field private final mResourceType:I


# direct methods
.method constructor <init>(ILjava/lang/String;III)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;-><init>(ILjava/lang/String;I)V

    .line 2
    iput p4, p0, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;->mResourceType:I

    .line 3
    iput p5, p0, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;->mAttrId:I

    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 4
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;-><init>(Landroid/os/Parcel;)V

    .line 5
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;->mResourceType:I

    .line 6
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;->mAttrId:I

    return-void
.end method


# virtual methods
.method public getActionTag()I
    .locals 0

    .line 1
    const/16 p0, 0x20

    .line 2
    .line 3
    return p0
.end method

.method protected getParameterValue(Landroid/view/View;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;->mAttrId:I

    .line 6
    .line 7
    filled-new-array {v0}, [I

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1, v0}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    :try_start_0
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;->mAttrId:I

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getType(I)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 28
    .line 29
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    const-string v2, "Attribute 0x"

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;->mAttrId:I

    .line 40
    .line 41
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string p0, " is not defined"

    .line 49
    .line 50
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-direct {v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    throw v0

    .line 61
    :catchall_0
    move-exception p0

    .line 62
    goto/16 :goto_1

    .line 63
    .line 64
    :catch_0
    move-exception p0

    .line 65
    goto/16 :goto_2

    .line 66
    .line 67
    :cond_1
    :goto_0
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;->mResourceType:I

    .line 68
    .line 69
    const/4 v2, 0x1

    .line 70
    const/4 v3, 0x4

    .line 71
    if-eq v0, v2, :cond_8

    .line 72
    .line 73
    const/4 v2, 0x2

    .line 74
    if-eq v0, v2, :cond_5

    .line 75
    .line 76
    const/4 v2, 0x3

    .line 77
    if-ne v0, v2, :cond_4

    .line 78
    .line 79
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 80
    .line 81
    const/16 v2, 0x9

    .line 82
    .line 83
    if-eq v0, v2, :cond_3

    .line 84
    .line 85
    const/16 v2, 0xa

    .line 86
    .line 87
    if-ne v0, v2, :cond_2

    .line 88
    .line 89
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    .line 90
    .line 91
    .line 92
    move-result-object p0
    :try_end_0
    .catch Lcom/zte/toolsdk/widget/RemoteViews$ActionException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 94
    .line 95
    .line 96
    return-object p0

    .line 97
    :cond_2
    :try_start_1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 98
    .line 99
    new-instance v1, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .line 103
    .line 104
    const-string v2, "string attribute 0x"

    .line 105
    .line 106
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;->mAttrId:I

    .line 110
    .line 111
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string v2, " must be used as STRING or CHAR_SEQUENCE, not "

    .line 119
    .line 120
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 124
    .line 125
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-direct {v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    throw v0

    .line 136
    :cond_3
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p0
    :try_end_1
    .catch Lcom/zte/toolsdk/widget/RemoteViews$ActionException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 140
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 141
    .line 142
    .line 143
    return-object p0

    .line 144
    :cond_4
    :try_start_2
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 145
    .line 146
    new-instance v1, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 149
    .line 150
    .line 151
    const-string v2, "Unknown resource type: "

    .line 152
    .line 153
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;->mResourceType:I

    .line 157
    .line 158
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-direct {v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    throw v0

    .line 169
    :cond_5
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 170
    .line 171
    if-eq v0, v3, :cond_7

    .line 172
    .line 173
    const/16 v2, 0xf

    .line 174
    .line 175
    if-ne v0, v2, :cond_6

    .line 176
    .line 177
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 178
    .line 179
    .line 180
    move-result-object p0
    :try_end_2
    .catch Lcom/zte/toolsdk/widget/RemoteViews$ActionException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 181
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 182
    .line 183
    .line 184
    return-object p0

    .line 185
    :cond_6
    :try_start_3
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 186
    .line 187
    new-instance v1, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 190
    .line 191
    .line 192
    const-string v2, "color attribute 0x"

    .line 193
    .line 194
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    iget v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;->mAttrId:I

    .line 198
    .line 199
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    const-string v2, " must be used as INT or COLOR_STATE_LIST, not "

    .line 207
    .line 208
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 212
    .line 213
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    invoke-direct {v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    throw v0

    .line 224
    :cond_7
    invoke-virtual {p1, v1, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 225
    .line 226
    .line 227
    move-result p0

    .line 228
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 229
    .line 230
    .line 231
    move-result-object p0
    :try_end_3
    .catch Lcom/zte/toolsdk/widget/RemoteViews$ActionException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 232
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 233
    .line 234
    .line 235
    return-object p0

    .line 236
    :cond_8
    :try_start_4
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 237
    .line 238
    if-eq v0, v3, :cond_a

    .line 239
    .line 240
    const/4 v2, 0x6

    .line 241
    if-ne v0, v2, :cond_9

    .line 242
    .line 243
    const/4 p0, 0x0

    .line 244
    invoke-virtual {p1, v1, p0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 245
    .line 246
    .line 247
    move-result p0

    .line 248
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 249
    .line 250
    .line 251
    move-result-object p0
    :try_end_4
    .catch Lcom/zte/toolsdk/widget/RemoteViews$ActionException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 252
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 253
    .line 254
    .line 255
    return-object p0

    .line 256
    :cond_9
    :try_start_5
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 257
    .line 258
    new-instance v1, Ljava/lang/StringBuilder;

    .line 259
    .line 260
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 261
    .line 262
    .line 263
    const-string v2, "dimen attribute 0x"

    .line 264
    .line 265
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    iget v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;->mAttrId:I

    .line 269
    .line 270
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v2

    .line 274
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    const-string v2, " must be used as INT or FLOAT, not "

    .line 278
    .line 279
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 283
    .line 284
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object p0

    .line 291
    invoke-direct {v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    throw v0

    .line 295
    :cond_a
    invoke-virtual {p1, v1, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 296
    .line 297
    .line 298
    move-result p0

    .line 299
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 300
    .line 301
    .line 302
    move-result-object p0
    :try_end_5
    .catch Lcom/zte/toolsdk/widget/RemoteViews$ActionException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 303
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 304
    .line 305
    .line 306
    return-object p0

    .line 307
    :goto_1
    :try_start_6
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 308
    .line 309
    invoke-direct {v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/Throwable;)V

    .line 310
    .line 311
    .line 312
    throw v0

    .line 313
    :catchall_1
    move-exception p0

    .line 314
    goto :goto_3

    .line 315
    :goto_2
    throw p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 316
    :goto_3
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 317
    .line 318
    .line 319
    throw p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->writeToParcel(Landroid/os/Parcel;I)V

    .line 2
    .line 3
    .line 4
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;->mResourceType:I

    .line 5
    .line 6
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 7
    .line 8
    .line 9
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;->mAttrId:I

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
