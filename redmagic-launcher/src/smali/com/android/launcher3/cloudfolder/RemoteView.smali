.class public Lcom/android/launcher3/cloudfolder/RemoteView;
.super Ljava/lang/Object;
.source "RemoteView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/cloudfolder/RemoteView$b;,
        Lcom/android/launcher3/cloudfolder/RemoteView$l;,
        Lcom/android/launcher3/cloudfolder/RemoteView$d;,
        Lcom/android/launcher3/cloudfolder/RemoteView$j;,
        Lcom/android/launcher3/cloudfolder/RemoteView$c;,
        Lcom/android/launcher3/cloudfolder/RemoteView$f;,
        Lcom/android/launcher3/cloudfolder/RemoteView$k;,
        Lcom/android/launcher3/cloudfolder/RemoteView$i;,
        Lcom/android/launcher3/cloudfolder/RemoteView$h;,
        Lcom/android/launcher3/cloudfolder/RemoteView$e;,
        Lcom/android/launcher3/cloudfolder/RemoteView$g;
    }
.end annotation


# static fields
.field private static k:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field

.field protected static final l:[Ljava/lang/String;


# instance fields
.field protected a:Ljava/lang/String;

.field protected b:I

.field protected c:Landroid/content/Context;

.field protected d:Landroid/view/View;

.field private final e:Landroid/view/ViewGroup$LayoutParams;

.field protected f:Landroid/content/Context;

.field protected g:Landroid/view/LayoutInflater;

.field protected final h:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/cloudfolder/RemoteView$b;",
            ">;"
        }
    .end annotation
.end field

.field protected i:Lcom/android/launcher3/cloudfolder/RemoteView$c;

.field protected j:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 7
    .line 8
    const-string v1, "boolean"

    .line 9
    .line 10
    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 16
    .line 17
    const-string v1, "byte"

    .line 18
    .line 19
    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 25
    .line 26
    const-string v1, "short"

    .line 27
    .line 28
    sget-object v2, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 34
    .line 35
    const-string v1, "int"

    .line 36
    .line 37
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 38
    .line 39
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 43
    .line 44
    const-string v1, "long"

    .line 45
    .line 46
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 47
    .line 48
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 52
    .line 53
    const-string v1, "float"

    .line 54
    .line 55
    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 56
    .line 57
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 61
    .line 62
    const-string v1, "double"

    .line 63
    .line 64
    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    .line 65
    .line 66
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 70
    .line 71
    const-string v1, "char"

    .line 72
    .line 73
    sget-object v2, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    .line 74
    .line 75
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 79
    .line 80
    const-string v1, "String"

    .line 81
    .line 82
    const-class v2, Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 88
    .line 89
    const-string v1, "CharSequence"

    .line 90
    .line 91
    const-class v2, Ljava/lang/CharSequence;

    .line 92
    .line 93
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 97
    .line 98
    const-string v1, "Uri"

    .line 99
    .line 100
    const-class v2, Landroid/net/Uri;

    .line 101
    .line 102
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 106
    .line 107
    const-string v1, "Bitmap"

    .line 108
    .line 109
    const-class v2, Landroid/graphics/Bitmap;

    .line 110
    .line 111
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 115
    .line 116
    const-string v1, "Bundle"

    .line 117
    .line 118
    const-class v2, Landroid/os/Bundle;

    .line 119
    .line 120
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 124
    .line 125
    const-string v1, "Intent"

    .line 126
    .line 127
    const-class v2, Landroid/content/Intent;

    .line 128
    .line 129
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 133
    .line 134
    const-string v1, "ColorStateList"

    .line 135
    .line 136
    const-class v2, Landroid/content/res/ColorStateList;

    .line 137
    .line 138
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 142
    .line 143
    const-string v1, "Boolean"

    .line 144
    .line 145
    const-class v2, Ljava/lang/Boolean;

    .line 146
    .line 147
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 151
    .line 152
    const-string v1, "Byte"

    .line 153
    .line 154
    const-class v2, Ljava/lang/Byte;

    .line 155
    .line 156
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 160
    .line 161
    const-string v1, "Short"

    .line 162
    .line 163
    const-class v2, Ljava/lang/Short;

    .line 164
    .line 165
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 169
    .line 170
    const-string v1, "Integer"

    .line 171
    .line 172
    const-class v2, Ljava/lang/Integer;

    .line 173
    .line 174
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 178
    .line 179
    const-string v1, "Long"

    .line 180
    .line 181
    const-class v2, Ljava/lang/Long;

    .line 182
    .line 183
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 187
    .line 188
    const-string v1, "Float"

    .line 189
    .line 190
    const-class v2, Ljava/lang/Float;

    .line 191
    .line 192
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 196
    .line 197
    const-string v1, "Double"

    .line 198
    .line 199
    const-class v2, Ljava/lang/Double;

    .line 200
    .line 201
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 205
    .line 206
    const-string v1, "Character"

    .line 207
    .line 208
    const-class v2, Ljava/lang/Character;

    .line 209
    .line 210
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 214
    .line 215
    const-string v1, "boolean[]"

    .line 216
    .line 217
    const-class v2, [Z

    .line 218
    .line 219
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 223
    .line 224
    const-string v1, "byte[]"

    .line 225
    .line 226
    const-class v2, [B

    .line 227
    .line 228
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 232
    .line 233
    const-string v1, "short[]"

    .line 234
    .line 235
    const-class v2, [S

    .line 236
    .line 237
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 241
    .line 242
    const-string v1, "int[]"

    .line 243
    .line 244
    const-class v2, [I

    .line 245
    .line 246
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 250
    .line 251
    const-string v1, "long[]"

    .line 252
    .line 253
    const-class v2, [J

    .line 254
    .line 255
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 259
    .line 260
    const-string v1, "float[]"

    .line 261
    .line 262
    const-class v2, [F

    .line 263
    .line 264
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 268
    .line 269
    const-string v1, "double[]"

    .line 270
    .line 271
    const-class v2, [D

    .line 272
    .line 273
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    .line 275
    .line 276
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 277
    .line 278
    const-string v1, "char[]"

    .line 279
    .line 280
    const-class v2, [C

    .line 281
    .line 282
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 286
    .line 287
    const-string v1, "String[]"

    .line 288
    .line 289
    const-class v2, [Ljava/lang/String;

    .line 290
    .line 291
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 295
    .line 296
    const-string v1, "CharSequence[]"

    .line 297
    .line 298
    const-class v2, [Ljava/lang/CharSequence;

    .line 299
    .line 300
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 301
    .line 302
    .line 303
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 304
    .line 305
    const-string v1, "Uri[]"

    .line 306
    .line 307
    const-class v2, [Landroid/net/Uri;

    .line 308
    .line 309
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    .line 311
    .line 312
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 313
    .line 314
    const-string v1, "Bitmap[]"

    .line 315
    .line 316
    const-class v2, [Landroid/graphics/Bitmap;

    .line 317
    .line 318
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 322
    .line 323
    const-string v1, "Bundle[]"

    .line 324
    .line 325
    const-class v2, [Landroid/os/Bundle;

    .line 326
    .line 327
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 331
    .line 332
    const-string v1, "Intent[]"

    .line 333
    .line 334
    const-class v2, [Landroid/content/Intent;

    .line 335
    .line 336
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    .line 338
    .line 339
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 340
    .line 341
    const-string v1, "ColorStateList[]"

    .line 342
    .line 343
    const-class v2, [Landroid/content/res/ColorStateList;

    .line 344
    .line 345
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 346
    .line 347
    .line 348
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 349
    .line 350
    const-string v1, "Context"

    .line 351
    .line 352
    const-class v2, Landroid/content/Context;

    .line 353
    .line 354
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 355
    .line 356
    .line 357
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 358
    .line 359
    const-string v1, "RemoteContext"

    .line 360
    .line 361
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 362
    .line 363
    .line 364
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 365
    .line 366
    const-string v1, "Drawable"

    .line 367
    .line 368
    const-class v2, Landroid/graphics/drawable/Drawable;

    .line 369
    .line 370
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 371
    .line 372
    .line 373
    sget-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 374
    .line 375
    const-string v1, "Class"

    .line 376
    .line 377
    const-class v2, Ljava/lang/Class;

    .line 378
    .line 379
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 380
    .line 381
    .line 382
    const-string v0, "android.app."

    .line 383
    .line 384
    const-string v1, "android.view."

    .line 385
    .line 386
    const-string v2, "android.widget."

    .line 387
    .line 388
    const-string v3, "android.webkit."

    .line 389
    .line 390
    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object v0

    .line 394
    sput-object v0, Lcom/android/launcher3/cloudfolder/RemoteView;->l:[Ljava/lang/String;

    .line 395
    .line 396
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->e:Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    new-instance v0, Landroid/util/SparseArray;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->c:Landroid/content/Context;

    .line 20
    .line 21
    iput-object p2, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->a:Ljava/lang/String;

    .line 22
    .line 23
    iput p3, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->b:I

    .line 24
    .line 25
    return-void
.end method

.method private B(I[I)I
    .locals 1

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    array-length p0, p2

    .line 4
    if-lez p0, :cond_1

    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    :goto_0
    array-length v0, p2

    .line 8
    if-ge p0, v0, :cond_1

    .line 9
    .line 10
    aget v0, p2, p0

    .line 11
    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    return p0

    .line 15
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    const/4 p0, -0x1

    .line 19
    return p0
.end method

.method private C(Landroid/view/View;)Landroid/view/View;
    .locals 4

    .line 1
    instance-of v0, p1, Landroid/view/ViewStub;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    check-cast p1, Landroid/view/ViewStub;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    goto :goto_0

    .line 12
    :catch_0
    move-exception p1

    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v1, "Failed to inflate ViewStub "

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v0, "RemoteView"

    .line 31
    .line 32
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    :goto_0
    instance-of v0, p1, Landroid/view/ViewStub;

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-direct {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView;->C(Landroid/view/View;)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    :cond_0
    instance-of v0, p1, Landroid/view/ViewGroup;

    .line 45
    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    move-object v0, p1

    .line 49
    check-cast v0, Landroid/view/ViewGroup;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    const/4 v2, 0x0

    .line 56
    :goto_1
    if-ge v2, v1, :cond_1

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-direct {p0, v3}, Lcom/android/launcher3/cloudfolder/RemoteView;->C(Landroid/view/View;)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    add-int/lit8 v2, v2, 0x1

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    return-object p1
.end method

.method private synthetic D(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->f:Landroid/content/Context;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->g:Landroid/view/LayoutInflater;

    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->i:Lcom/android/launcher3/cloudfolder/RemoteView$c;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-interface {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$c;->a(I)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method private E(Landroid/view/View;I)Ljava/lang/Object;
    .locals 2

    .line 1
    const/16 v0, -0x2710

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p2, v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    instance-of p1, p0, Landroid/graphics/drawable/Animatable;

    .line 11
    .line 12
    if-eqz p1, :cond_7

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    const/16 v0, -0x2711

    .line 16
    .line 17
    if-ne p2, v0, :cond_1

    .line 18
    .line 19
    instance-of p0, p1, Landroid/widget/ImageView;

    .line 20
    .line 21
    if-eqz p0, :cond_7

    .line 22
    .line 23
    check-cast p1, Landroid/widget/ImageView;

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    instance-of p1, p0, Landroid/graphics/drawable/Animatable;

    .line 30
    .line 31
    if-eqz p1, :cond_7

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_1
    if-lez p2, :cond_7

    .line 35
    .line 36
    :try_start_0
    iget-object p1, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->f:Landroid/content/Context;

    .line 37
    .line 38
    invoke-static {p1, p2}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    move-object v0, v1

    .line 43
    goto :goto_0

    .line 44
    :catch_0
    move-exception p1

    .line 45
    move-object v0, p1

    .line 46
    move-object p1, v1

    .line 47
    :goto_0
    if-nez p1, :cond_2

    .line 48
    .line 49
    :try_start_1
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->f:Landroid/content/Context;

    .line 50
    .line 51
    invoke-static {p0, p2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    .line 52
    .line 53
    .line 54
    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 55
    goto :goto_1

    .line 56
    :catch_1
    move-exception p0

    .line 57
    move-object v1, p0

    .line 58
    :cond_2
    :goto_1
    if-nez p1, :cond_6

    .line 59
    .line 60
    if-nez v1, :cond_3

    .line 61
    .line 62
    if-eqz v0, :cond_6

    .line 63
    .line 64
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    const-string p2, "Failed to load animation "

    .line 70
    .line 71
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string p2, ""

    .line 75
    .line 76
    if-eqz v0, :cond_4

    .line 77
    .line 78
    goto :goto_2

    .line 79
    :cond_4
    move-object v0, p2

    .line 80
    :goto_2
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v0, "/"

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    if-eqz v1, :cond_5

    .line 89
    .line 90
    goto :goto_3

    .line 91
    :cond_5
    move-object v1, p2

    .line 92
    :goto_3
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    const-string p2, "RemoteView"

    .line 100
    .line 101
    invoke-static {p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    :cond_6
    return-object p1

    .line 105
    :cond_7
    return-object v1
.end method

.method private F(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    :try_start_0
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    return-object p0

    .line 12
    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v0, "Failed to load class "

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "RemoteView"

    .line 30
    .line 31
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method

.method private G(Landroid/os/Bundle;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 4

    .line 1
    if-eqz p1, :cond_b

    .line 2
    .line 3
    if-eqz p2, :cond_b

    .line 4
    .line 5
    const-string p0, "notify_ids"

    .line 6
    .line 7
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const-string p0, "notify_events"

    .line 21
    .line 22
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    const-string p0, "item_startid"

    .line 36
    .line 37
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 48
    .line 49
    .line 50
    :cond_2
    const-string p0, "keys"

    .line 51
    .line 52
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    const-string p0, "ids"

    .line 66
    .line 67
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_4

    .line 72
    .line 73
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 78
    .line 79
    .line 80
    :cond_4
    const-string p0, "operations"

    .line 81
    .line 82
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_5

    .line 87
    .line 88
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 93
    .line 94
    .line 95
    :cond_5
    const-string p0, "items_added"

    .line 96
    .line 97
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_6

    .line 102
    .line 103
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 108
    .line 109
    .line 110
    :cond_6
    const-string p0, "items_removed"

    .line 111
    .line 112
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_7

    .line 117
    .line 118
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 123
    .line 124
    .line 125
    :cond_7
    const-string p0, "items_updated"

    .line 126
    .line 127
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-eqz v0, :cond_8

    .line 132
    .line 133
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 138
    .line 139
    .line 140
    :cond_8
    const-string p0, "items_moved"

    .line 141
    .line 142
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    if-eqz v0, :cond_9

    .line 147
    .line 148
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 153
    .line 154
    .line 155
    :cond_9
    const-string p0, "data"

    .line 156
    .line 157
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_c

    .line 162
    .line 163
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    .line 164
    .line 165
    .line 166
    move-result-object p2

    .line 167
    if-eqz p2, :cond_c

    .line 168
    .line 169
    array-length v0, p2

    .line 170
    if-lez v0, :cond_c

    .line 171
    .line 172
    invoke-virtual {p1, p0}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    if-eqz v0, :cond_a

    .line 177
    .line 178
    array-length v1, v0

    .line 179
    if-lez v1, :cond_a

    .line 180
    .line 181
    array-length v1, v0

    .line 182
    array-length v2, p2

    .line 183
    add-int/2addr v1, v2

    .line 184
    new-array v1, v1, [Landroid/os/Parcelable;

    .line 185
    .line 186
    array-length v2, v0

    .line 187
    const/4 v3, 0x0

    .line 188
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 189
    .line 190
    .line 191
    array-length v0, v0

    .line 192
    array-length v2, p2

    .line 193
    invoke-static {p2, v3, v1, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {p1, p0, v1}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 197
    .line 198
    .line 199
    return-object p1

    .line 200
    :cond_a
    invoke-virtual {p1, p0, p2}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 201
    .line 202
    .line 203
    return-object p1

    .line 204
    :cond_b
    if-eqz p2, :cond_c

    .line 205
    .line 206
    return-object p2

    .line 207
    :cond_c
    return-object p1
.end method

.method private H(Landroid/os/Bundle;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 1

    .line 1
    if-eqz p1, :cond_c

    .line 2
    .line 3
    if-eqz p2, :cond_c

    .line 4
    .line 5
    const-string p0, "remoteviews"

    .line 6
    .line 7
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const-string p0, "data"

    .line 21
    .line 22
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    const-string p0, "keys"

    .line 36
    .line 37
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    const-string p0, "ids"

    .line 51
    .line 52
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 63
    .line 64
    .line 65
    :cond_3
    const-string p0, "notify_ids"

    .line 66
    .line 67
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_4

    .line 72
    .line 73
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 78
    .line 79
    .line 80
    :cond_4
    const-string p0, "notify_events"

    .line 81
    .line 82
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_5

    .line 87
    .line 88
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    :cond_5
    const-string p0, "listview_ids"

    .line 96
    .line 97
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_6

    .line 102
    .line 103
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 108
    .line 109
    .line 110
    :cond_6
    const-string p0, "animate_ids"

    .line 111
    .line 112
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_7

    .line 117
    .line 118
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 123
    .line 124
    .line 125
    :cond_7
    const-string p0, "animation_res"

    .line 126
    .line 127
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-eqz v0, :cond_8

    .line 132
    .line 133
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 138
    .line 139
    .line 140
    :cond_8
    const-string p0, "animation_trigger"

    .line 141
    .line 142
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    if-eqz v0, :cond_9

    .line 147
    .line 148
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    :cond_9
    const-string p0, "operation_ids"

    .line 156
    .line 157
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_a

    .line 162
    .line 163
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 168
    .line 169
    .line 170
    :cond_a
    const-string p0, "operations"

    .line 171
    .line 172
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-eqz v0, :cond_b

    .line 177
    .line 178
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 183
    .line 184
    .line 185
    :cond_b
    const-string p0, "operation_trigger"

    .line 186
    .line 187
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    if-eqz v0, :cond_d

    .line 192
    .line 193
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p2

    .line 197
    invoke-virtual {p1, p0, p2}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    return-object p1

    .line 201
    :cond_c
    if-eqz p2, :cond_d

    .line 202
    .line 203
    return-object p2

    .line 204
    :cond_d
    return-object p1
.end method

.method private L(Landroid/view/View;)V
    .locals 5

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->c:Landroid/content/Context;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_3

    .line 8
    .line 9
    :cond_0
    check-cast v0, Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getForeColor()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    instance-of v1, p1, Landroid/view/ViewGroup;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    check-cast p1, Landroid/view/ViewGroup;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-ge v0, v1, :cond_5

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-direct {p0, v1}, Lcom/android/launcher3/cloudfolder/RemoteView;->L(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    instance-of p0, p1, Landroid/widget/TextView;

    .line 39
    .line 40
    if-eqz p0, :cond_2

    .line 41
    .line 42
    check-cast p1, Landroid/widget/TextView;

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    instance-of p0, p1, Landroid/widget/ImageView;

    .line 49
    .line 50
    const-string v1, "setTextAndButtonColor e: "

    .line 51
    .line 52
    const-string v2, "RemoteView"

    .line 53
    .line 54
    const/4 v3, -0x1

    .line 55
    if-eqz p0, :cond_4

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    if-eq p0, v3, :cond_5

    .line 66
    .line 67
    if-eqz v4, :cond_5

    .line 68
    .line 69
    :try_start_0
    invoke-virtual {v4, p0}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const-string v3, "recommend_refresh"

    .line 74
    .line 75
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-eqz p0, :cond_5

    .line 80
    .line 81
    move-object p0, p1

    .line 82
    check-cast p0, Landroid/widget/ImageView;

    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    if-eqz p0, :cond_3

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :catch_0
    move-exception p0

    .line 99
    goto :goto_2

    .line 100
    :cond_3
    :goto_1
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    if-eqz p0, :cond_5

    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    .line 112
    .line 113
    goto :goto_3

    .line 114
    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    goto :goto_3

    .line 137
    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    if-eq p0, v3, :cond_5

    .line 146
    .line 147
    if-eqz v4, :cond_5

    .line 148
    .line 149
    :try_start_1
    invoke-virtual {v4, p0}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    const-string v3, "dividerLine"

    .line 154
    .line 155
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    if-eqz p0, :cond_5

    .line 160
    .line 161
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 162
    .line 163
    .line 164
    const p0, 0x3e99999a    # 0.3f

    .line 165
    .line 166
    .line 167
    invoke-virtual {p1, p0}, Landroid/view/View;->setAlpha(F)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :catch_1
    move-exception p0

    .line 172
    new-instance p1, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 175
    .line 176
    .line 177
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    .line 193
    .line 194
    :cond_5
    :goto_3
    return-void
.end method

.method private M(Lcom/android/launcher3/cloudfolder/RemoteView$k;Ljava/lang/String;Lcom/android/launcher3/cloudfolder/RemoteView$j;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    if-eqz p2, :cond_2

    .line 4
    .line 5
    const-string p0, "SClicked"

    .line 6
    .line 7
    invoke-virtual {p2, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    iput-object p3, p1, Lcom/android/launcher3/cloudfolder/RemoteView$k;->b:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 14
    .line 15
    :cond_0
    const-string p0, "LClicked"

    .line 16
    .line 17
    invoke-virtual {p2, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    iput-object p3, p1, Lcom/android/launcher3/cloudfolder/RemoteView$k;->c:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 24
    .line 25
    :cond_1
    iput-object p3, p1, Lcom/android/launcher3/cloudfolder/RemoteView$k;->d:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 26
    .line 27
    const-string p0, "Scroll"

    .line 28
    .line 29
    invoke-virtual {p2, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    iput-object p3, p1, Lcom/android/launcher3/cloudfolder/RemoteView$k;->e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 36
    .line 37
    :cond_2
    return-void
.end method

.method private N(Landroid/view/View;Landroid/os/Bundle;Lcom/android/launcher3/cloudfolder/RemoteView$j;)V
    .locals 6

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    if-eqz p2, :cond_3

    .line 4
    .line 5
    if-eqz p3, :cond_3

    .line 6
    .line 7
    const-string v0, "notify_ids"

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "notify_events"

    .line 14
    .line 15
    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "listview_ids"

    .line 20
    .line 21
    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    if-eqz v0, :cond_3

    .line 26
    .line 27
    array-length v2, v0

    .line 28
    if-lez v2, :cond_3

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    :goto_0
    array-length v3, v0

    .line 32
    if-ge v2, v3, :cond_3

    .line 33
    .line 34
    aget v3, v0, v2

    .line 35
    .line 36
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    if-eqz v4, :cond_2

    .line 41
    .line 42
    invoke-direct {p0, v3, p2}, Lcom/android/launcher3/cloudfolder/RemoteView;->B(I[I)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-gez v3, :cond_2

    .line 47
    .line 48
    new-instance v3, Lcom/android/launcher3/cloudfolder/RemoteView$k;

    .line 49
    .line 50
    const/4 v5, 0x0

    .line 51
    invoke-direct {v3, v5}, Lcom/android/launcher3/cloudfolder/RemoteView$k;-><init>(Lcom/android/launcher3/cloudfolder/RemoteView$j;)V

    .line 52
    .line 53
    .line 54
    if-eqz v1, :cond_0

    .line 55
    .line 56
    array-length v5, v1

    .line 57
    if-ge v2, v5, :cond_0

    .line 58
    .line 59
    aget-object v5, v1, v2

    .line 60
    .line 61
    invoke-direct {p0, v3, v5, p3}, Lcom/android/launcher3/cloudfolder/RemoteView;->M(Lcom/android/launcher3/cloudfolder/RemoteView$k;Ljava/lang/String;Lcom/android/launcher3/cloudfolder/RemoteView$j;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    instance-of v5, v4, Landroid/widget/AdapterView;

    .line 65
    .line 66
    if-nez v5, :cond_1

    .line 67
    .line 68
    iget-object v5, v3, Lcom/android/launcher3/cloudfolder/RemoteView$k;->b:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 69
    .line 70
    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    iget-object v3, v3, Lcom/android/launcher3/cloudfolder/RemoteView$k;->c:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 74
    .line 75
    invoke-virtual {v4, v3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 76
    .line 77
    .line 78
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_3
    return-void
.end method

.method private O(Landroid/view/View;Landroid/os/Bundle;Lcom/android/launcher3/cloudfolder/RemoteView$k;)V
    .locals 4

    .line 1
    if-eqz p2, :cond_5

    .line 2
    .line 3
    instance-of v0, p1, Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    .line 5
    const-string v1, "setupListItems-listeners.mScrollChange==null"

    .line 6
    .line 7
    const-string v2, "RemoteView"

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    move-object v0, p1

    .line 12
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 13
    .line 14
    iget-object v3, p3, Lcom/android/launcher3/cloudfolder/RemoteView$k;->e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 15
    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    :goto_0
    new-instance v1, Lcom/android/launcher3/cloudfolder/RemoteView$i;

    .line 26
    .line 27
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/launcher3/cloudfolder/RemoteView$i;-><init>(Lcom/android/launcher3/cloudfolder/RemoteView;Landroid/view/View;Landroid/os/Bundle;Lcom/android/launcher3/cloudfolder/RemoteView$k;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    instance-of v0, p1, Landroid/widget/AdapterView;

    .line 35
    .line 36
    if-eqz v0, :cond_5

    .line 37
    .line 38
    const-string v0, "setupListItems-AdapterView"

    .line 39
    .line 40
    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    instance-of v0, p1, Ldynamic/remoteview/HorizontalListView;

    .line 44
    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p3, Lcom/android/launcher3/cloudfolder/RemoteView$k;->e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 48
    .line 49
    if-eqz v0, :cond_3

    .line 50
    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    const-string v1, "setupListItems: listeners.mScrollChange="

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget-object v1, p3, Lcom/android/launcher3/cloudfolder/RemoteView$k;->e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    move-object v0, p1

    .line 74
    check-cast v0, Ldynamic/remoteview/HorizontalListView;

    .line 75
    .line 76
    instance-of v1, p0, Lcom/android/launcher3/cloudfolder/c;

    .line 77
    .line 78
    if-eqz v1, :cond_2

    .line 79
    .line 80
    iget-object v1, p3, Lcom/android/launcher3/cloudfolder/RemoteView$k;->e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 81
    .line 82
    check-cast v1, Ldynamic/remoteview/HorizontalListView$OnScrollStateChangedListener;

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_2
    const/4 v1, 0x0

    .line 86
    :goto_1
    invoke-virtual {v0, v1}, Ldynamic/remoteview/HorizontalListView;->setOnScrollStateChangedListener(Ldynamic/remoteview/HorizontalListView$OnScrollStateChangedListener;)V

    .line 87
    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_3
    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    :goto_2
    move-object v0, p1

    .line 94
    check-cast v0, Landroid/widget/AdapterView;

    .line 95
    .line 96
    if-eqz p3, :cond_4

    .line 97
    .line 98
    iget-object v1, p3, Lcom/android/launcher3/cloudfolder/RemoteView$k;->b:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 101
    .line 102
    .line 103
    iget-object v1, p3, Lcom/android/launcher3/cloudfolder/RemoteView$k;->c:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Landroid/widget/AdapterView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 106
    .line 107
    .line 108
    :cond_4
    new-instance v1, Lcom/android/launcher3/cloudfolder/RemoteView$h;

    .line 109
    .line 110
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/launcher3/cloudfolder/RemoteView$h;-><init>(Lcom/android/launcher3/cloudfolder/RemoteView;Landroid/view/View;Landroid/os/Bundle;Lcom/android/launcher3/cloudfolder/RemoteView$k;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0, v1}, Landroid/widget/AdapterView;->setAdapter(Landroid/widget/Adapter;)V

    .line 114
    .line 115
    .line 116
    :cond_5
    return-void
.end method

.method private P(Lcom/android/launcher3/cloudfolder/RemoteView$b;Landroid/os/Bundle;)V
    .locals 10

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    iget-object v0, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 4
    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    if-eqz p2, :cond_4

    .line 8
    .line 9
    const-string v0, "listview_ids"

    .line 10
    .line 11
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "items"

    .line 16
    .line 17
    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "notify_ids"

    .line 22
    .line 23
    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, "notify_events"

    .line 28
    .line 29
    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    if-eqz v0, :cond_4

    .line 34
    .line 35
    array-length v3, v0

    .line 36
    if-lez v3, :cond_4

    .line 37
    .line 38
    if-eqz v1, :cond_4

    .line 39
    .line 40
    array-length v3, v1

    .line 41
    if-lez v3, :cond_4

    .line 42
    .line 43
    const/4 v3, 0x0

    .line 44
    move v4, v3

    .line 45
    :goto_0
    array-length v5, v0

    .line 46
    if-ge v4, v5, :cond_4

    .line 47
    .line 48
    array-length v5, v1

    .line 49
    if-ge v4, v5, :cond_4

    .line 50
    .line 51
    aget v5, v0, v4

    .line 52
    .line 53
    new-instance v6, Lcom/android/launcher3/cloudfolder/RemoteView$k;

    .line 54
    .line 55
    iget-object v7, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 56
    .line 57
    invoke-direct {v6, v7}, Lcom/android/launcher3/cloudfolder/RemoteView$k;-><init>(Lcom/android/launcher3/cloudfolder/RemoteView$j;)V

    .line 58
    .line 59
    .line 60
    instance-of v7, p0, Lcom/android/launcher3/cloudfolder/b;

    .line 61
    .line 62
    if-eqz v7, :cond_0

    .line 63
    .line 64
    invoke-direct {p0, v5, v2}, Lcom/android/launcher3/cloudfolder/RemoteView;->B(I[I)I

    .line 65
    .line 66
    .line 67
    move-result v7

    .line 68
    if-ltz v7, :cond_2

    .line 69
    .line 70
    if-eqz p2, :cond_2

    .line 71
    .line 72
    array-length v8, p2

    .line 73
    if-ge v7, v8, :cond_2

    .line 74
    .line 75
    aget-object v7, p2, v7

    .line 76
    .line 77
    iget-object v8, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 78
    .line 79
    invoke-direct {p0, v6, v7, v8}, Lcom/android/launcher3/cloudfolder/RemoteView;->M(Lcom/android/launcher3/cloudfolder/RemoteView$k;Ljava/lang/String;Lcom/android/launcher3/cloudfolder/RemoteView$j;)V

    .line 80
    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_0
    instance-of v7, p0, Lcom/android/launcher3/cloudfolder/c;

    .line 84
    .line 85
    if-eqz v7, :cond_2

    .line 86
    .line 87
    if-eqz v2, :cond_2

    .line 88
    .line 89
    array-length v7, v2

    .line 90
    if-lez v7, :cond_2

    .line 91
    .line 92
    move v7, v3

    .line 93
    :goto_1
    array-length v8, v2

    .line 94
    if-ge v7, v8, :cond_2

    .line 95
    .line 96
    aget v8, v2, v7

    .line 97
    .line 98
    if-ne v5, v8, :cond_1

    .line 99
    .line 100
    if-eqz p2, :cond_1

    .line 101
    .line 102
    array-length v8, p2

    .line 103
    if-ge v7, v8, :cond_1

    .line 104
    .line 105
    aget-object v8, p2, v7

    .line 106
    .line 107
    iget-object v9, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 108
    .line 109
    invoke-direct {p0, v6, v8, v9}, Lcom/android/launcher3/cloudfolder/RemoteView;->M(Lcom/android/launcher3/cloudfolder/RemoteView$k;Ljava/lang/String;Lcom/android/launcher3/cloudfolder/RemoteView$j;)V

    .line 110
    .line 111
    .line 112
    :cond_1
    add-int/lit8 v7, v7, 0x1

    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_2
    :goto_2
    if-lez v5, :cond_3

    .line 116
    .line 117
    aget-object v7, v1, v4

    .line 118
    .line 119
    instance-of v7, v7, Landroid/os/Bundle;

    .line 120
    .line 121
    if-eqz v7, :cond_3

    .line 122
    .line 123
    invoke-static {p1}, Lcom/android/launcher3/cloudfolder/RemoteView$b;->b(Lcom/android/launcher3/cloudfolder/RemoteView$b;)Landroid/util/SparseArray;

    .line 124
    .line 125
    .line 126
    move-result-object v7

    .line 127
    aget-object v8, v1, v4

    .line 128
    .line 129
    check-cast v8, Landroid/os/Bundle;

    .line 130
    .line 131
    invoke-virtual {v7, v5, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    iget-object v7, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 135
    .line 136
    invoke-virtual {v7, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object v5

    .line 140
    aget-object v7, v1, v4

    .line 141
    .line 142
    check-cast v7, Landroid/os/Bundle;

    .line 143
    .line 144
    invoke-direct {p0, v5, v7, v6}, Lcom/android/launcher3/cloudfolder/RemoteView;->O(Landroid/view/View;Landroid/os/Bundle;Lcom/android/launcher3/cloudfolder/RemoteView$k;)V

    .line 145
    .line 146
    .line 147
    :cond_3
    add-int/lit8 v4, v4, 0x1

    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_4
    return-void
.end method

.method private Q(ILandroid/os/Bundle;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;

    .line 8
    .line 9
    const-string v0, "RemoteView"

    .line 10
    .line 11
    const-string v1, "setupView"

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    if-eqz p1, :cond_2

    .line 17
    .line 18
    invoke-static {p1, p2}, Lcom/android/launcher3/cloudfolder/RemoteView$b;->e(Lcom/android/launcher3/cloudfolder/RemoteView$b;Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-direct {p0, p2, v0}, Lcom/android/launcher3/cloudfolder/RemoteView;->w(Landroid/os/Bundle;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    const-string v1, "data"

    .line 33
    .line 34
    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-string v2, "keys"

    .line 39
    .line 40
    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    const-string v3, "ids"

    .line 45
    .line 46
    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-direct {p0, v0, v1, v2, v3}, Lcom/android/launcher3/cloudfolder/RemoteView;->n(Landroid/view/View;Landroid/os/Bundle;[Ljava/lang/String;[I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 54
    .line 55
    iget-object v1, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 56
    .line 57
    invoke-direct {p0, v0, p2, v1}, Lcom/android/launcher3/cloudfolder/RemoteView;->N(Landroid/view/View;Landroid/os/Bundle;Lcom/android/launcher3/cloudfolder/RemoteView$j;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->f:Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 61
    .line 62
    iget-object v1, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 63
    .line 64
    const/4 v2, 0x1

    .line 65
    invoke-direct {p0, v0, v1, p2, v2}, Lcom/android/launcher3/cloudfolder/RemoteView;->j(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Landroid/os/Bundle;Z)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->g:Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 69
    .line 70
    iget-object v1, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 71
    .line 72
    invoke-direct {p0, v0, v1, p2, v2}, Lcom/android/launcher3/cloudfolder/RemoteView;->l(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Landroid/os/Bundle;Z)V

    .line 73
    .line 74
    .line 75
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/cloudfolder/RemoteView;->P(Lcom/android/launcher3/cloudfolder/RemoteView$b;Landroid/os/Bundle;)V

    .line 76
    .line 77
    .line 78
    :cond_0
    iget-object p2, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 79
    .line 80
    if-nez p2, :cond_1

    .line 81
    .line 82
    iget-object p2, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->d:Landroid/view/View;

    .line 83
    .line 84
    if-eqz p2, :cond_1

    .line 85
    .line 86
    iput-object p2, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 87
    .line 88
    :cond_1
    iget-object p2, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->c:Lcom/android/launcher3/cloudfolder/RemoteView$d;

    .line 89
    .line 90
    if-eqz p2, :cond_2

    .line 91
    .line 92
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 93
    .line 94
    .line 95
    iget-object p2, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 96
    .line 97
    if-eqz p2, :cond_2

    .line 98
    .line 99
    iget-object p1, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->c:Lcom/android/launcher3/cloudfolder/RemoteView$d;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->e:Landroid/view/ViewGroup$LayoutParams;

    .line 102
    .line 103
    invoke-virtual {p1, p2, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 104
    .line 105
    .line 106
    :cond_2
    return-void
.end method

.method private T(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Lcom/android/launcher3/cloudfolder/RemoteView$f;->a(Lcom/android/launcher3/cloudfolder/RemoteView$f;)Ljava/util/HashMap;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Landroid/util/SparseArray;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p2}, Landroid/view/View;->getId()I

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    invoke-virtual {p1, p3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-direct {p0, p2, p1, p4}, Lcom/android/launcher3/cloudfolder/RemoteView;->m(Landroid/view/View;Ljava/lang/Object;Z)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/cloudfolder/RemoteView;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView;->D(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b(Lcom/android/launcher3/cloudfolder/RemoteView;Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Landroid/os/Bundle;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/cloudfolder/RemoteView;->j(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Landroid/os/Bundle;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/launcher3/cloudfolder/RemoteView;Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Landroid/os/Bundle;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/cloudfolder/RemoteView;->l(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Landroid/os/Bundle;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic d(Lcom/android/launcher3/cloudfolder/RemoteView;Landroid/view/View;Landroid/os/Bundle;[Ljava/lang/String;[I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/cloudfolder/RemoteView;->n(Landroid/view/View;Landroid/os/Bundle;[Ljava/lang/String;[I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic e(Lcom/android/launcher3/cloudfolder/RemoteView;Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/cloudfolder/RemoteView;->p(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic f(Lcom/android/launcher3/cloudfolder/RemoteView;Landroid/widget/FrameLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/cloudfolder/RemoteView;->r(Landroid/widget/FrameLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic g(Lcom/android/launcher3/cloudfolder/RemoteView;Lcom/android/launcher3/cloudfolder/RemoteView$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView;->s(Lcom/android/launcher3/cloudfolder/RemoteView$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic h(Lcom/android/launcher3/cloudfolder/RemoteView;Landroid/os/Bundle;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/cloudfolder/RemoteView;->w(Landroid/os/Bundle;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic i(Lcom/android/launcher3/cloudfolder/RemoteView;Lcom/android/launcher3/cloudfolder/RemoteView$k;Ljava/lang/String;Lcom/android/launcher3/cloudfolder/RemoteView$j;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/cloudfolder/RemoteView;->M(Lcom/android/launcher3/cloudfolder/RemoteView$k;Ljava/lang/String;Lcom/android/launcher3/cloudfolder/RemoteView$j;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private j(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Landroid/os/Bundle;Z)V
    .locals 10

    .line 1
    if-eqz p1, :cond_6

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->f:Landroid/content/Context;

    .line 4
    .line 5
    if-eqz v0, :cond_6

    .line 6
    .line 7
    if-eqz p2, :cond_6

    .line 8
    .line 9
    if-eqz p3, :cond_6

    .line 10
    .line 11
    const-string v0, "animate_ids"

    .line 12
    .line 13
    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "animation_res"

    .line 18
    .line 19
    invoke-virtual {p3, v1}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "animation_trigger"

    .line 24
    .line 25
    invoke-virtual {p3, v2}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    if-eqz v0, :cond_6

    .line 30
    .line 31
    array-length v2, v0

    .line 32
    if-lez v2, :cond_6

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    :goto_0
    array-length v3, v0

    .line 36
    if-ge v2, v3, :cond_6

    .line 37
    .line 38
    aget v3, v0, v2

    .line 39
    .line 40
    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    if-eqz v4, :cond_5

    .line 45
    .line 46
    const/4 v5, 0x0

    .line 47
    if-eqz p3, :cond_0

    .line 48
    .line 49
    array-length v6, p3

    .line 50
    if-ge v2, v6, :cond_0

    .line 51
    .line 52
    aget-object v6, p3, v2

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_0
    move-object v6, v5

    .line 56
    :goto_1
    if-eqz v1, :cond_1

    .line 57
    .line 58
    array-length v7, v1

    .line 59
    if-ge v2, v7, :cond_1

    .line 60
    .line 61
    aget v5, v1, v2

    .line 62
    .line 63
    invoke-direct {p0, v4, v5}, Lcom/android/launcher3/cloudfolder/RemoteView;->E(Landroid/view/View;I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    :cond_1
    const/4 v7, 0x1

    .line 68
    if-eqz v5, :cond_4

    .line 69
    .line 70
    invoke-static {p1}, Lcom/android/launcher3/cloudfolder/RemoteView$f;->a(Lcom/android/launcher3/cloudfolder/RemoteView$f;)Ljava/util/HashMap;

    .line 71
    .line 72
    .line 73
    move-result-object v8

    .line 74
    invoke-virtual {v8, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v8

    .line 78
    check-cast v8, Landroid/util/SparseArray;

    .line 79
    .line 80
    if-nez v8, :cond_2

    .line 81
    .line 82
    new-instance v8, Landroid/util/SparseArray;

    .line 83
    .line 84
    invoke-direct {v8}, Landroid/util/SparseArray;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-static {p1}, Lcom/android/launcher3/cloudfolder/RemoteView$f;->a(Lcom/android/launcher3/cloudfolder/RemoteView$f;)Ljava/util/HashMap;

    .line 88
    .line 89
    .line 90
    move-result-object v9

    .line 91
    invoke-virtual {v9, v6, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    :cond_2
    invoke-virtual {v8, v3, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    if-nez v3, :cond_3

    .line 102
    .line 103
    if-eqz p4, :cond_5

    .line 104
    .line 105
    const-string v3, "FirstShown"

    .line 106
    .line 107
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    if-eqz v3, :cond_5

    .line 112
    .line 113
    :cond_3
    invoke-direct {p0, v4, v5, v7}, Lcom/android/launcher3/cloudfolder/RemoteView;->m(Landroid/view/View;Ljava/lang/Object;Z)V

    .line 114
    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_4
    invoke-direct {p0, p1, v4, v7}, Lcom/android/launcher3/cloudfolder/RemoteView;->p(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Z)V

    .line 118
    .line 119
    .line 120
    :cond_5
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_6
    return-void
.end method

.method private k(Ljava/lang/Object;Landroid/os/Bundle;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    if-eqz v1, :cond_17

    .line 8
    .line 9
    const-string v4, "op_target"

    .line 10
    .line 11
    invoke-virtual {v1, v4}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    const-string v5, "__new__"

    .line 16
    .line 17
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    const-string v6, "op_method"

    .line 22
    .line 23
    const/4 v8, 0x0

    .line 24
    if-eqz v5, :cond_0

    .line 25
    .line 26
    move-object/from16 v4, p1

    .line 27
    .line 28
    const/4 v5, 0x1

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    const-string v5, "__lcontext__"

    .line 31
    .line 32
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    if-eqz v5, :cond_1

    .line 37
    .line 38
    iget-object v4, v0, Lcom/android/launcher3/cloudfolder/RemoteView;->c:Landroid/content/Context;

    .line 39
    .line 40
    :goto_0
    move v5, v8

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    const-string v5, "__rcontext__"

    .line 43
    .line 44
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    if-eqz v5, :cond_2

    .line 49
    .line 50
    iget-object v4, v0, Lcom/android/launcher3/cloudfolder/RemoteView;->f:Landroid/content/Context;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    const-string v5, "__remoteview__"

    .line 54
    .line 55
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    if-eqz v5, :cond_3

    .line 60
    .line 61
    move-object v4, v0

    .line 62
    goto :goto_0

    .line 63
    :cond_3
    const-string v5, "__origin__"

    .line 64
    .line 65
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    if-eqz v5, :cond_4

    .line 70
    .line 71
    move-object v4, v2

    .line 72
    goto :goto_0

    .line 73
    :cond_4
    instance-of v5, v4, Landroid/os/Bundle;

    .line 74
    .line 75
    if-eqz v5, :cond_5

    .line 76
    .line 77
    move-object v5, v4

    .line 78
    check-cast v5, Landroid/os/Bundle;

    .line 79
    .line 80
    invoke-virtual {v5, v6}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result v9

    .line 84
    if-eqz v9, :cond_5

    .line 85
    .line 86
    move-object/from16 v9, p1

    .line 87
    .line 88
    invoke-direct {v0, v9, v5, v2}, Lcom/android/launcher3/cloudfolder/RemoteView;->k(Ljava/lang/Object;Landroid/os/Bundle;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    goto :goto_0

    .line 93
    :cond_5
    move-object/from16 v9, p1

    .line 94
    .line 95
    instance-of v5, v4, Ljava/lang/String;

    .line 96
    .line 97
    if-eqz v5, :cond_6

    .line 98
    .line 99
    check-cast v4, Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    if-nez v5, :cond_7

    .line 106
    .line 107
    invoke-direct {v0, v4}, Lcom/android/launcher3/cloudfolder/RemoteView;->F(Ljava/lang/String;)Ljava/lang/Class;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    goto :goto_0

    .line 112
    :cond_6
    if-eqz v4, :cond_7

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_7
    move v5, v8

    .line 116
    move-object v4, v9

    .line 117
    :goto_1
    invoke-virtual {v1, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v9

    .line 121
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result v10

    .line 125
    if-nez v10, :cond_17

    .line 126
    .line 127
    const-string v10, "op_param_types"

    .line 128
    .line 129
    invoke-virtual {v1, v10}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v10

    .line 133
    const-string v11, "RemoteView"

    .line 134
    .line 135
    if-eqz v10, :cond_13

    .line 136
    .line 137
    array-length v12, v10

    .line 138
    if-lez v12, :cond_13

    .line 139
    .line 140
    array-length v12, v10

    .line 141
    new-array v12, v12, [Ljava/lang/Class;

    .line 142
    .line 143
    array-length v13, v10

    .line 144
    new-array v13, v13, [Ljava/lang/Object;

    .line 145
    .line 146
    move v14, v8

    .line 147
    :goto_2
    array-length v15, v10

    .line 148
    if-ge v14, v15, :cond_12

    .line 149
    .line 150
    sget-object v15, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 151
    .line 152
    const/16 v16, 0x0

    .line 153
    .line 154
    aget-object v3, v10, v14

    .line 155
    .line 156
    invoke-virtual {v15, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    check-cast v3, Ljava/lang/Class;

    .line 161
    .line 162
    if-nez v3, :cond_8

    .line 163
    .line 164
    aget-object v15, v10, v14

    .line 165
    .line 166
    if-eqz v15, :cond_8

    .line 167
    .line 168
    invoke-direct {v0, v15}, Lcom/android/launcher3/cloudfolder/RemoteView;->F(Ljava/lang/String;)Ljava/lang/Class;

    .line 169
    .line 170
    .line 171
    move-result-object v3

    .line 172
    :cond_8
    if-eqz v3, :cond_11

    .line 173
    .line 174
    aput-object v3, v12, v14

    .line 175
    .line 176
    const-class v15, Landroid/content/Context;

    .line 177
    .line 178
    if-ne v3, v15, :cond_a

    .line 179
    .line 180
    const-string v3, "RemoteContext"

    .line 181
    .line 182
    aget-object v15, v10, v14

    .line 183
    .line 184
    invoke-virtual {v3, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result v3

    .line 188
    if-eqz v3, :cond_9

    .line 189
    .line 190
    iget-object v3, v0, Lcom/android/launcher3/cloudfolder/RemoteView;->f:Landroid/content/Context;

    .line 191
    .line 192
    aput-object v3, v13, v14

    .line 193
    .line 194
    :goto_3
    const/16 v17, 0x1

    .line 195
    .line 196
    goto/16 :goto_5

    .line 197
    .line 198
    :cond_9
    iget-object v3, v0, Lcom/android/launcher3/cloudfolder/RemoteView;->c:Landroid/content/Context;

    .line 199
    .line 200
    aput-object v3, v13, v14

    .line 201
    .line 202
    goto :goto_3

    .line 203
    :cond_a
    const-class v15, Landroid/graphics/drawable/Drawable;

    .line 204
    .line 205
    const/16 v17, 0x1

    .line 206
    .line 207
    const-string v7, "op_param_value_"

    .line 208
    .line 209
    if-ne v3, v15, :cond_c

    .line 210
    .line 211
    new-instance v3, Ljava/lang/StringBuilder;

    .line 212
    .line 213
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v3

    .line 226
    invoke-virtual {v1, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    instance-of v7, v3, Ljava/lang/Integer;

    .line 231
    .line 232
    if-eqz v7, :cond_b

    .line 233
    .line 234
    iget-object v7, v0, Lcom/android/launcher3/cloudfolder/RemoteView;->f:Landroid/content/Context;

    .line 235
    .line 236
    if-eqz v7, :cond_b

    .line 237
    .line 238
    new-instance v7, Landroid/widget/ImageView;

    .line 239
    .line 240
    iget-object v15, v0, Lcom/android/launcher3/cloudfolder/RemoteView;->f:Landroid/content/Context;

    .line 241
    .line 242
    invoke-direct {v7, v15}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 243
    .line 244
    .line 245
    check-cast v3, Ljava/lang/Integer;

    .line 246
    .line 247
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 248
    .line 249
    .line 250
    move-result v3

    .line 251
    invoke-virtual {v7, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 252
    .line 253
    .line 254
    invoke-virtual {v7}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 255
    .line 256
    .line 257
    move-result-object v3

    .line 258
    aput-object v3, v13, v14

    .line 259
    .line 260
    goto :goto_5

    .line 261
    :cond_b
    aput-object v16, v13, v14

    .line 262
    .line 263
    goto :goto_5

    .line 264
    :cond_c
    const-class v15, Ljava/lang/Class;

    .line 265
    .line 266
    if-ne v3, v15, :cond_f

    .line 267
    .line 268
    new-instance v15, Ljava/lang/StringBuilder;

    .line 269
    .line 270
    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v7

    .line 283
    invoke-virtual {v1, v7}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 284
    .line 285
    .line 286
    move-result-object v7

    .line 287
    instance-of v15, v7, Ljava/lang/String;

    .line 288
    .line 289
    if-eqz v15, :cond_d

    .line 290
    .line 291
    check-cast v7, Ljava/lang/String;

    .line 292
    .line 293
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    .line 294
    .line 295
    .line 296
    move-result v15

    .line 297
    if-nez v15, :cond_d

    .line 298
    .line 299
    invoke-direct {v0, v7}, Lcom/android/launcher3/cloudfolder/RemoteView;->F(Ljava/lang/String;)Ljava/lang/Class;

    .line 300
    .line 301
    .line 302
    move-result-object v7

    .line 303
    goto :goto_4

    .line 304
    :cond_d
    move-object/from16 v7, v16

    .line 305
    .line 306
    :goto_4
    if-eqz v7, :cond_e

    .line 307
    .line 308
    move-object v3, v7

    .line 309
    :cond_e
    aput-object v3, v13, v14

    .line 310
    .line 311
    goto :goto_5

    .line 312
    :cond_f
    new-instance v3, Ljava/lang/StringBuilder;

    .line 313
    .line 314
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 315
    .line 316
    .line 317
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 318
    .line 319
    .line 320
    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 321
    .line 322
    .line 323
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v3

    .line 327
    invoke-virtual {v1, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    move-result-object v3

    .line 331
    instance-of v7, v3, Landroid/os/Bundle;

    .line 332
    .line 333
    if-eqz v7, :cond_10

    .line 334
    .line 335
    move-object v7, v3

    .line 336
    check-cast v7, Landroid/os/Bundle;

    .line 337
    .line 338
    invoke-virtual {v7, v6}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 339
    .line 340
    .line 341
    move-result v15

    .line 342
    if-eqz v15, :cond_10

    .line 343
    .line 344
    invoke-direct {v0, v4, v7, v2}, Lcom/android/launcher3/cloudfolder/RemoteView;->k(Ljava/lang/Object;Landroid/os/Bundle;Ljava/lang/Object;)Ljava/lang/Object;

    .line 345
    .line 346
    .line 347
    move-result-object v3

    .line 348
    aput-object v3, v13, v14

    .line 349
    .line 350
    goto :goto_5

    .line 351
    :cond_10
    aput-object v3, v13, v14

    .line 352
    .line 353
    :goto_5
    add-int/lit8 v14, v14, 0x1

    .line 354
    .line 355
    goto/16 :goto_2

    .line 356
    .line 357
    :cond_11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 358
    .line 359
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 360
    .line 361
    .line 362
    const-string v1, "Illegal parameter type "

    .line 363
    .line 364
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    aget-object v1, v10, v14

    .line 368
    .line 369
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 370
    .line 371
    .line 372
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object v0

    .line 376
    invoke-static {v11, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 377
    .line 378
    .line 379
    return-object v16

    .line 380
    :cond_12
    const/16 v16, 0x0

    .line 381
    .line 382
    const/16 v17, 0x1

    .line 383
    .line 384
    goto :goto_6

    .line 385
    :cond_13
    const/16 v16, 0x0

    .line 386
    .line 387
    const/16 v17, 0x1

    .line 388
    .line 389
    move-object/from16 v12, v16

    .line 390
    .line 391
    move-object v13, v12

    .line 392
    :goto_6
    if-ne v4, v0, :cond_14

    .line 393
    .line 394
    invoke-direct {v0, v4, v9, v12, v8}, Lcom/android/launcher3/cloudfolder/RemoteView;->v(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;Z)Ljava/lang/reflect/Method;

    .line 395
    .line 396
    .line 397
    move-result-object v3

    .line 398
    if-nez v3, :cond_14

    .line 399
    .line 400
    const/4 v3, 0x3

    .line 401
    new-array v12, v3, [Ljava/lang/Class;

    .line 402
    .line 403
    const-class v6, Ljava/lang/Object;

    .line 404
    .line 405
    aput-object v6, v12, v8

    .line 406
    .line 407
    const-class v7, Landroid/os/Bundle;

    .line 408
    .line 409
    aput-object v7, v12, v17

    .line 410
    .line 411
    const/4 v7, 0x2

    .line 412
    aput-object v6, v12, v7

    .line 413
    .line 414
    new-array v13, v3, [Ljava/lang/Object;

    .line 415
    .line 416
    aput-object v4, v13, v8

    .line 417
    .line 418
    aput-object v1, v13, v17

    .line 419
    .line 420
    aput-object v2, v13, v7

    .line 421
    .line 422
    :cond_14
    const-string v1, ", "

    .line 423
    .line 424
    const-string v2, " of "

    .line 425
    .line 426
    if-eqz v5, :cond_16

    .line 427
    .line 428
    sget-object v3, Lcom/android/launcher3/cloudfolder/RemoteView;->k:Ljava/util/HashMap;

    .line 429
    .line 430
    invoke-virtual {v3, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 431
    .line 432
    .line 433
    move-result-object v3

    .line 434
    check-cast v3, Ljava/lang/Class;

    .line 435
    .line 436
    if-nez v3, :cond_15

    .line 437
    .line 438
    invoke-direct {v0, v9}, Lcom/android/launcher3/cloudfolder/RemoteView;->F(Ljava/lang/String;)Ljava/lang/Class;

    .line 439
    .line 440
    .line 441
    move-result-object v3

    .line 442
    :cond_15
    if-eqz v3, :cond_18

    .line 443
    .line 444
    :try_start_0
    invoke-virtual {v3, v12}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 445
    .line 446
    .line 447
    move-result-object v0

    .line 448
    if-eqz v0, :cond_18

    .line 449
    .line 450
    invoke-virtual {v0, v13}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 451
    .line 452
    .line 453
    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 454
    goto :goto_8

    .line 455
    :catch_0
    move-exception v0

    .line 456
    new-instance v4, Ljava/lang/StringBuilder;

    .line 457
    .line 458
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 459
    .line 460
    .line 461
    const-string v5, "Failed to invoke constructor "

    .line 462
    .line 463
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 464
    .line 465
    .line 466
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 467
    .line 468
    .line 469
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 470
    .line 471
    .line 472
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 473
    .line 474
    .line 475
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 476
    .line 477
    .line 478
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 479
    .line 480
    .line 481
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 482
    .line 483
    .line 484
    move-result-object v0

    .line 485
    invoke-static {v11, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    .line 487
    .line 488
    goto :goto_7

    .line 489
    :cond_16
    if-eqz v4, :cond_18

    .line 490
    .line 491
    move/from16 v3, v17

    .line 492
    .line 493
    invoke-direct {v0, v4, v9, v12, v3}, Lcom/android/launcher3/cloudfolder/RemoteView;->v(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;Z)Ljava/lang/reflect/Method;

    .line 494
    .line 495
    .line 496
    move-result-object v0

    .line 497
    if-eqz v0, :cond_18

    .line 498
    .line 499
    :try_start_1
    invoke-virtual {v0, v4, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 500
    .line 501
    .line 502
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 503
    return-object v0

    .line 504
    :catch_1
    move-exception v0

    .line 505
    new-instance v3, Ljava/lang/StringBuilder;

    .line 506
    .line 507
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 508
    .line 509
    .line 510
    const-string v5, "Failed to invoke method "

    .line 511
    .line 512
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 513
    .line 514
    .line 515
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 516
    .line 517
    .line 518
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 519
    .line 520
    .line 521
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 522
    .line 523
    .line 524
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 525
    .line 526
    .line 527
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 528
    .line 529
    .line 530
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 531
    .line 532
    .line 533
    move-result-object v0

    .line 534
    invoke-static {v11, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 535
    .line 536
    .line 537
    goto :goto_7

    .line 538
    :cond_17
    const/16 v16, 0x0

    .line 539
    .line 540
    :cond_18
    :goto_7
    move-object/from16 v3, v16

    .line 541
    .line 542
    :goto_8
    return-object v3
.end method

.method private l(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Landroid/os/Bundle;Z)V
    .locals 8

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    if-eqz p2, :cond_4

    .line 4
    .line 5
    if-eqz p3, :cond_4

    .line 6
    .line 7
    const-string v0, "operation_ids"

    .line 8
    .line 9
    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "operations"

    .line 14
    .line 15
    invoke-virtual {p3, v1}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "operation_trigger"

    .line 20
    .line 21
    invoke-virtual {p3, v2}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    if-eqz v0, :cond_4

    .line 26
    .line 27
    array-length v2, v0

    .line 28
    if-lez v2, :cond_4

    .line 29
    .line 30
    if-eqz v1, :cond_4

    .line 31
    .line 32
    array-length v2, v1

    .line 33
    if-lez v2, :cond_4

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    :goto_0
    array-length v3, v0

    .line 37
    if-ge v2, v3, :cond_4

    .line 38
    .line 39
    array-length v3, v1

    .line 40
    if-ge v2, v3, :cond_4

    .line 41
    .line 42
    aget v3, v0, v2

    .line 43
    .line 44
    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    if-eqz v4, :cond_3

    .line 49
    .line 50
    if-eqz p3, :cond_0

    .line 51
    .line 52
    array-length v5, p3

    .line 53
    if-ge v2, v5, :cond_0

    .line 54
    .line 55
    aget-object v5, p3, v2

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_0
    const/4 v5, 0x0

    .line 59
    :goto_1
    aget-object v6, v1, v2

    .line 60
    .line 61
    instance-of v6, v6, Landroid/os/Bundle;

    .line 62
    .line 63
    if-eqz v6, :cond_3

    .line 64
    .line 65
    invoke-static {p1}, Lcom/android/launcher3/cloudfolder/RemoteView$f;->a(Lcom/android/launcher3/cloudfolder/RemoteView$f;)Ljava/util/HashMap;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    invoke-virtual {v6, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    check-cast v6, Landroid/util/SparseArray;

    .line 74
    .line 75
    if-nez v6, :cond_1

    .line 76
    .line 77
    new-instance v6, Landroid/util/SparseArray;

    .line 78
    .line 79
    invoke-direct {v6}, Landroid/util/SparseArray;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-static {p1}, Lcom/android/launcher3/cloudfolder/RemoteView$f;->a(Lcom/android/launcher3/cloudfolder/RemoteView$f;)Ljava/util/HashMap;

    .line 83
    .line 84
    .line 85
    move-result-object v7

    .line 86
    invoke-virtual {v7, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    :cond_1
    aget-object v7, v1, v2

    .line 90
    .line 91
    invoke-virtual {v6, v3, v7}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    if-nez v3, :cond_2

    .line 99
    .line 100
    if-eqz p4, :cond_3

    .line 101
    .line 102
    const-string v3, "FirstShown"

    .line 103
    .line 104
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    if-eqz v3, :cond_3

    .line 109
    .line 110
    :cond_2
    aget-object v3, v1, v2

    .line 111
    .line 112
    check-cast v3, Landroid/os/Bundle;

    .line 113
    .line 114
    invoke-direct {p0, v4, v3}, Lcom/android/launcher3/cloudfolder/RemoteView;->o(Landroid/view/View;Landroid/os/Bundle;)V

    .line 115
    .line 116
    .line 117
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_4
    return-void
.end method

.method private m(Landroid/view/View;Ljava/lang/Object;Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_7

    .line 2
    .line 3
    if-eqz p2, :cond_7

    .line 4
    .line 5
    instance-of p0, p2, Landroid/animation/Animator;

    .line 6
    .line 7
    if-eqz p0, :cond_2

    .line 8
    .line 9
    check-cast p2, Landroid/animation/Animator;

    .line 10
    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2, p1}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2}, Landroid/animation/Animator;->start()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p2}, Landroid/animation/Animator;->isRunning()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p2}, Landroid/animation/Animator;->end()V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    invoke-virtual {p2}, Landroid/animation/Animator;->cancel()V

    .line 31
    .line 32
    .line 33
    :goto_0
    const/4 p0, 0x0

    .line 34
    invoke-virtual {p2, p0}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    instance-of p0, p2, Landroid/view/animation/Animation;

    .line 39
    .line 40
    if-eqz p0, :cond_4

    .line 41
    .line 42
    if-eqz p3, :cond_3

    .line 43
    .line 44
    check-cast p2, Landroid/view/animation/Animation;

    .line 45
    .line 46
    invoke-virtual {p1, p2}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_4
    instance-of p0, p2, Landroid/graphics/drawable/Animatable;

    .line 55
    .line 56
    if-eqz p0, :cond_6

    .line 57
    .line 58
    if-eqz p3, :cond_5

    .line 59
    .line 60
    check-cast p2, Landroid/graphics/drawable/Animatable;

    .line 61
    .line 62
    invoke-interface {p2}, Landroid/graphics/drawable/Animatable;->start()V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_5
    check-cast p2, Landroid/graphics/drawable/Animatable;

    .line 67
    .line 68
    invoke-interface {p2}, Landroid/graphics/drawable/Animatable;->stop()V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_6
    new-instance p0, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    const-string p1, "Unexpected animation type "

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    const-string p1, "RemoteView"

    .line 90
    .line 91
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    :cond_7
    return-void
.end method

.method private n(Landroid/view/View;Landroid/os/Bundle;[Ljava/lang/String;[I)V
    .locals 6

    .line 1
    if-eqz p1, :cond_d

    .line 2
    .line 3
    if-eqz p3, :cond_d

    .line 4
    .line 5
    array-length v0, p3

    .line 6
    if-lez v0, :cond_d

    .line 7
    .line 8
    if-eqz p4, :cond_d

    .line 9
    .line 10
    array-length v0, p4

    .line 11
    if-lez v0, :cond_d

    .line 12
    .line 13
    if-eqz p2, :cond_d

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    :goto_0
    array-length v1, p3

    .line 17
    if-ge v0, v1, :cond_d

    .line 18
    .line 19
    array-length v1, p4

    .line 20
    if-ge v0, v1, :cond_d

    .line 21
    .line 22
    aget v1, p4, v0

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    if-eqz v1, :cond_c

    .line 29
    .line 30
    aget-object v2, p3, v0

    .line 31
    .line 32
    invoke-virtual {p2, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    const-string v4, ""

    .line 37
    .line 38
    if-nez v3, :cond_0

    .line 39
    .line 40
    move-object v5, v4

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    :goto_1
    if-eqz v2, :cond_1

    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_1
    move-object v2, v4

    .line 50
    :goto_2
    const-string v4, "__bg_color__"

    .line 51
    .line 52
    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-eqz v4, :cond_2

    .line 57
    .line 58
    instance-of v4, v3, Ljava/lang/Integer;

    .line 59
    .line 60
    if-eqz v4, :cond_2

    .line 61
    .line 62
    check-cast v3, Ljava/lang/Integer;

    .line 63
    .line 64
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 69
    .line 70
    .line 71
    goto/16 :goto_3

    .line 72
    .line 73
    :cond_2
    const-string v4, "__bg_resource__"

    .line 74
    .line 75
    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    if-eqz v4, :cond_3

    .line 80
    .line 81
    instance-of v4, v3, Ljava/lang/Integer;

    .line 82
    .line 83
    if-eqz v4, :cond_3

    .line 84
    .line 85
    check-cast v3, Ljava/lang/Integer;

    .line 86
    .line 87
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 92
    .line 93
    .line 94
    goto/16 :goto_3

    .line 95
    .line 96
    :cond_3
    const-string v4, "__visibility__"

    .line 97
    .line 98
    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-eqz v2, :cond_4

    .line 103
    .line 104
    instance-of v2, v3, Ljava/lang/Integer;

    .line 105
    .line 106
    if-eqz v2, :cond_4

    .line 107
    .line 108
    check-cast v3, Ljava/lang/Integer;

    .line 109
    .line 110
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 115
    .line 116
    .line 117
    goto/16 :goto_3

    .line 118
    .line 119
    :cond_4
    instance-of v2, v1, Landroid/widget/Checkable;

    .line 120
    .line 121
    if-eqz v2, :cond_5

    .line 122
    .line 123
    instance-of v2, v3, Ljava/lang/Boolean;

    .line 124
    .line 125
    if-eqz v2, :cond_5

    .line 126
    .line 127
    move-object v2, v1

    .line 128
    check-cast v2, Landroid/widget/Checkable;

    .line 129
    .line 130
    check-cast v3, Ljava/lang/Boolean;

    .line 131
    .line 132
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    invoke-interface {v2, v3}, Landroid/widget/Checkable;->setChecked(Z)V

    .line 137
    .line 138
    .line 139
    iput-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->j:Landroid/view/View;

    .line 140
    .line 141
    goto/16 :goto_3

    .line 142
    .line 143
    :cond_5
    instance-of v2, v1, Landroid/widget/TextView;

    .line 144
    .line 145
    if-eqz v2, :cond_6

    .line 146
    .line 147
    check-cast v1, Landroid/widget/TextView;

    .line 148
    .line 149
    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    .line 151
    .line 152
    goto :goto_3

    .line 153
    :cond_6
    instance-of v2, v1, Landroid/widget/ImageView;

    .line 154
    .line 155
    const-string v4, "RemoteView"

    .line 156
    .line 157
    if-eqz v2, :cond_b

    .line 158
    .line 159
    instance-of v2, v3, Ljava/lang/Integer;

    .line 160
    .line 161
    if-eqz v2, :cond_7

    .line 162
    .line 163
    check-cast v1, Landroid/widget/ImageView;

    .line 164
    .line 165
    check-cast v3, Ljava/lang/Integer;

    .line 166
    .line 167
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 172
    .line 173
    .line 174
    goto :goto_3

    .line 175
    :cond_7
    instance-of v2, v3, Landroid/graphics/Bitmap;

    .line 176
    .line 177
    if-eqz v2, :cond_8

    .line 178
    .line 179
    check-cast v1, Landroid/widget/ImageView;

    .line 180
    .line 181
    check-cast v3, Landroid/graphics/Bitmap;

    .line 182
    .line 183
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 184
    .line 185
    .line 186
    goto :goto_3

    .line 187
    :cond_8
    instance-of v2, v3, Landroid/net/Uri;

    .line 188
    .line 189
    if-eqz v2, :cond_9

    .line 190
    .line 191
    move-object v2, v3

    .line 192
    check-cast v2, Landroid/net/Uri;

    .line 193
    .line 194
    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v5

    .line 198
    invoke-static {v5}, Lx1/O;->w5(Ljava/lang/String;)Z

    .line 199
    .line 200
    .line 201
    move-result v5

    .line 202
    if-eqz v5, :cond_9

    .line 203
    .line 204
    check-cast v1, Landroid/widget/ImageView;

    .line 205
    .line 206
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    .line 207
    .line 208
    .line 209
    goto :goto_3

    .line 210
    :cond_9
    if-nez v3, :cond_a

    .line 211
    .line 212
    check-cast v1, Landroid/widget/ImageView;

    .line 213
    .line 214
    const/4 v2, 0x0

    .line 215
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    .line 216
    .line 217
    .line 218
    goto :goto_3

    .line 219
    :cond_a
    new-instance v1, Ljava/lang/StringBuilder;

    .line 220
    .line 221
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 222
    .line 223
    .line 224
    const-string v2, "Unsupported data type "

    .line 225
    .line 226
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    invoke-static {v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    .line 238
    .line 239
    goto :goto_3

    .line 240
    :cond_b
    new-instance v2, Ljava/lang/StringBuilder;

    .line 241
    .line 242
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 243
    .line 244
    .line 245
    const-string v3, "Unsupported view type "

    .line 246
    .line 247
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    invoke-static {v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 258
    .line 259
    .line 260
    :cond_c
    :goto_3
    add-int/lit8 v0, v0, 0x1

    .line 261
    .line 262
    goto/16 :goto_0

    .line 263
    .line 264
    :cond_d
    return-void
.end method

.method private o(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const-string v0, "operations"

    .line 6
    .line 7
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    :goto_0
    array-length v1, p2

    .line 15
    if-ge v0, v1, :cond_0

    .line 16
    .line 17
    aget-object v1, p2, v0

    .line 18
    .line 19
    instance-of v2, v1, Landroid/os/Bundle;

    .line 20
    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    check-cast v1, Landroid/os/Bundle;

    .line 24
    .line 25
    invoke-direct {p0, p1, v1, p1}, Lcom/android/launcher3/cloudfolder/RemoteView;->k(Ljava/lang/Object;Landroid/os/Bundle;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    add-int/lit8 v0, v0, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method

.method private p(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Z)V
    .locals 8

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Lcom/android/launcher3/cloudfolder/RemoteView$f;->a(Lcom/android/launcher3/cloudfolder/RemoteView$f;)Ljava/util/HashMap;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    move-object v5, v1

    .line 28
    check-cast v5, Ljava/lang/String;

    .line 29
    .line 30
    const/4 v7, 0x0

    .line 31
    move-object v2, p0

    .line 32
    move-object v3, p1

    .line 33
    move-object v4, p2

    .line 34
    move v6, p3

    .line 35
    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher3/cloudfolder/RemoteView;->R(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Ljava/lang/String;ZZ)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-void
.end method

.method private r(Landroid/widget/FrameLayout;Landroid/view/View;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getId()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p2, p0}, Landroid/view/View;->setId(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getTag()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p2, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-virtual {p2, p0}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getScrollBarStyle()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-virtual {p2, p0}, Landroid/view/View;->setScrollBarStyle(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getScrollBarSize()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    invoke-virtual {p2, p0}, Landroid/view/View;->setScrollBarSize(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getPaddingRight()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getPaddingBottom()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    invoke-virtual {p2, p0, v0, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getOverScrollMode()I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    invoke-virtual {p2, p0}, Landroid/view/View;->setOverScrollMode(I)V

    .line 71
    .line 72
    .line 73
    new-instance p0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    const-string v0, "src.getId() ="

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getId()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v0, ",src.getTag()="

    .line 91
    .line 92
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getTag()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    const-string v0, "RemoteView"

    .line 107
    .line 108
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    instance-of p0, p2, Landroid/view/ViewGroup;

    .line 112
    .line 113
    if-eqz p0, :cond_0

    .line 114
    .line 115
    check-cast p2, Landroid/view/ViewGroup;

    .line 116
    .line 117
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getLayoutAnimation()Landroid/view/animation/LayoutAnimationController;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->setLayoutAnimation(Landroid/view/animation/LayoutAnimationController;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getDescendantFocusability()I

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getLayoutTransition()Landroid/animation/LayoutTransition;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 136
    .line 137
    .line 138
    :cond_0
    return-void
.end method

.method private s(Lcom/android/launcher3/cloudfolder/RemoteView$b;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object p0, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 4
    .line 5
    if-eqz p0, :cond_2

    .line 6
    .line 7
    invoke-static {p1}, Lcom/android/launcher3/cloudfolder/RemoteView$b;->c(Lcom/android/launcher3/cloudfolder/RemoteView$b;)Landroid/os/Bundle;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_2

    .line 12
    .line 13
    invoke-static {p1}, Lcom/android/launcher3/cloudfolder/RemoteView$b;->c(Lcom/android/launcher3/cloudfolder/RemoteView$b;)Landroid/os/Bundle;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "listview_ids"

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    array-length v0, p0

    .line 26
    if-lez v0, :cond_2

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    :goto_0
    array-length v1, p0

    .line 30
    if-ge v0, v1, :cond_2

    .line 31
    .line 32
    aget v1, p0, v0

    .line 33
    .line 34
    if-lez v1, :cond_1

    .line 35
    .line 36
    iget-object v2, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 37
    .line 38
    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    instance-of v2, v1, Landroidx/recyclerview/widget/RecyclerView;

    .line 43
    .line 44
    if-eqz v2, :cond_0

    .line 45
    .line 46
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    .line 47
    .line 48
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    instance-of v2, v1, Lcom/android/launcher3/cloudfolder/RemoteView$i;

    .line 53
    .line 54
    if-eqz v2, :cond_1

    .line 55
    .line 56
    check-cast v1, Lcom/android/launcher3/cloudfolder/RemoteView$i;

    .line 57
    .line 58
    invoke-static {v1}, Lcom/android/launcher3/cloudfolder/RemoteView$i;->g(Lcom/android/launcher3/cloudfolder/RemoteView$i;)V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_0
    instance-of v2, v1, Landroid/widget/AdapterView;

    .line 63
    .line 64
    if-eqz v2, :cond_1

    .line 65
    .line 66
    check-cast v1, Landroid/widget/AdapterView;

    .line 67
    .line 68
    invoke-virtual {v1}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    instance-of v2, v1, Lcom/android/launcher3/cloudfolder/RemoteView$h;

    .line 73
    .line 74
    if-eqz v2, :cond_1

    .line 75
    .line 76
    check-cast v1, Lcom/android/launcher3/cloudfolder/RemoteView$h;

    .line 77
    .line 78
    invoke-static {v1}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->d(Lcom/android/launcher3/cloudfolder/RemoteView$h;)V

    .line 79
    .line 80
    .line 81
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    return-void
.end method

.method private u(Ljava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "ensureRemoteContextAndInflater remotePackage:"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "RemoteView"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->f:Landroid/content/Context;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->g:Landroid/view/LayoutInflater;

    .line 28
    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    :cond_0
    if-eqz p1, :cond_2

    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->c:Landroid/content/Context;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    const/4 v2, 0x4

    .line 38
    const/4 v3, 0x0

    .line 39
    :try_start_0
    invoke-virtual {v0, p1, v2}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    goto :goto_0

    .line 44
    :catch_0
    move-exception p1

    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v2, "Failed to create remote context "

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    move-object p1, v3

    .line 66
    :goto_0
    if-eqz p1, :cond_2

    .line 67
    .line 68
    new-instance v0, Lcom/android/launcher3/cloudfolder/RemoteView$a;

    .line 69
    .line 70
    iget-object v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->c:Landroid/content/Context;

    .line 71
    .line 72
    invoke-direct {v0, p0, v2, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$a;-><init>(Lcom/android/launcher3/cloudfolder/RemoteView;Landroid/content/Context;Landroid/content/Context;)V

    .line 73
    .line 74
    .line 75
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->f:Landroid/content/Context;

    .line 76
    .line 77
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    if-eqz v0, :cond_2

    .line 82
    .line 83
    iget-object v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->f:Landroid/content/Context;

    .line 84
    .line 85
    invoke-virtual {v0, v2}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->g:Landroid/view/LayoutInflater;

    .line 90
    .line 91
    if-eqz v0, :cond_1

    .line 92
    .line 93
    const-string v0, "ensureRemoteContextAndInflater mRemoteInflater != null"

    .line 94
    .line 95
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    :try_start_1
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->g:Landroid/view/LayoutInflater;

    .line 99
    .line 100
    new-instance v2, Lcom/android/launcher3/cloudfolder/RemoteView$e;

    .line 101
    .line 102
    invoke-direct {v2, p0, v3}, Lcom/android/launcher3/cloudfolder/RemoteView$e;-><init>(Lcom/android/launcher3/cloudfolder/RemoteView;Ld1/h;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v2}, Landroid/view/LayoutInflater;->setFactory(Landroid/view/LayoutInflater$Factory;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 106
    .line 107
    .line 108
    goto :goto_1

    .line 109
    :catch_1
    move-exception v0

    .line 110
    new-instance v2, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 113
    .line 114
    .line 115
    const-string v3, "Failed to set inflater factory "

    .line 116
    .line 117
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    :cond_1
    :goto_1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    if-eqz p1, :cond_2

    .line 135
    .line 136
    iget v0, p1, Landroid/content/pm/ApplicationInfo;->theme:I

    .line 137
    .line 138
    if-lez v0, :cond_2

    .line 139
    .line 140
    :try_start_2
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->f:Landroid/content/Context;

    .line 141
    .line 142
    if-eqz v0, :cond_2

    .line 143
    .line 144
    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    if-eqz v0, :cond_2

    .line 149
    .line 150
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->f:Landroid/content/Context;

    .line 151
    .line 152
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    iget p1, p1, Landroid/content/pm/ApplicationInfo;->theme:I

    .line 157
    .line 158
    const/4 v0, 0x1

    .line 159
    invoke-virtual {p0, p1, v0}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 160
    .line 161
    .line 162
    goto :goto_2

    .line 163
    :catch_2
    move-exception p0

    .line 164
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 165
    .line 166
    .line 167
    :cond_2
    :goto_2
    return-void
.end method

.method private v(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;Z)Ljava/lang/reflect/Method;
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    instance-of p0, p1, Ljava/lang/Class;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    check-cast p1, Ljava/lang/Class;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :goto_0
    :try_start_0
    invoke-virtual {p1, p2, p3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 21
    .line 22
    .line 23
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    return-object p0

    .line 25
    :catch_0
    if-eqz p4, :cond_1

    .line 26
    .line 27
    new-instance p0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string p1, "Failed to get method "

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string p1, "RemoteView"

    .line 45
    .line 46
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    :cond_1
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method

.method private w(Landroid/os/Bundle;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6

    .line 1
    const-string v0, "getRemoteView"

    .line 2
    .line 3
    const-string v1, "RemoteView"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    if-eqz p1, :cond_2

    .line 10
    .line 11
    iget-object v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->c:Landroid/content/Context;

    .line 12
    .line 13
    if-eqz v2, :cond_2

    .line 14
    .line 15
    const-string v2, "remotepackage"

    .line 16
    .line 17
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-direct {p0, v2}, Lcom/android/launcher3/cloudfolder/RemoteView;->u(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v2, "remoteviews"

    .line 25
    .line 26
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Landroid/widget/RemoteViews;

    .line 31
    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    :try_start_0
    iget-object v3, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->c:Landroid/content/Context;

    .line 35
    .line 36
    invoke-virtual {v2, v3, p2}, Landroid/widget/RemoteViews;->apply(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    goto :goto_0

    .line 41
    :catch_0
    move-exception v3

    .line 42
    new-instance v4, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    const-string v5, "Failed to apply remote views "

    .line 48
    .line 49
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    :goto_0
    if-eqz v0, :cond_0

    .line 63
    .line 64
    invoke-virtual {v2}, Landroid/widget/RemoteViews;->getPackage()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-direct {p0, v3}, Lcom/android/launcher3/cloudfolder/RemoteView;->u(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-direct {p0, v0}, Lcom/android/launcher3/cloudfolder/RemoteView;->C(Landroid/view/View;)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    :cond_0
    const-string v3, "layout"

    .line 76
    .line 77
    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    iget-object v3, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->g:Landroid/view/LayoutInflater;

    .line 82
    .line 83
    if-eqz v3, :cond_2

    .line 84
    .line 85
    if-lez p1, :cond_2

    .line 86
    .line 87
    const/4 v4, 0x0

    .line 88
    :try_start_1
    invoke-virtual {v3, p1, p2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-direct {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView;->C(Landroid/view/View;)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    if-eqz p1, :cond_2

    .line 97
    .line 98
    if-eqz v2, :cond_1

    .line 99
    .line 100
    iget-object p2, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->c:Landroid/content/Context;

    .line 101
    .line 102
    invoke-virtual {v2, p2, p1}, Landroid/widget/RemoteViews;->reapply(Landroid/content/Context;Landroid/view/View;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :catch_1
    move-exception p1

    .line 107
    goto :goto_2

    .line 108
    :cond_1
    :goto_1
    move-object v0, p1

    .line 109
    goto :goto_3

    .line 110
    :goto_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 113
    .line 114
    .line 115
    const-string v2, "Failed to inflate remote layout "

    .line 116
    .line 117
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    invoke-static {v1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 131
    .line 132
    .line 133
    :cond_2
    :goto_3
    invoke-direct {p0, v0}, Lcom/android/launcher3/cloudfolder/RemoteView;->L(Landroid/view/View;)V

    .line 134
    .line 135
    .line 136
    return-object v0
.end method


# virtual methods
.method protected A(ILandroid/os/Bundle;Z)V
    .locals 12

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "handleRemoteUpdateView:"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    new-instance v1, Ljava/lang/Throwable;

    .line 12
    .line 13
    const-string v2, "handleRemoteUpdateView"

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "RemoteView"

    .line 30
    .line 31
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Landroid/os/Looper;->isCurrentThread()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_10

    .line 43
    .line 44
    if-eqz p3, :cond_0

    .line 45
    .line 46
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/cloudfolder/RemoteView;->Q(ILandroid/os/Bundle;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    iget-object p3, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 51
    .line 52
    invoke-virtual {p3, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;

    .line 57
    .line 58
    if-eqz p1, :cond_f

    .line 59
    .line 60
    iget-object p3, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 61
    .line 62
    if-eqz p3, :cond_f

    .line 63
    .line 64
    if-eqz p2, :cond_f

    .line 65
    .line 66
    const-string p3, "merge_more"

    .line 67
    .line 68
    invoke-virtual {p2, p3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    invoke-virtual {p2, p3}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    if-eqz v0, :cond_1

    .line 76
    .line 77
    invoke-static {p1}, Lcom/android/launcher3/cloudfolder/RemoteView$b;->c(Lcom/android/launcher3/cloudfolder/RemoteView$b;)Landroid/os/Bundle;

    .line 78
    .line 79
    .line 80
    move-result-object p3

    .line 81
    invoke-direct {p0, p3, p2}, Lcom/android/launcher3/cloudfolder/RemoteView;->H(Landroid/os/Bundle;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 82
    .line 83
    .line 84
    move-result-object p3

    .line 85
    invoke-static {p1, p3}, Lcom/android/launcher3/cloudfolder/RemoteView$b;->e(Lcom/android/launcher3/cloudfolder/RemoteView$b;Landroid/os/Bundle;)V

    .line 86
    .line 87
    .line 88
    :cond_1
    const-string p3, "remoteviews"

    .line 89
    .line 90
    invoke-virtual {p2, p3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 91
    .line 92
    .line 93
    move-result-object p3

    .line 94
    check-cast p3, Landroid/widget/RemoteViews;

    .line 95
    .line 96
    if-eqz p3, :cond_2

    .line 97
    .line 98
    :try_start_0
    iget-object v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->c:Landroid/content/Context;

    .line 99
    .line 100
    iget-object v3, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 101
    .line 102
    invoke-virtual {p3, v2, v3}, Landroid/widget/RemoteViews;->reapply(Landroid/content/Context;Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :catch_0
    move-exception p3

    .line 107
    new-instance v2, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 110
    .line 111
    .line 112
    const-string v3, "Failed to reapply remote views "

    .line 113
    .line 114
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p3

    .line 124
    invoke-static {v1, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    :cond_2
    :goto_0
    iget-object p3, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 128
    .line 129
    const-string v1, "data"

    .line 130
    .line 131
    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    const-string v2, "keys"

    .line 136
    .line 137
    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    const-string v3, "ids"

    .line 142
    .line 143
    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    invoke-direct {p0, p3, v1, v2, v3}, Lcom/android/launcher3/cloudfolder/RemoteView;->n(Landroid/view/View;Landroid/os/Bundle;[Ljava/lang/String;[I)V

    .line 148
    .line 149
    .line 150
    iget-object p3, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 151
    .line 152
    iget-object v1, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 153
    .line 154
    invoke-direct {p0, p3, p2, v1}, Lcom/android/launcher3/cloudfolder/RemoteView;->N(Landroid/view/View;Landroid/os/Bundle;Lcom/android/launcher3/cloudfolder/RemoteView$j;)V

    .line 155
    .line 156
    .line 157
    iget-object p3, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->f:Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 158
    .line 159
    iget-object v1, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 160
    .line 161
    const/4 v2, 0x1

    .line 162
    invoke-direct {p0, p3, v1, p2, v2}, Lcom/android/launcher3/cloudfolder/RemoteView;->j(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Landroid/os/Bundle;Z)V

    .line 163
    .line 164
    .line 165
    iget-object p3, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->g:Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 166
    .line 167
    iget-object v1, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 168
    .line 169
    invoke-direct {p0, p3, v1, p2, v2}, Lcom/android/launcher3/cloudfolder/RemoteView;->l(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Landroid/os/Bundle;Z)V

    .line 170
    .line 171
    .line 172
    const-string p3, "listview_ids"

    .line 173
    .line 174
    invoke-virtual {p2, p3}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 175
    .line 176
    .line 177
    move-result-object p3

    .line 178
    const-string v1, "items"

    .line 179
    .line 180
    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    const-string v2, "notify_ids"

    .line 185
    .line 186
    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 187
    .line 188
    .line 189
    move-result-object v2

    .line 190
    const-string v3, "notify_events"

    .line 191
    .line 192
    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p2

    .line 196
    if-eqz p3, :cond_f

    .line 197
    .line 198
    array-length v3, p3

    .line 199
    if-lez v3, :cond_f

    .line 200
    .line 201
    const/4 v3, 0x0

    .line 202
    move v4, v3

    .line 203
    :goto_1
    array-length v5, p3

    .line 204
    if-ge v4, v5, :cond_f

    .line 205
    .line 206
    aget v5, p3, v4

    .line 207
    .line 208
    if-lez v5, :cond_e

    .line 209
    .line 210
    new-instance v6, Lcom/android/launcher3/cloudfolder/RemoteView$k;

    .line 211
    .line 212
    iget-object v7, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 213
    .line 214
    invoke-direct {v6, v7}, Lcom/android/launcher3/cloudfolder/RemoteView$k;-><init>(Lcom/android/launcher3/cloudfolder/RemoteView$j;)V

    .line 215
    .line 216
    .line 217
    instance-of v7, p0, Lcom/android/launcher3/cloudfolder/b;

    .line 218
    .line 219
    if-eqz v7, :cond_3

    .line 220
    .line 221
    invoke-direct {p0, v5, v2}, Lcom/android/launcher3/cloudfolder/RemoteView;->B(I[I)I

    .line 222
    .line 223
    .line 224
    move-result v7

    .line 225
    if-ltz v7, :cond_8

    .line 226
    .line 227
    if-eqz p2, :cond_8

    .line 228
    .line 229
    array-length v8, p2

    .line 230
    if-ge v7, v8, :cond_8

    .line 231
    .line 232
    aget-object v8, p2, v7

    .line 233
    .line 234
    iget-object v9, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 235
    .line 236
    invoke-direct {p0, v6, v8, v9}, Lcom/android/launcher3/cloudfolder/RemoteView;->M(Lcom/android/launcher3/cloudfolder/RemoteView$k;Ljava/lang/String;Lcom/android/launcher3/cloudfolder/RemoteView$j;)V

    .line 237
    .line 238
    .line 239
    goto :goto_4

    .line 240
    :cond_3
    instance-of v7, p0, Lcom/android/launcher3/cloudfolder/c;

    .line 241
    .line 242
    if-eqz v7, :cond_7

    .line 243
    .line 244
    if-eqz v2, :cond_5

    .line 245
    .line 246
    array-length v7, v2

    .line 247
    if-lez v7, :cond_5

    .line 248
    .line 249
    move v7, v3

    .line 250
    :goto_2
    array-length v8, v2

    .line 251
    if-ge v7, v8, :cond_5

    .line 252
    .line 253
    aget v8, v2, v7

    .line 254
    .line 255
    if-ne v5, v8, :cond_4

    .line 256
    .line 257
    if-eqz p2, :cond_4

    .line 258
    .line 259
    array-length v8, p2

    .line 260
    if-ge v7, v8, :cond_4

    .line 261
    .line 262
    aget-object v8, p2, v7

    .line 263
    .line 264
    iget-object v9, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 265
    .line 266
    invoke-direct {p0, v6, v8, v9}, Lcom/android/launcher3/cloudfolder/RemoteView;->M(Lcom/android/launcher3/cloudfolder/RemoteView$k;Ljava/lang/String;Lcom/android/launcher3/cloudfolder/RemoteView$j;)V

    .line 267
    .line 268
    .line 269
    :cond_4
    add-int/lit8 v7, v7, 0x1

    .line 270
    .line 271
    goto :goto_2

    .line 272
    :cond_5
    invoke-direct {p0, v5, v2}, Lcom/android/launcher3/cloudfolder/RemoteView;->B(I[I)I

    .line 273
    .line 274
    .line 275
    move-result v7

    .line 276
    if-ltz v7, :cond_8

    .line 277
    .line 278
    move v8, v3

    .line 279
    :goto_3
    array-length v9, v2

    .line 280
    if-ge v8, v9, :cond_8

    .line 281
    .line 282
    aget v9, v2, v8

    .line 283
    .line 284
    if-ne v5, v9, :cond_6

    .line 285
    .line 286
    if-eqz p2, :cond_6

    .line 287
    .line 288
    array-length v9, p2

    .line 289
    if-ge v8, v9, :cond_6

    .line 290
    .line 291
    aget-object v9, p2, v8

    .line 292
    .line 293
    iget-object v10, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 294
    .line 295
    invoke-direct {p0, v6, v9, v10}, Lcom/android/launcher3/cloudfolder/RemoteView;->M(Lcom/android/launcher3/cloudfolder/RemoteView$k;Ljava/lang/String;Lcom/android/launcher3/cloudfolder/RemoteView$j;)V

    .line 296
    .line 297
    .line 298
    :cond_6
    add-int/lit8 v8, v8, 0x1

    .line 299
    .line 300
    goto :goto_3

    .line 301
    :cond_7
    move v7, v3

    .line 302
    :cond_8
    :goto_4
    if-eqz v1, :cond_a

    .line 303
    .line 304
    array-length v8, v1

    .line 305
    if-ge v4, v8, :cond_a

    .line 306
    .line 307
    aget-object v8, v1, v4

    .line 308
    .line 309
    instance-of v9, v8, Landroid/os/Bundle;

    .line 310
    .line 311
    if-eqz v9, :cond_a

    .line 312
    .line 313
    if-eqz v0, :cond_9

    .line 314
    .line 315
    invoke-static {p1}, Lcom/android/launcher3/cloudfolder/RemoteView$b;->b(Lcom/android/launcher3/cloudfolder/RemoteView$b;)Landroid/util/SparseArray;

    .line 316
    .line 317
    .line 318
    move-result-object v8

    .line 319
    invoke-virtual {v8, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 320
    .line 321
    .line 322
    move-result-object v8

    .line 323
    check-cast v8, Landroid/os/Bundle;

    .line 324
    .line 325
    aget-object v9, v1, v4

    .line 326
    .line 327
    check-cast v9, Landroid/os/Bundle;

    .line 328
    .line 329
    invoke-direct {p0, v8, v9}, Lcom/android/launcher3/cloudfolder/RemoteView;->G(Landroid/os/Bundle;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 330
    .line 331
    .line 332
    move-result-object v8

    .line 333
    goto :goto_5

    .line 334
    :cond_9
    check-cast v8, Landroid/os/Bundle;

    .line 335
    .line 336
    goto :goto_5

    .line 337
    :cond_a
    const/4 v8, 0x0

    .line 338
    :goto_5
    iget-object v9, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 339
    .line 340
    invoke-virtual {v9, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 341
    .line 342
    .line 343
    move-result-object v9

    .line 344
    instance-of v10, v9, Landroidx/recyclerview/widget/RecyclerView;

    .line 345
    .line 346
    if-eqz v10, :cond_c

    .line 347
    .line 348
    check-cast v9, Landroidx/recyclerview/widget/RecyclerView;

    .line 349
    .line 350
    invoke-virtual {v9}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 351
    .line 352
    .line 353
    move-result-object v9

    .line 354
    instance-of v10, v9, Lcom/android/launcher3/cloudfolder/RemoteView$i;

    .line 355
    .line 356
    if-eqz v10, :cond_e

    .line 357
    .line 358
    if-ltz v7, :cond_b

    .line 359
    .line 360
    move-object v7, v9

    .line 361
    check-cast v7, Lcom/android/launcher3/cloudfolder/RemoteView$i;

    .line 362
    .line 363
    invoke-static {v7, v6}, Lcom/android/launcher3/cloudfolder/RemoteView$i;->i(Lcom/android/launcher3/cloudfolder/RemoteView$i;Lcom/android/launcher3/cloudfolder/RemoteView$k;)V

    .line 364
    .line 365
    .line 366
    :cond_b
    if-eqz v8, :cond_e

    .line 367
    .line 368
    invoke-static {p1}, Lcom/android/launcher3/cloudfolder/RemoteView$b;->b(Lcom/android/launcher3/cloudfolder/RemoteView$b;)Landroid/util/SparseArray;

    .line 369
    .line 370
    .line 371
    move-result-object v6

    .line 372
    invoke-virtual {v6, v5, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 373
    .line 374
    .line 375
    check-cast v9, Lcom/android/launcher3/cloudfolder/RemoteView$i;

    .line 376
    .line 377
    invoke-static {v9, v8}, Lcom/android/launcher3/cloudfolder/RemoteView$i;->h(Lcom/android/launcher3/cloudfolder/RemoteView$i;Landroid/os/Bundle;)V

    .line 378
    .line 379
    .line 380
    goto :goto_6

    .line 381
    :cond_c
    instance-of v10, v9, Landroid/widget/AdapterView;

    .line 382
    .line 383
    if-eqz v10, :cond_e

    .line 384
    .line 385
    check-cast v9, Landroid/widget/AdapterView;

    .line 386
    .line 387
    invoke-virtual {v9}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    .line 388
    .line 389
    .line 390
    move-result-object v10

    .line 391
    instance-of v11, v10, Lcom/android/launcher3/cloudfolder/RemoteView$h;

    .line 392
    .line 393
    if-eqz v11, :cond_e

    .line 394
    .line 395
    if-ltz v7, :cond_d

    .line 396
    .line 397
    iget-object v7, v6, Lcom/android/launcher3/cloudfolder/RemoteView$k;->b:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 398
    .line 399
    invoke-virtual {v9, v7}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 400
    .line 401
    .line 402
    iget-object v7, v6, Lcom/android/launcher3/cloudfolder/RemoteView$k;->c:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 403
    .line 404
    invoke-virtual {v9, v7}, Landroid/widget/AdapterView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 405
    .line 406
    .line 407
    move-object v7, v10

    .line 408
    check-cast v7, Lcom/android/launcher3/cloudfolder/RemoteView$h;

    .line 409
    .line 410
    invoke-static {v7, v6}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->i(Lcom/android/launcher3/cloudfolder/RemoteView$h;Lcom/android/launcher3/cloudfolder/RemoteView$k;)V

    .line 411
    .line 412
    .line 413
    :cond_d
    if-eqz v8, :cond_e

    .line 414
    .line 415
    invoke-static {p1}, Lcom/android/launcher3/cloudfolder/RemoteView$b;->b(Lcom/android/launcher3/cloudfolder/RemoteView$b;)Landroid/util/SparseArray;

    .line 416
    .line 417
    .line 418
    move-result-object v6

    .line 419
    invoke-virtual {v6, v5, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 420
    .line 421
    .line 422
    check-cast v10, Lcom/android/launcher3/cloudfolder/RemoteView$h;

    .line 423
    .line 424
    invoke-static {v10, v8}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->g(Lcom/android/launcher3/cloudfolder/RemoteView$h;Landroid/os/Bundle;)V

    .line 425
    .line 426
    .line 427
    :cond_e
    :goto_6
    add-int/lit8 v4, v4, 0x1

    .line 428
    .line 429
    goto/16 :goto_1

    .line 430
    .line 431
    :cond_f
    return-void

    .line 432
    :cond_10
    const-string p0, "handleRemoteUpdateView, is not main thead"

    .line 433
    .line 434
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 435
    .line 436
    .line 437
    return-void
.end method

.method public I(ILandroid/os/Bundle;Lcom/android/launcher3/cloudfolder/RemoteView$l;)Landroid/view/View;
    .locals 3

    .line 1
    new-instance p3, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "remoteView open , clientId = "

    .line 7
    .line 8
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v0, ", bundle = "

    .line 15
    .line 16
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    const-string v0, "RemoteView"

    .line 27
    .line 28
    invoke-static {v0, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    iget-object p3, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->c:Landroid/content/Context;

    .line 32
    .line 33
    if-eqz p3, :cond_1

    .line 34
    .line 35
    iget-object p3, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 36
    .line 37
    invoke-virtual {p3, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    if-nez p3, :cond_1

    .line 42
    .line 43
    new-instance p3, Lcom/android/launcher3/cloudfolder/RemoteView$b;

    .line 44
    .line 45
    invoke-direct {p3}, Lcom/android/launcher3/cloudfolder/RemoteView$b;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {p3, p2}, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d(Lcom/android/launcher3/cloudfolder/RemoteView$b;Landroid/os/Bundle;)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Lcom/android/launcher3/cloudfolder/RemoteView$d;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->c:Landroid/content/Context;

    .line 54
    .line 55
    const/4 v2, 0x0

    .line 56
    invoke-direct {v0, p0, v1, p1, v2}, Lcom/android/launcher3/cloudfolder/RemoteView$d;-><init>(Lcom/android/launcher3/cloudfolder/RemoteView;Landroid/content/Context;ILd1/h;)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p3, Lcom/android/launcher3/cloudfolder/RemoteView$b;->c:Lcom/android/launcher3/cloudfolder/RemoteView$d;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->e:Landroid/view/ViewGroup$LayoutParams;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 64
    .line 65
    .line 66
    instance-of v0, p0, Lcom/android/launcher3/cloudfolder/c;

    .line 67
    .line 68
    if-eqz v0, :cond_0

    .line 69
    .line 70
    new-instance v0, Lcom/android/launcher3/cloudfolder/c$b;

    .line 71
    .line 72
    move-object v1, p0

    .line 73
    check-cast v1, Lcom/android/launcher3/cloudfolder/c;

    .line 74
    .line 75
    invoke-direct {v0, v1, p1}, Lcom/android/launcher3/cloudfolder/c$b;-><init>(Lcom/android/launcher3/cloudfolder/c;I)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_0
    new-instance v0, Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 80
    .line 81
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$j;-><init>(Lcom/android/launcher3/cloudfolder/RemoteView;I)V

    .line 82
    .line 83
    .line 84
    :goto_0
    iput-object v0, p3, Lcom/android/launcher3/cloudfolder/RemoteView$b;->e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 85
    .line 86
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 87
    .line 88
    invoke-virtual {v0, p1, p3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    iget-object p3, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->i:Lcom/android/launcher3/cloudfolder/RemoteView$c;

    .line 92
    .line 93
    invoke-interface {p3, p1, p2}, Lcom/android/launcher3/cloudfolder/RemoteView$c;->c(ILandroid/os/Bundle;)Landroid/os/Bundle;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/cloudfolder/RemoteView;->Q(ILandroid/os/Bundle;)V

    .line 98
    .line 99
    .line 100
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView;->x(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    return-object p0
.end method

.method protected J(Landroid/os/Bundle;)V
    .locals 6

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_3

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    instance-of v2, v1, Landroid/os/Bundle;

    .line 28
    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    check-cast v1, Landroid/os/Bundle;

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Lcom/android/launcher3/cloudfolder/RemoteView;->J(Landroid/os/Bundle;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    instance-of v2, v1, [Landroid/os/Parcelable;

    .line 38
    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    check-cast v1, [Landroid/os/Parcelable;

    .line 42
    .line 43
    array-length v2, v1

    .line 44
    const/4 v3, 0x0

    .line 45
    :goto_1
    if-ge v3, v2, :cond_0

    .line 46
    .line 47
    aget-object v4, v1, v3

    .line 48
    .line 49
    instance-of v5, v4, Landroid/os/Bundle;

    .line 50
    .line 51
    if-eqz v5, :cond_2

    .line 52
    .line 53
    check-cast v4, Landroid/os/Bundle;

    .line 54
    .line 55
    invoke-virtual {p0, v4}, Lcom/android/launcher3/cloudfolder/RemoteView;->J(Landroid/os/Bundle;)V

    .line 56
    .line 57
    .line 58
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_3
    return-void
.end method

.method protected K()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->c:Landroid/content/Context;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->d:Landroid/view/View;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 7
    .line 8
    if-eqz v1, :cond_2

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-lez v1, :cond_2

    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 17
    .line 18
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/4 v2, 0x0

    .line 23
    :goto_0
    if-ge v2, v1, :cond_1

    .line 24
    .line 25
    iget-object v3, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 26
    .line 27
    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lcom/android/launcher3/cloudfolder/RemoteView$b;

    .line 32
    .line 33
    if-eqz v3, :cond_0

    .line 34
    .line 35
    iget-object v4, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 36
    .line 37
    invoke-virtual {v4, v2}, Landroid/util/SparseArray;->keyAt(I)I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    iput-object v0, v3, Lcom/android/launcher3/cloudfolder/RemoteView$b;->c:Lcom/android/launcher3/cloudfolder/RemoteView$d;

    .line 42
    .line 43
    iput-object v0, v3, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 44
    .line 45
    iput-object v0, v3, Lcom/android/launcher3/cloudfolder/RemoteView$b;->e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 46
    .line 47
    iget-object v3, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->i:Lcom/android/launcher3/cloudfolder/RemoteView$c;

    .line 48
    .line 49
    if-eqz v3, :cond_0

    .line 50
    .line 51
    invoke-interface {v3, v4}, Lcom/android/launcher3/cloudfolder/RemoteView$c;->a(I)V

    .line 52
    .line 53
    .line 54
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 58
    .line 59
    invoke-virtual {v1}, Landroid/util/SparseArray;->clear()V

    .line 60
    .line 61
    .line 62
    :cond_2
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->f:Landroid/content/Context;

    .line 63
    .line 64
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->g:Landroid/view/LayoutInflater;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->i:Lcom/android/launcher3/cloudfolder/RemoteView$c;

    .line 67
    .line 68
    instance-of v2, v1, Lcom/android/launcher3/cloudfolder/b$a;

    .line 69
    .line 70
    if-eqz v2, :cond_3

    .line 71
    .line 72
    check-cast v1, Lcom/android/launcher3/cloudfolder/b$a;

    .line 73
    .line 74
    invoke-virtual {v1}, Lcom/android/launcher3/cloudfolder/b$a;->l()V

    .line 75
    .line 76
    .line 77
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->i:Lcom/android/launcher3/cloudfolder/RemoteView$c;

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_3
    instance-of v2, v1, Lcom/android/launcher3/cloudfolder/c$a;

    .line 81
    .line 82
    if-eqz v2, :cond_4

    .line 83
    .line 84
    check-cast v1, Lcom/android/launcher3/cloudfolder/c$a;

    .line 85
    .line 86
    invoke-virtual {v1}, Lcom/android/launcher3/cloudfolder/c$a;->l()V

    .line 87
    .line 88
    .line 89
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->i:Lcom/android/launcher3/cloudfolder/RemoteView$c;

    .line 90
    .line 91
    :cond_4
    :goto_1
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->j:Landroid/view/View;

    .line 92
    .line 93
    return-void
.end method

.method protected R(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Ljava/lang/String;ZZ)V
    .locals 2

    .line 1
    if-eqz p4, :cond_0

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, p3, p5}, Lcom/android/launcher3/cloudfolder/RemoteView;->T(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Ljava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    if-eqz p1, :cond_1

    .line 8
    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    invoke-static {p1}, Lcom/android/launcher3/cloudfolder/RemoteView$f;->a(Lcom/android/launcher3/cloudfolder/RemoteView$f;)Ljava/util/HashMap;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Landroid/util/SparseArray;

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    .line 24
    .line 25
    .line 26
    move-result p3

    .line 27
    const/4 p4, 0x0

    .line 28
    :goto_0
    if-ge p4, p3, :cond_1

    .line 29
    .line 30
    invoke-virtual {p1, p4}, Landroid/util/SparseArray;->keyAt(I)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p1, p4}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-direct {p0, v0, v1, p5}, Lcom/android/launcher3/cloudfolder/RemoteView;->m(Landroid/view/View;Ljava/lang/Object;Z)V

    .line 43
    .line 44
    .line 45
    add-int/lit8 p4, p4, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    return-void
.end method

.method protected S(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Ljava/lang/String;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    invoke-static {p1}, Lcom/android/launcher3/cloudfolder/RemoteView$f;->a(Lcom/android/launcher3/cloudfolder/RemoteView$f;)Ljava/util/HashMap;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Landroid/util/SparseArray;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    const/4 v0, 0x0

    .line 22
    :goto_0
    if-ge v0, p3, :cond_1

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->keyAt(I)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    instance-of v3, v2, Landroid/os/Bundle;

    .line 39
    .line 40
    if-eqz v3, :cond_0

    .line 41
    .line 42
    check-cast v2, Landroid/os/Bundle;

    .line 43
    .line 44
    invoke-direct {p0, v1, v2}, Lcom/android/launcher3/cloudfolder/RemoteView;->o(Landroid/view/View;Landroid/os/Bundle;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    return-void
.end method

.method public conditionOp(Ljava/lang/Object;Landroid/os/Bundle;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .annotation build Le/a;
    .end annotation

    .line 1
    if-eqz p2, :cond_5

    .line 2
    .line 3
    const-string v0, "op_param_value_0"

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    instance-of v1, v0, Landroid/os/Bundle;

    .line 10
    .line 11
    const-string v2, "op_method"

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    move-object v1, v0

    .line 16
    check-cast v1, Landroid/os/Bundle;

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    invoke-direct {p0, p1, v1, p3}, Lcom/android/launcher3/cloudfolder/RemoteView;->k(Ljava/lang/Object;Landroid/os/Bundle;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    :cond_0
    const-string v1, "op_param_value_1"

    .line 29
    .line 30
    invoke-virtual {p2, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    instance-of v3, v1, Landroid/os/Bundle;

    .line 35
    .line 36
    if-eqz v3, :cond_1

    .line 37
    .line 38
    move-object v3, v1

    .line 39
    check-cast v3, Landroid/os/Bundle;

    .line 40
    .line 41
    invoke-virtual {v3, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v4, :cond_1

    .line 46
    .line 47
    invoke-direct {p0, p1, v3, p3}, Lcom/android/launcher3/cloudfolder/RemoteView;->k(Ljava/lang/Object;Landroid/os/Bundle;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    :cond_1
    const-string v3, "op_param_value_2"

    .line 52
    .line 53
    invoke-virtual {p2, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    const-string v4, "op_param_value_3"

    .line 58
    .line 59
    invoke-virtual {p2, v4}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    const-string v5, "op_param_value_4"

    .line 64
    .line 65
    invoke-virtual {p2, v5}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    instance-of v5, v0, Ljava/lang/Comparable;

    .line 70
    .line 71
    if-eqz v5, :cond_5

    .line 72
    .line 73
    if-eqz v1, :cond_5

    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 80
    .line 81
    .line 82
    move-result-object v6

    .line 83
    invoke-virtual {v5, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 84
    .line 85
    .line 86
    move-result v5

    .line 87
    if-eqz v5, :cond_5

    .line 88
    .line 89
    check-cast v0, Ljava/lang/Comparable;

    .line 90
    .line 91
    invoke-interface {v0, v1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-lez v0, :cond_2

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_2
    if-nez v0, :cond_3

    .line 99
    .line 100
    move-object v3, v4

    .line 101
    goto :goto_0

    .line 102
    :cond_3
    move-object v3, p2

    .line 103
    :goto_0
    instance-of p2, v3, Landroid/os/Bundle;

    .line 104
    .line 105
    if-eqz p2, :cond_4

    .line 106
    .line 107
    move-object p2, v3

    .line 108
    check-cast p2, Landroid/os/Bundle;

    .line 109
    .line 110
    invoke-virtual {p2, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_4

    .line 115
    .line 116
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/cloudfolder/RemoteView;->k(Ljava/lang/Object;Landroid/os/Bundle;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    return-object p0

    .line 121
    :cond_4
    return-object v3

    .line 122
    :cond_5
    const/4 p0, 0x0

    .line 123
    return-object p0
.end method

.method public q(I)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Ld1/g;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ld1/g;-><init>(Lcom/android/launcher3/cloudfolder/RemoteView;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public t()V
    .locals 6

    .line 1
    const-string v0, "Dump RemoteView:"

    .line 2
    .line 3
    const-string v1, "RemoteView"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v2, "  mLocalContext: "

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->c:Landroid/content/Context;

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v2, "  mDefaultContent: "

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->d:Landroid/view/View;

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .line 56
    .line 57
    const-string v2, "  mRemoteContext: "

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget-object v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->f:Landroid/content/Context;

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    const-string v2, "  mRemoteInflater: "

    .line 80
    .line 81
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->g:Landroid/view/LayoutInflater;

    .line 85
    .line 86
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 97
    .line 98
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    new-instance v2, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .line 106
    .line 107
    const-string v3, "  mClients: "

    .line 108
    .line 109
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    const/4 v2, 0x0

    .line 123
    :goto_0
    const-string v3, "    "

    .line 124
    .line 125
    if-ge v2, v0, :cond_1

    .line 126
    .line 127
    new-instance v4, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    iget-object v3, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 136
    .line 137
    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->keyAt(I)I

    .line 138
    .line 139
    .line 140
    move-result v3

    .line 141
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    invoke-static {v1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    .line 150
    .line 151
    iget-object v3, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 152
    .line 153
    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    check-cast v3, Lcom/android/launcher3/cloudfolder/RemoteView$b;

    .line 158
    .line 159
    if-eqz v3, :cond_0

    .line 160
    .line 161
    new-instance v4, Ljava/lang/StringBuilder;

    .line 162
    .line 163
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 164
    .line 165
    .line 166
    const-string v5, "      mViewData: "

    .line 167
    .line 168
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-static {v3}, Lcom/android/launcher3/cloudfolder/RemoteView$b;->c(Lcom/android/launcher3/cloudfolder/RemoteView$b;)Landroid/os/Bundle;

    .line 172
    .line 173
    .line 174
    move-result-object v5

    .line 175
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v4

    .line 182
    invoke-static {v1, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    .line 184
    .line 185
    new-instance v4, Ljava/lang/StringBuilder;

    .line 186
    .line 187
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 188
    .line 189
    .line 190
    const-string v5, "      mInfo: "

    .line 191
    .line 192
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-static {v3}, Lcom/android/launcher3/cloudfolder/RemoteView$b;->a(Lcom/android/launcher3/cloudfolder/RemoteView$b;)Landroid/os/Bundle;

    .line 196
    .line 197
    .line 198
    move-result-object v5

    .line 199
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v4

    .line 206
    invoke-static {v1, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    .line 208
    .line 209
    new-instance v4, Ljava/lang/StringBuilder;

    .line 210
    .line 211
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 212
    .line 213
    .line 214
    const-string v5, "      mContainer: "

    .line 215
    .line 216
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    iget-object v5, v3, Lcom/android/launcher3/cloudfolder/RemoteView$b;->c:Lcom/android/launcher3/cloudfolder/RemoteView$d;

    .line 220
    .line 221
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v4

    .line 228
    invoke-static {v1, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    .line 230
    .line 231
    new-instance v4, Ljava/lang/StringBuilder;

    .line 232
    .line 233
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 234
    .line 235
    .line 236
    const-string v5, "      mView: "

    .line 237
    .line 238
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    iget-object v5, v3, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 242
    .line 243
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v4

    .line 250
    invoke-static {v1, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    .line 252
    .line 253
    new-instance v4, Ljava/lang/StringBuilder;

    .line 254
    .line 255
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 256
    .line 257
    .line 258
    const-string v5, "      mViewListener: "

    .line 259
    .line 260
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    iget-object v5, v3, Lcom/android/launcher3/cloudfolder/RemoteView$b;->e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 264
    .line 265
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v4

    .line 272
    invoke-static {v1, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    .line 274
    .line 275
    new-instance v4, Ljava/lang/StringBuilder;

    .line 276
    .line 277
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 278
    .line 279
    .line 280
    const-string v5, "      mViewUpdatedListener: "

    .line 281
    .line 282
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    const/4 v5, 0x0

    .line 286
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 287
    .line 288
    .line 289
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object v4

    .line 293
    invoke-static {v1, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    .line 295
    .line 296
    new-instance v4, Ljava/lang/StringBuilder;

    .line 297
    .line 298
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 299
    .line 300
    .line 301
    const-string v5, "      mAnimationCache: "

    .line 302
    .line 303
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    iget-object v5, v3, Lcom/android/launcher3/cloudfolder/RemoteView$b;->f:Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 307
    .line 308
    invoke-static {v5}, Lcom/android/launcher3/cloudfolder/RemoteView$f;->a(Lcom/android/launcher3/cloudfolder/RemoteView$f;)Ljava/util/HashMap;

    .line 309
    .line 310
    .line 311
    move-result-object v5

    .line 312
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 313
    .line 314
    .line 315
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v4

    .line 319
    invoke-static {v1, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    .line 321
    .line 322
    new-instance v4, Ljava/lang/StringBuilder;

    .line 323
    .line 324
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 325
    .line 326
    .line 327
    const-string v5, "      mOperationCache: "

    .line 328
    .line 329
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    iget-object v5, v3, Lcom/android/launcher3/cloudfolder/RemoteView$b;->g:Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 333
    .line 334
    invoke-static {v5}, Lcom/android/launcher3/cloudfolder/RemoteView$f;->a(Lcom/android/launcher3/cloudfolder/RemoteView$f;)Ljava/util/HashMap;

    .line 335
    .line 336
    .line 337
    move-result-object v5

    .line 338
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 339
    .line 340
    .line 341
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object v4

    .line 345
    invoke-static {v1, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 346
    .line 347
    .line 348
    new-instance v4, Ljava/lang/StringBuilder;

    .line 349
    .line 350
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 351
    .line 352
    .line 353
    const-string v5, "      mItemsData: "

    .line 354
    .line 355
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 356
    .line 357
    .line 358
    invoke-static {v3}, Lcom/android/launcher3/cloudfolder/RemoteView$b;->b(Lcom/android/launcher3/cloudfolder/RemoteView$b;)Landroid/util/SparseArray;

    .line 359
    .line 360
    .line 361
    move-result-object v3

    .line 362
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object v3

    .line 369
    invoke-static {v1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 370
    .line 371
    .line 372
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 373
    .line 374
    goto/16 :goto_0

    .line 375
    .line 376
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 377
    .line 378
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 379
    .line 380
    .line 381
    const-string v2, "  mSC: "

    .line 382
    .line 383
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 384
    .line 385
    .line 386
    iget-object v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->i:Lcom/android/launcher3/cloudfolder/RemoteView$c;

    .line 387
    .line 388
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 389
    .line 390
    .line 391
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object v0

    .line 395
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 396
    .line 397
    .line 398
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->i:Lcom/android/launcher3/cloudfolder/RemoteView$c;

    .line 399
    .line 400
    instance-of v0, p0, Lcom/android/launcher3/cloudfolder/b$a;

    .line 401
    .line 402
    if-eqz v0, :cond_2

    .line 403
    .line 404
    check-cast p0, Lcom/android/launcher3/cloudfolder/b$a;

    .line 405
    .line 406
    invoke-virtual {p0, v3}, Lcom/android/launcher3/cloudfolder/b$a;->k(Ljava/lang/String;)V

    .line 407
    .line 408
    .line 409
    return-void

    .line 410
    :cond_2
    instance-of v0, p0, Lcom/android/launcher3/cloudfolder/c$a;

    .line 411
    .line 412
    if-eqz v0, :cond_3

    .line 413
    .line 414
    check-cast p0, Lcom/android/launcher3/cloudfolder/c$a;

    .line 415
    .line 416
    invoke-virtual {p0, v3}, Lcom/android/launcher3/cloudfolder/c$a;->k(Ljava/lang/String;)V

    .line 417
    .line 418
    .line 419
    :cond_3
    return-void
.end method

.method public x(I)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/cloudfolder/RemoteView$b;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$b;->c:Lcom/android/launcher3/cloudfolder/RemoteView$d;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public y(Lcom/android/launcher3/folder/Folder;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->j:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string p0, "RemoteView"

    .line 7
    .line 8
    const-string p1, "isClickCheckedArea , mCheckBoxArea null"

    .line 9
    .line 10
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    return v1

    .line 14
    :cond_0
    check-cast v0, Landroid/widget/CheckBox;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->j:Landroid/view/View;

    .line 23
    .line 24
    invoke-virtual {p1, p0, p2}, Lcom/android/launcher3/folder/Folder;->s1(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return v1

    .line 32
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 33
    return p0
.end method

.method protected z()V
    .locals 5

    .line 1
    const-string v0, "RemoteView"

    .line 2
    .line 3
    const-string v1, "handleRemoteServiceConnected"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    if-ge v1, v0, :cond_1

    .line 16
    .line 17
    iget-object v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 18
    .line 19
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Lcom/android/launcher3/cloudfolder/RemoteView$b;

    .line 24
    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    iget-object v3, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 28
    .line 29
    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->keyAt(I)I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    iget-object v4, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->i:Lcom/android/launcher3/cloudfolder/RemoteView$c;

    .line 34
    .line 35
    invoke-static {v2}, Lcom/android/launcher3/cloudfolder/RemoteView$b;->a(Lcom/android/launcher3/cloudfolder/RemoteView$b;)Landroid/os/Bundle;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-interface {v4, v3, v2}, Lcom/android/launcher3/cloudfolder/RemoteView$c;->c(ILandroid/os/Bundle;)Landroid/os/Bundle;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-direct {p0, v3, v2}, Lcom/android/launcher3/cloudfolder/RemoteView;->Q(ILandroid/os/Bundle;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    return-void
.end method
