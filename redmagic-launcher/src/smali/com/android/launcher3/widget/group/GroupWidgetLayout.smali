.class public Lcom/android/launcher3/widget/group/GroupWidgetLayout;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "GroupWidgetLayout.java"


# instance fields
.field private g:Ljava/lang/String;

.field private h:Lcom/android/launcher3/widget/group/f;

.field private i:Ljava/lang/String;

.field private j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

.field private k:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

.field private l:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

.field private m:Lcom/android/launcher3/widget/group/GroupWidgetData;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/group/GroupWidgetLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    const-string p1, "GroupWidgetLayout"

    iput-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 4
    const-string p1, ""

    iput-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->i:Ljava/lang/String;

    return-void
.end method

.method private a(Landroid/view/View;)V
    .locals 2

    .line 1
    instance-of v0, p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    instance-of v0, p1, Lcom/android/launcher3/widget/group/f;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    if-eqz p1, :cond_2

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    instance-of v0, v0, Landroid/view/ViewGroup;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Landroid/view/View;

    .line 32
    .line 33
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->a(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    :cond_2
    :goto_0
    return-void
.end method

.method private getGroupWidgetId()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->h:Lcom/android/launcher3/widget/group/f;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/launcher3/widget/group/f;->getAppWidgetId()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method private getGroupWidgetProviderInfo()Landroid/appwidget/AppWidgetProviderInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->h:Lcom/android/launcher3/widget/group/f;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/launcher3/widget/group/f;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method private getGroupWidgetRootHostViewTag()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private l(Lcom/android/launcher3/widget/group/GroupWidgetData;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->h:Lcom/android/launcher3/widget/group/f;

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    iget-object v0, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "update mGroupWidgetHostView null return"

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    instance-of v2, v2, Lcom/android/launcher3/C2;

    .line 22
    .line 23
    if-nez v2, :cond_1

    .line 24
    .line 25
    iget-object v1, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 26
    .line 27
    new-instance v2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v3, "update Launcher error return, getContext="

    .line 33
    .line 34
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Lcom/android/launcher3/C2;

    .line 57
    .line 58
    iget-object v3, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 59
    .line 60
    new-instance v4, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    const-string v5, "update start groupWidgetData="

    .line 66
    .line 67
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    new-instance v5, Lcom/google/gson/f;

    .line 71
    .line 72
    invoke-direct {v5}, Lcom/google/gson/f;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v5, v1}, Lcom/google/gson/f;->s(Ljava/lang/Object;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    if-eqz v1, :cond_2

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/android/launcher3/widget/group/GroupWidgetData;->isAvailable()Z

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    if-eqz v5, :cond_2

    .line 96
    .line 97
    iget-object v5, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->m:Lcom/android/launcher3/widget/group/GroupWidgetData;

    .line 98
    .line 99
    invoke-virtual {v1, v5}, Lcom/android/launcher3/widget/group/GroupWidgetData;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v5

    .line 103
    if-eqz v5, :cond_3

    .line 104
    .line 105
    :cond_2
    const/4 v3, 0x0

    .line 106
    const/4 v5, 0x1

    .line 107
    goto/16 :goto_f

    .line 108
    .line 109
    :cond_3
    iget-object v5, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 110
    .line 111
    new-instance v6, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    const-string v7, "update start getChildCount="

    .line 117
    .line 118
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    iget-object v7, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 122
    .line 123
    invoke-virtual {v7}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 124
    .line 125
    .line 126
    move-result v7

    .line 127
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    const-string v7, " getScrollY="

    .line 131
    .line 132
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    iget-object v7, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 136
    .line 137
    invoke-virtual {v7}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 138
    .line 139
    .line 140
    move-result v7

    .line 141
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v6

    .line 148
    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    .line 150
    .line 151
    iput-object v1, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->m:Lcom/android/launcher3/widget/group/GroupWidgetData;

    .line 152
    .line 153
    iget v5, v1, Lcom/android/launcher3/widget/group/GroupWidgetData;->bgColor:I

    .line 154
    .line 155
    if-nez v5, :cond_4

    .line 156
    .line 157
    iget v5, v1, Lcom/android/launcher3/widget/group/GroupWidgetData;->bgDarkColor:I

    .line 158
    .line 159
    if-eqz v5, :cond_6

    .line 160
    .line 161
    :cond_4
    iget-object v5, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->k:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 162
    .line 163
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 164
    .line 165
    .line 166
    move-result-object v6

    .line 167
    invoke-static {v6}, Lcom/android/launcher3/N5;->x(Landroid/content/Context;)Z

    .line 168
    .line 169
    .line 170
    move-result v6

    .line 171
    if-eqz v6, :cond_5

    .line 172
    .line 173
    iget-object v6, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->m:Lcom/android/launcher3/widget/group/GroupWidgetData;

    .line 174
    .line 175
    iget v6, v6, Lcom/android/launcher3/widget/group/GroupWidgetData;->bgDarkColor:I

    .line 176
    .line 177
    goto :goto_0

    .line 178
    :cond_5
    iget-object v6, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->m:Lcom/android/launcher3/widget/group/GroupWidgetData;

    .line 179
    .line 180
    iget v6, v6, Lcom/android/launcher3/widget/group/GroupWidgetData;->bgColor:I

    .line 181
    .line 182
    :goto_0
    invoke-virtual {v5, v6}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->setBgColor(I)V

    .line 183
    .line 184
    .line 185
    :cond_6
    invoke-virtual {v1}, Lcom/android/launcher3/widget/group/GroupWidgetData;->getWidgetList()Ljava/util/ArrayList;

    .line 186
    .line 187
    .line 188
    move-result-object v5

    .line 189
    new-instance v6, Ljava/util/HashMap;

    .line 190
    .line 191
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 195
    .line 196
    .line 197
    move-result-object v7

    .line 198
    :cond_7
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 199
    .line 200
    .line 201
    move-result v8

    .line 202
    if-eqz v8, :cond_9

    .line 203
    .line 204
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v8

    .line 208
    check-cast v8, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;

    .line 209
    .line 210
    if-eqz v8, :cond_7

    .line 211
    .line 212
    new-instance v9, Landroid/content/ComponentName;

    .line 213
    .line 214
    iget-object v10, v8, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;->pkg:Ljava/lang/String;

    .line 215
    .line 216
    iget-object v11, v8, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;->cls:Ljava/lang/String;

    .line 217
    .line 218
    invoke-direct {v9, v10, v11}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {v6, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v10

    .line 225
    if-nez v10, :cond_8

    .line 226
    .line 227
    new-instance v10, Ljava/util/ArrayList;

    .line 228
    .line 229
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v6, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    :cond_8
    invoke-virtual {v6, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v9

    .line 239
    check-cast v9, Ljava/util/ArrayList;

    .line 240
    .line 241
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    goto :goto_1

    .line 245
    :cond_9
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 246
    .line 247
    .line 248
    move-result-object v7

    .line 249
    invoke-static {v7}, Lcom/android/launcher3/widget/group/GroupWidgetUtils;->r(Landroid/content/Context;)Ljava/util/HashMap;

    .line 250
    .line 251
    .line 252
    move-result-object v7

    .line 253
    iget-object v8, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 254
    .line 255
    new-instance v9, Ljava/lang/StringBuilder;

    .line 256
    .line 257
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 258
    .line 259
    .line 260
    const-string v10, "update readAddedOtherWidgetIdsInGroupWidget savedIdMap="

    .line 261
    .line 262
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v9

    .line 272
    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    .line 274
    .line 275
    invoke-direct {v0}, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->getGroupWidgetId()I

    .line 276
    .line 277
    .line 278
    move-result v8

    .line 279
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 280
    .line 281
    .line 282
    move-result-object v9

    .line 283
    invoke-virtual {v7, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result v9

    .line 287
    if-nez v9, :cond_a

    .line 288
    .line 289
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 290
    .line 291
    .line 292
    move-result-object v9

    .line 293
    new-instance v10, Ljava/util/ArrayList;

    .line 294
    .line 295
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 296
    .line 297
    .line 298
    invoke-virtual {v7, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    .line 300
    .line 301
    :cond_a
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 302
    .line 303
    .line 304
    move-result-object v8

    .line 305
    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object v8

    .line 309
    check-cast v8, Ljava/util/ArrayList;

    .line 310
    .line 311
    invoke-virtual {v6}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 312
    .line 313
    .line 314
    move-result-object v9

    .line 315
    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 316
    .line 317
    .line 318
    move-result-object v9

    .line 319
    const/4 v10, 0x0

    .line 320
    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 321
    .line 322
    .line 323
    move-result v11

    .line 324
    const/4 v12, 0x0

    .line 325
    if-eqz v11, :cond_12

    .line 326
    .line 327
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    move-result-object v11

    .line 331
    check-cast v11, Landroid/content/ComponentName;

    .line 332
    .line 333
    invoke-virtual {v6, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 334
    .line 335
    .line 336
    move-result-object v13

    .line 337
    check-cast v13, Ljava/util/ArrayList;

    .line 338
    .line 339
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 340
    .line 341
    .line 342
    move-result-object v14

    .line 343
    :goto_3
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    .line 344
    .line 345
    .line 346
    move-result v15

    .line 347
    if-eqz v15, :cond_c

    .line 348
    .line 349
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 350
    .line 351
    .line 352
    move-result-object v15

    .line 353
    check-cast v15, Lcom/android/launcher3/widget/group/GroupWidgetUtils$WidgetIdData;

    .line 354
    .line 355
    new-instance v4, Landroid/content/ComponentName;

    .line 356
    .line 357
    const/16 v16, 0x1

    .line 358
    .line 359
    iget-object v3, v15, Lcom/android/launcher3/widget/group/GroupWidgetUtils$WidgetIdData;->pkg:Ljava/lang/String;

    .line 360
    .line 361
    move-object/from16 v17, v6

    .line 362
    .line 363
    iget-object v6, v15, Lcom/android/launcher3/widget/group/GroupWidgetUtils$WidgetIdData;->cls:Ljava/lang/String;

    .line 364
    .line 365
    invoke-direct {v4, v3, v6}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 366
    .line 367
    .line 368
    invoke-virtual {v11, v4}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 369
    .line 370
    .line 371
    move-result v3

    .line 372
    if-eqz v3, :cond_b

    .line 373
    .line 374
    move-object v12, v15

    .line 375
    :cond_b
    move-object/from16 v6, v17

    .line 376
    .line 377
    goto :goto_3

    .line 378
    :cond_c
    move-object/from16 v17, v6

    .line 379
    .line 380
    const/16 v16, 0x1

    .line 381
    .line 382
    if-nez v12, :cond_d

    .line 383
    .line 384
    new-instance v12, Lcom/android/launcher3/widget/group/GroupWidgetUtils$WidgetIdData;

    .line 385
    .line 386
    invoke-virtual {v11}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object v3

    .line 390
    invoke-virtual {v11}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object v4

    .line 394
    invoke-direct {v12, v3, v4}, Lcom/android/launcher3/widget/group/GroupWidgetUtils$WidgetIdData;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 395
    .line 396
    .line 397
    invoke-virtual {v8, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 398
    .line 399
    .line 400
    :cond_d
    iget-object v3, v12, Lcom/android/launcher3/widget/group/GroupWidgetUtils$WidgetIdData;->idList:Ljava/util/ArrayList;

    .line 401
    .line 402
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 403
    .line 404
    .line 405
    move-result v3

    .line 406
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    .line 407
    .line 408
    .line 409
    move-result v4

    .line 410
    if-ge v3, v4, :cond_f

    .line 411
    .line 412
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    .line 413
    .line 414
    .line 415
    move-result v3

    .line 416
    iget-object v4, v12, Lcom/android/launcher3/widget/group/GroupWidgetUtils$WidgetIdData;->idList:Ljava/util/ArrayList;

    .line 417
    .line 418
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 419
    .line 420
    .line 421
    move-result v4

    .line 422
    sub-int/2addr v3, v4

    .line 423
    const/4 v4, 0x0

    .line 424
    :goto_4
    if-ge v4, v3, :cond_e

    .line 425
    .line 426
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->I1()Lcom/android/launcher3/widget/l0;

    .line 427
    .line 428
    .line 429
    move-result-object v6

    .line 430
    invoke-virtual {v6}, Lcom/android/launcher3/widget/l0;->r()I

    .line 431
    .line 432
    .line 433
    move-result v6

    .line 434
    iget-object v10, v12, Lcom/android/launcher3/widget/group/GroupWidgetUtils$WidgetIdData;->idList:Ljava/util/ArrayList;

    .line 435
    .line 436
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 437
    .line 438
    .line 439
    move-result-object v14

    .line 440
    invoke-virtual {v10, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 441
    .line 442
    .line 443
    iget-object v10, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 444
    .line 445
    new-instance v14, Ljava/lang/StringBuilder;

    .line 446
    .line 447
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 448
    .line 449
    .line 450
    const-string v15, "update allocateAppWidgetId newAppWidgetId="

    .line 451
    .line 452
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 453
    .line 454
    .line 455
    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 456
    .line 457
    .line 458
    const-string v6, " cName="

    .line 459
    .line 460
    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 461
    .line 462
    .line 463
    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 464
    .line 465
    .line 466
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 467
    .line 468
    .line 469
    move-result-object v6

    .line 470
    invoke-static {v10, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 471
    .line 472
    .line 473
    add-int/lit8 v4, v4, 0x1

    .line 474
    .line 475
    goto :goto_4

    .line 476
    :cond_e
    move/from16 v10, v16

    .line 477
    .line 478
    :cond_f
    const/4 v3, 0x0

    .line 479
    :goto_5
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    .line 480
    .line 481
    .line 482
    move-result v4

    .line 483
    if-ge v3, v4, :cond_11

    .line 484
    .line 485
    invoke-virtual {v13, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 486
    .line 487
    .line 488
    move-result-object v4

    .line 489
    check-cast v4, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;

    .line 490
    .line 491
    iget-object v6, v12, Lcom/android/launcher3/widget/group/GroupWidgetUtils$WidgetIdData;->idList:Ljava/util/ArrayList;

    .line 492
    .line 493
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 494
    .line 495
    .line 496
    move-result v6

    .line 497
    if-ge v3, v6, :cond_10

    .line 498
    .line 499
    iget-object v6, v12, Lcom/android/launcher3/widget/group/GroupWidgetUtils$WidgetIdData;->idList:Ljava/util/ArrayList;

    .line 500
    .line 501
    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 502
    .line 503
    .line 504
    move-result-object v6

    .line 505
    check-cast v6, Ljava/lang/Integer;

    .line 506
    .line 507
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 508
    .line 509
    .line 510
    move-result v6

    .line 511
    iput v6, v4, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;->appWidgetId:I

    .line 512
    .line 513
    iput v3, v4, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;->appWidgetIndex:I

    .line 514
    .line 515
    :cond_10
    add-int/lit8 v3, v3, 0x1

    .line 516
    .line 517
    goto :goto_5

    .line 518
    :cond_11
    move-object/from16 v6, v17

    .line 519
    .line 520
    goto/16 :goto_2

    .line 521
    .line 522
    :cond_12
    const/16 v16, 0x1

    .line 523
    .line 524
    if-eqz v10, :cond_13

    .line 525
    .line 526
    iget-object v3, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 527
    .line 528
    new-instance v4, Ljava/lang/StringBuilder;

    .line 529
    .line 530
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 531
    .line 532
    .line 533
    const-string v6, "update savedChanged saveOtherWidgetIdsInGroupWidget savedIdMap="

    .line 534
    .line 535
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 536
    .line 537
    .line 538
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 539
    .line 540
    .line 541
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 542
    .line 543
    .line 544
    move-result-object v4

    .line 545
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 546
    .line 547
    .line 548
    invoke-static {v2, v7}, Lcom/android/launcher3/widget/group/GroupWidgetUtils;->t(Landroid/content/Context;Ljava/util/HashMap;)V

    .line 549
    .line 550
    .line 551
    :cond_13
    iget-object v2, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 552
    .line 553
    new-instance v3, Ljava/lang/StringBuilder;

    .line 554
    .line 555
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 556
    .line 557
    .line 558
    const-string v4, "update   end widgetList.size="

    .line 559
    .line 560
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 561
    .line 562
    .line 563
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 564
    .line 565
    .line 566
    move-result v4

    .line 567
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 568
    .line 569
    .line 570
    const-string v4, " groupWidgetData="

    .line 571
    .line 572
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 573
    .line 574
    .line 575
    new-instance v4, Lcom/google/gson/f;

    .line 576
    .line 577
    invoke-direct {v4}, Lcom/google/gson/f;-><init>()V

    .line 578
    .line 579
    .line 580
    invoke-virtual {v4, v1}, Lcom/google/gson/f;->s(Ljava/lang/Object;)Ljava/lang/String;

    .line 581
    .line 582
    .line 583
    move-result-object v1

    .line 584
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 585
    .line 586
    .line 587
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 588
    .line 589
    .line 590
    move-result-object v1

    .line 591
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 592
    .line 593
    .line 594
    new-instance v1, Ljava/util/ArrayList;

    .line 595
    .line 596
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 597
    .line 598
    .line 599
    const/4 v2, 0x0

    .line 600
    :goto_6
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 601
    .line 602
    .line 603
    move-result v3

    .line 604
    if-ge v2, v3, :cond_17

    .line 605
    .line 606
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 607
    .line 608
    .line 609
    move-result-object v3

    .line 610
    check-cast v3, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;

    .line 611
    .line 612
    if-eqz v3, :cond_16

    .line 613
    .line 614
    invoke-virtual {v3}, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;->isAvailable()Z

    .line 615
    .line 616
    .line 617
    move-result v4

    .line 618
    if-eqz v4, :cond_16

    .line 619
    .line 620
    iget v4, v3, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;->spanX:I

    .line 621
    .line 622
    const/4 v6, 0x4

    .line 623
    if-ne v4, v6, :cond_14

    .line 624
    .line 625
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 626
    .line 627
    .line 628
    goto :goto_7

    .line 629
    :cond_14
    const/4 v6, 0x2

    .line 630
    if-ne v4, v6, :cond_16

    .line 631
    .line 632
    add-int/lit8 v4, v2, 0x1

    .line 633
    .line 634
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 635
    .line 636
    .line 637
    move-result v7

    .line 638
    if-ge v4, v7, :cond_15

    .line 639
    .line 640
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 641
    .line 642
    .line 643
    move-result-object v7

    .line 644
    check-cast v7, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;

    .line 645
    .line 646
    iget v7, v7, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;->spanX:I

    .line 647
    .line 648
    if-ne v7, v6, :cond_15

    .line 649
    .line 650
    new-instance v2, Landroid/util/Pair;

    .line 651
    .line 652
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 653
    .line 654
    .line 655
    move-result-object v6

    .line 656
    check-cast v6, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;

    .line 657
    .line 658
    invoke-direct {v2, v3, v6}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 659
    .line 660
    .line 661
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 662
    .line 663
    .line 664
    move v2, v4

    .line 665
    goto :goto_7

    .line 666
    :cond_15
    new-instance v4, Landroid/util/Pair;

    .line 667
    .line 668
    invoke-direct {v4, v3, v12}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 669
    .line 670
    .line 671
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 672
    .line 673
    .line 674
    :cond_16
    :goto_7
    add-int/lit8 v2, v2, 0x1

    .line 675
    .line 676
    goto :goto_6

    .line 677
    :cond_17
    const/4 v2, 0x0

    .line 678
    :goto_8
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 679
    .line 680
    .line 681
    move-result v3

    .line 682
    if-ge v2, v3, :cond_1a

    .line 683
    .line 684
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 685
    .line 686
    .line 687
    move-result-object v3

    .line 688
    iget-object v4, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 689
    .line 690
    new-instance v5, Ljava/lang/StringBuilder;

    .line 691
    .line 692
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 693
    .line 694
    .line 695
    const-string v6, "update row i="

    .line 696
    .line 697
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 698
    .line 699
    .line 700
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 701
    .line 702
    .line 703
    const-string v6, " row="

    .line 704
    .line 705
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 706
    .line 707
    .line 708
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 709
    .line 710
    .line 711
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 712
    .line 713
    .line 714
    move-result-object v5

    .line 715
    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 716
    .line 717
    .line 718
    instance-of v4, v3, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;

    .line 719
    .line 720
    if-eqz v4, :cond_18

    .line 721
    .line 722
    iget-object v4, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 723
    .line 724
    check-cast v3, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;

    .line 725
    .line 726
    move/from16 v5, v16

    .line 727
    .line 728
    invoke-direct {v0, v4, v3, v5}, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->m(Landroid/view/ViewGroup;Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;Z)V

    .line 729
    .line 730
    .line 731
    goto :goto_9

    .line 732
    :cond_18
    move/from16 v5, v16

    .line 733
    .line 734
    instance-of v4, v3, Landroid/util/Pair;

    .line 735
    .line 736
    if-eqz v4, :cond_19

    .line 737
    .line 738
    check-cast v3, Landroid/util/Pair;

    .line 739
    .line 740
    invoke-direct {v0, v3}, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->n(Landroid/util/Pair;)V

    .line 741
    .line 742
    .line 743
    :cond_19
    :goto_9
    add-int/lit8 v2, v2, 0x1

    .line 744
    .line 745
    move/from16 v16, v5

    .line 746
    .line 747
    goto :goto_8

    .line 748
    :cond_1a
    new-instance v2, Ljava/util/ArrayList;

    .line 749
    .line 750
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 751
    .line 752
    .line 753
    const/4 v3, 0x0

    .line 754
    :goto_a
    iget-object v4, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 755
    .line 756
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 757
    .line 758
    .line 759
    move-result v4

    .line 760
    const v5, 0x7f0b02c0

    .line 761
    .line 762
    .line 763
    if-ge v3, v4, :cond_1c

    .line 764
    .line 765
    iget-object v4, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 766
    .line 767
    invoke-virtual {v4, v3}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 768
    .line 769
    .line 770
    move-result-object v4

    .line 771
    invoke-virtual {v4, v5}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 772
    .line 773
    .line 774
    move-result-object v6

    .line 775
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 776
    .line 777
    .line 778
    move-result v6

    .line 779
    if-nez v6, :cond_1b

    .line 780
    .line 781
    iget-object v6, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 782
    .line 783
    new-instance v7, Ljava/lang/StringBuilder;

    .line 784
    .line 785
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 786
    .line 787
    .line 788
    const-string v8, "update remove child tag="

    .line 789
    .line 790
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 791
    .line 792
    .line 793
    invoke-virtual {v4, v5}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 794
    .line 795
    .line 796
    move-result-object v5

    .line 797
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 798
    .line 799
    .line 800
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 801
    .line 802
    .line 803
    move-result-object v5

    .line 804
    invoke-static {v6, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 805
    .line 806
    .line 807
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 808
    .line 809
    .line 810
    :cond_1b
    add-int/lit8 v3, v3, 0x1

    .line 811
    .line 812
    goto :goto_a

    .line 813
    :cond_1c
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 814
    .line 815
    .line 816
    move-result-object v2

    .line 817
    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 818
    .line 819
    .line 820
    move-result v3

    .line 821
    if-eqz v3, :cond_1d

    .line 822
    .line 823
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 824
    .line 825
    .line 826
    move-result-object v3

    .line 827
    check-cast v3, Landroid/view/View;

    .line 828
    .line 829
    iget-object v4, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 830
    .line 831
    invoke-virtual {v4, v3}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 832
    .line 833
    .line 834
    goto :goto_b

    .line 835
    :cond_1d
    const/4 v2, 0x0

    .line 836
    :goto_c
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 837
    .line 838
    .line 839
    move-result v3

    .line 840
    if-ge v2, v3, :cond_21

    .line 841
    .line 842
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 843
    .line 844
    .line 845
    move-result-object v3

    .line 846
    const/4 v4, 0x0

    .line 847
    :goto_d
    iget-object v6, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 848
    .line 849
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 850
    .line 851
    .line 852
    move-result v6

    .line 853
    if-ge v4, v6, :cond_1f

    .line 854
    .line 855
    iget-object v6, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 856
    .line 857
    invoke-virtual {v6, v4}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 858
    .line 859
    .line 860
    move-result-object v6

    .line 861
    invoke-virtual {v6, v5}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 862
    .line 863
    .line 864
    move-result-object v7

    .line 865
    invoke-virtual {v3, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 866
    .line 867
    .line 868
    move-result v7

    .line 869
    if-eqz v7, :cond_1e

    .line 870
    .line 871
    goto :goto_e

    .line 872
    :cond_1e
    add-int/lit8 v4, v4, 0x1

    .line 873
    .line 874
    goto :goto_d

    .line 875
    :cond_1f
    move-object v6, v12

    .line 876
    :goto_e
    if-eqz v6, :cond_20

    .line 877
    .line 878
    invoke-virtual {v6}, Landroid/view/View;->bringToFront()V

    .line 879
    .line 880
    .line 881
    :cond_20
    add-int/lit8 v2, v2, 0x1

    .line 882
    .line 883
    goto :goto_c

    .line 884
    :cond_21
    iget-object v1, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->m:Lcom/android/launcher3/widget/group/GroupWidgetData;

    .line 885
    .line 886
    iget v1, v1, Lcom/android/launcher3/widget/group/GroupWidgetData;->defaultPageIndex:I

    .line 887
    .line 888
    if-ltz v1, :cond_22

    .line 889
    .line 890
    iget-object v2, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 891
    .line 892
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 893
    .line 894
    .line 895
    move-result v2

    .line 896
    if-ge v1, v2, :cond_22

    .line 897
    .line 898
    iget-object v2, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 899
    .line 900
    new-instance v3, Ljava/lang/StringBuilder;

    .line 901
    .line 902
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 903
    .line 904
    .line 905
    const-string v4, "update snapToPage defaultPageIndex="

    .line 906
    .line 907
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 908
    .line 909
    .line 910
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 911
    .line 912
    .line 913
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 914
    .line 915
    .line 916
    move-result-object v3

    .line 917
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 918
    .line 919
    .line 920
    iget-object v2, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 921
    .line 922
    const/4 v3, 0x0

    .line 923
    invoke-virtual {v2, v1, v3, v3}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->z(IZZ)V

    .line 924
    .line 925
    .line 926
    :cond_22
    iget-object v0, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 927
    .line 928
    invoke-virtual {v0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->s()V

    .line 929
    .line 930
    .line 931
    return-void

    .line 932
    :goto_f
    iget-object v2, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 933
    .line 934
    new-instance v4, Ljava/lang/StringBuilder;

    .line 935
    .line 936
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 937
    .line 938
    .line 939
    const-string v6, "update mGroupWidgetHostView return, no need update. isAvailable="

    .line 940
    .line 941
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 942
    .line 943
    .line 944
    if-eqz v1, :cond_23

    .line 945
    .line 946
    invoke-virtual {v1}, Lcom/android/launcher3/widget/group/GroupWidgetData;->isAvailable()Z

    .line 947
    .line 948
    .line 949
    move-result v1

    .line 950
    if-eqz v1, :cond_23

    .line 951
    .line 952
    move v3, v5

    .line 953
    :cond_23
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 954
    .line 955
    .line 956
    const-string v1, " mGroupWidgetData="

    .line 957
    .line 958
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 959
    .line 960
    .line 961
    iget-object v0, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->m:Lcom/android/launcher3/widget/group/GroupWidgetData;

    .line 962
    .line 963
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 964
    .line 965
    .line 966
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 967
    .line 968
    .line 969
    move-result-object v0

    .line 970
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 971
    .line 972
    .line 973
    return-void
.end method

.method private m(Landroid/view/ViewGroup;Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;Z)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    const-string v3, " widget="

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    if-eqz v1, :cond_c

    .line 11
    .line 12
    if-eqz v2, :cond_c

    .line 13
    .line 14
    invoke-virtual {v2}, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;->isAvailable()Z

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    if-nez v5, :cond_0

    .line 19
    .line 20
    goto/16 :goto_4

    .line 21
    .line 22
    :cond_0
    :goto_0
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    const v6, 0x7f0b02ba

    .line 27
    .line 28
    .line 29
    if-ge v4, v5, :cond_2

    .line 30
    .line 31
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    instance-of v8, v5, Lcom/android/launcher3/widget/group/c;

    .line 36
    .line 37
    if-eqz v8, :cond_1

    .line 38
    .line 39
    invoke-virtual {v5, v6}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v8

    .line 43
    invoke-virtual {v2, v8}, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v8

    .line 47
    if-eqz v8, :cond_1

    .line 48
    .line 49
    check-cast v5, Lcom/android/launcher3/widget/group/c;

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    const/4 v5, 0x0

    .line 56
    :goto_1
    if-eqz v5, :cond_3

    .line 57
    .line 58
    iget-object v0, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 59
    .line 60
    new-instance v1, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    const-string v3, "updateOtherWidgetView existView exist return, widget="

    .line 66
    .line 67
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_3
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    if-nez v4, :cond_4

    .line 86
    .line 87
    iget-object v0, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 88
    .line 89
    const-string v1, "updateOtherWidgetView bgDataModel null return"

    .line 90
    .line 91
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_4
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    instance-of v4, v4, Lcom/android/launcher3/C2;

    .line 100
    .line 101
    if-nez v4, :cond_5

    .line 102
    .line 103
    iget-object v1, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 104
    .line 105
    new-instance v2, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 108
    .line 109
    .line 110
    const-string v3, "updateOtherWidgetView Launcher error return, getContext="

    .line 111
    .line 112
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 131
    .line 132
    .line 133
    move-result-object v4

    .line 134
    check-cast v4, Lcom/android/launcher3/C2;

    .line 135
    .line 136
    new-instance v5, Landroid/content/ComponentName;

    .line 137
    .line 138
    iget-object v8, v2, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;->pkg:Ljava/lang/String;

    .line 139
    .line 140
    iget-object v9, v2, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;->cls:Ljava/lang/String;

    .line 141
    .line 142
    invoke-direct {v5, v8, v9}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->A2()Lcom/android/launcher3/widget/Y0;

    .line 146
    .line 147
    .line 148
    move-result-object v8

    .line 149
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 150
    .line 151
    .line 152
    move-result-object v9

    .line 153
    invoke-virtual {v8, v5, v9}, Lcom/android/launcher3/widget/Y0;->d(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/widget/U;

    .line 154
    .line 155
    .line 156
    move-result-object v8

    .line 157
    if-nez v8, :cond_6

    .line 158
    .line 159
    iget-object v1, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 160
    .line 161
    new-instance v3, Ljava/lang/StringBuilder;

    .line 162
    .line 163
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 164
    .line 165
    .line 166
    invoke-direct {v0}, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->getGroupWidgetRootHostViewTag()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string v0, "updateOtherWidgetView widget="

    .line 174
    .line 175
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    const-string v0, " otherWidgetProviderInfo null, otherProvider="

    .line 182
    .line 183
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    .line 195
    .line 196
    return-void

    .line 197
    :cond_6
    iget v9, v2, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;->appWidgetId:I

    .line 198
    .line 199
    new-instance v10, Landroid/os/Bundle;

    .line 200
    .line 201
    invoke-direct {v10}, Landroid/os/Bundle;-><init>()V

    .line 202
    .line 203
    .line 204
    new-instance v11, Lcom/google/gson/f;

    .line 205
    .line 206
    invoke-direct {v11}, Lcom/google/gson/f;-><init>()V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v11, v2}, Lcom/google/gson/f;->s(Ljava/lang/Object;)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v11

    .line 213
    const-string v12, "widgetData"

    .line 214
    .line 215
    invoke-virtual {v10, v12, v11}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->A2()Lcom/android/launcher3/widget/Y0;

    .line 219
    .line 220
    .line 221
    move-result-object v11

    .line 222
    invoke-virtual {v11, v9, v8, v10}, Lcom/android/launcher3/widget/Y0;->c(ILandroid/appwidget/AppWidgetProviderInfo;Landroid/os/Bundle;)Z

    .line 223
    .line 224
    .line 225
    move-result v11

    .line 226
    iget-object v13, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 227
    .line 228
    new-instance v14, Ljava/lang/StringBuilder;

    .line 229
    .line 230
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 231
    .line 232
    .line 233
    const-string v15, "updateOtherWidgetView bind="

    .line 234
    .line 235
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    const-string v7, " otherAppWidgetId="

    .line 242
    .line 243
    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v3

    .line 259
    invoke-static {v13, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    .line 261
    .line 262
    if-nez v11, :cond_8

    .line 263
    .line 264
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->A2()Lcom/android/launcher3/widget/Y0;

    .line 265
    .line 266
    .line 267
    move-result-object v3

    .line 268
    invoke-virtual {v3}, Lcom/android/launcher3/widget/Y0;->f()Landroid/appwidget/AppWidgetManager;

    .line 269
    .line 270
    .line 271
    move-result-object v3

    .line 272
    invoke-virtual {v3, v9}, Landroid/appwidget/AppWidgetManager;->getAppWidgetOptions(I)Landroid/os/Bundle;

    .line 273
    .line 274
    .line 275
    move-result-object v3

    .line 276
    iget-object v13, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 277
    .line 278
    new-instance v14, Ljava/lang/StringBuilder;

    .line 279
    .line 280
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 281
    .line 282
    .line 283
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    .line 285
    .line 286
    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 287
    .line 288
    .line 289
    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 293
    .line 294
    .line 295
    const-string v15, " old widget="

    .line 296
    .line 297
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    if-eqz v3, :cond_7

    .line 301
    .line 302
    invoke-virtual {v3, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v3

    .line 306
    goto :goto_2

    .line 307
    :cond_7
    const/4 v3, 0x0

    .line 308
    :goto_2
    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v3

    .line 315
    invoke-static {v13, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 316
    .line 317
    .line 318
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->A2()Lcom/android/launcher3/widget/Y0;

    .line 319
    .line 320
    .line 321
    move-result-object v3

    .line 322
    invoke-virtual {v3}, Lcom/android/launcher3/widget/Y0;->f()Landroid/appwidget/AppWidgetManager;

    .line 323
    .line 324
    .line 325
    move-result-object v3

    .line 326
    invoke-virtual {v3, v9, v10}, Landroid/appwidget/AppWidgetManager;->updateAppWidgetOptions(ILandroid/os/Bundle;)V

    .line 327
    .line 328
    .line 329
    :cond_8
    invoke-direct {v0}, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->getGroupWidgetId()I

    .line 330
    .line 331
    .line 332
    move-result v3

    .line 333
    invoke-static {v3, v9}, Lcom/android/launcher3/widget/group/GroupWidgetUtils;->b(II)V

    .line 334
    .line 335
    .line 336
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->I1()Lcom/android/launcher3/widget/l0;

    .line 337
    .line 338
    .line 339
    move-result-object v3

    .line 340
    invoke-virtual {v3, v9, v8}, Lcom/android/launcher3/widget/l0;->v(ILcom/android/launcher3/widget/U;)Landroid/appwidget/AppWidgetHostView;

    .line 341
    .line 342
    .line 343
    move-result-object v3

    .line 344
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 345
    .line 346
    const/4 v10, -0x1

    .line 347
    invoke-direct {v4, v10, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 348
    .line 349
    .line 350
    const/16 v10, 0x11

    .line 351
    .line 352
    iput v10, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 353
    .line 354
    invoke-virtual {v3, v4}, Landroid/appwidget/AppWidgetHostView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 355
    .line 356
    .line 357
    invoke-static {v9, v8}, Lcom/android/launcher3/model/data/y;->createNewItemInfoForGroupOtherWidget(ILcom/android/launcher3/widget/U;)Lcom/android/launcher3/model/data/y;

    .line 358
    .line 359
    .line 360
    move-result-object v4

    .line 361
    invoke-virtual {v3, v4}, Landroid/appwidget/AppWidgetHostView;->setTag(Ljava/lang/Object;)V

    .line 362
    .line 363
    .line 364
    invoke-virtual {v3, v6, v2}, Landroid/appwidget/AppWidgetHostView;->setTag(ILjava/lang/Object;)V

    .line 365
    .line 366
    .line 367
    if-eqz p3, :cond_9

    .line 368
    .line 369
    const v4, 0x7f0b02c0

    .line 370
    .line 371
    .line 372
    invoke-virtual {v3, v4, v2}, Landroid/appwidget/AppWidgetHostView;->setTag(ILjava/lang/Object;)V

    .line 373
    .line 374
    .line 375
    :cond_9
    invoke-virtual {v8}, Lcom/android/launcher3/widget/U;->getLabel()Ljava/lang/CharSequence;

    .line 376
    .line 377
    .line 378
    move-result-object v4

    .line 379
    invoke-static {v4}, Lx1/i0;->a(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object v4

    .line 383
    invoke-static {v4}, Lx1/O;->i0(Ljava/lang/String;)Ljava/lang/String;

    .line 384
    .line 385
    .line 386
    move-result-object v4

    .line 387
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 388
    .line 389
    .line 390
    move-result v6

    .line 391
    if-eqz v6, :cond_a

    .line 392
    .line 393
    const-string v4, ""

    .line 394
    .line 395
    :cond_a
    const v6, 0x7f0b02b9

    .line 396
    .line 397
    .line 398
    invoke-virtual {v3, v6, v4}, Landroid/appwidget/AppWidgetHostView;->setTag(ILjava/lang/Object;)V

    .line 399
    .line 400
    .line 401
    iget-boolean v2, v2, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;->forceUseWidgetTitle:Z

    .line 402
    .line 403
    if-eqz v2, :cond_b

    .line 404
    .line 405
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 406
    .line 407
    goto :goto_3

    .line 408
    :cond_b
    const/4 v2, 0x0

    .line 409
    :goto_3
    const v6, 0x7f0b02b8

    .line 410
    .line 411
    .line 412
    invoke-virtual {v3, v6, v2}, Landroid/appwidget/AppWidgetHostView;->setTag(ILjava/lang/Object;)V

    .line 413
    .line 414
    .line 415
    iget-object v2, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 416
    .line 417
    new-instance v6, Ljava/lang/StringBuilder;

    .line 418
    .line 419
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 420
    .line 421
    .line 422
    invoke-direct {v0}, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->getGroupWidgetRootHostViewTag()Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object v8

    .line 426
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 427
    .line 428
    .line 429
    const-string v8, "updateOtherWidgetView loadWidgetView 1 getGroupWidgetId="

    .line 430
    .line 431
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    .line 433
    .line 434
    invoke-direct {v0}, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->getGroupWidgetId()I

    .line 435
    .line 436
    .line 437
    move-result v8

    .line 438
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 439
    .line 440
    .line 441
    const-string v8, " getAppWidgetInfo="

    .line 442
    .line 443
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 444
    .line 445
    .line 446
    invoke-direct {v0}, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->getGroupWidgetProviderInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 447
    .line 448
    .line 449
    move-result-object v8

    .line 450
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 451
    .line 452
    .line 453
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 454
    .line 455
    .line 456
    move-result-object v6

    .line 457
    invoke-static {v2, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 458
    .line 459
    .line 460
    iget-object v2, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 461
    .line 462
    new-instance v6, Ljava/lang/StringBuilder;

    .line 463
    .line 464
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 465
    .line 466
    .line 467
    invoke-direct {v0}, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->getGroupWidgetRootHostViewTag()Ljava/lang/String;

    .line 468
    .line 469
    .line 470
    move-result-object v0

    .line 471
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 472
    .line 473
    .line 474
    const-string v0, "updateOtherWidgetView loadWidgetView 2 bind="

    .line 475
    .line 476
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 477
    .line 478
    .line 479
    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 480
    .line 481
    .line 482
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 483
    .line 484
    .line 485
    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 486
    .line 487
    .line 488
    const-string v0, " otherWidgetTitle="

    .line 489
    .line 490
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 491
    .line 492
    .line 493
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 494
    .line 495
    .line 496
    const-string v0, " otherProvider="

    .line 497
    .line 498
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 499
    .line 500
    .line 501
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 502
    .line 503
    .line 504
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 505
    .line 506
    .line 507
    move-result-object v0

    .line 508
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 509
    .line 510
    .line 511
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 512
    .line 513
    .line 514
    return-void

    .line 515
    :cond_c
    :goto_4
    iget-object v0, v0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 516
    .line 517
    new-instance v5, Ljava/lang/StringBuilder;

    .line 518
    .line 519
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 520
    .line 521
    .line 522
    const-string v6, "updateOtherWidgetView otherWidgetParent or widget error return, otherWidgetParent="

    .line 523
    .line 524
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 525
    .line 526
    .line 527
    if-eqz v1, :cond_d

    .line 528
    .line 529
    const/4 v4, 0x1

    .line 530
    :cond_d
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 531
    .line 532
    .line 533
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 534
    .line 535
    .line 536
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 537
    .line 538
    .line 539
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 540
    .line 541
    .line 542
    move-result-object v1

    .line 543
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 544
    .line 545
    .line 546
    return-void
.end method

.method private n(Landroid/util/Pair;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;",
            "Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 4
    .line 5
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const v3, 0x7f0b02c0

    .line 10
    .line 11
    .line 12
    if-ge v1, v2, :cond_1

    .line 13
    .line 14
    iget-object v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 15
    .line 16
    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    const v5, 0x7f0b02be

    .line 27
    .line 28
    .line 29
    if-ne v4, v5, :cond_0

    .line 30
    .line 31
    invoke-virtual {v2, v3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual {p1, v4}, Landroid/util/Pair;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-eqz v4, :cond_0

    .line 40
    .line 41
    check-cast v2, Landroid/view/ViewGroup;

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const/4 v2, 0x0

    .line 48
    :goto_1
    if-nez v2, :cond_2

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const v2, 0x7f0e00f6

    .line 59
    .line 60
    .line 61
    iget-object v4, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 62
    .line 63
    invoke-virtual {v1, v2, v4, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Landroid/view/ViewGroup;

    .line 68
    .line 69
    invoke-virtual {v1, v3, p1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    iget-object v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 73
    .line 74
    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 75
    .line 76
    .line 77
    const v2, 0x7f0b02bc

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    check-cast v2, Landroid/view/ViewGroup;

    .line 85
    .line 86
    iget-object v3, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 87
    .line 88
    check-cast v3, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;

    .line 89
    .line 90
    invoke-direct {p0, v2, v3, v0}, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->m(Landroid/view/ViewGroup;Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;Z)V

    .line 91
    .line 92
    .line 93
    const v2, 0x7f0b02bd

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    check-cast v1, Landroid/view/ViewGroup;

    .line 101
    .line 102
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 103
    .line 104
    check-cast p1, Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;

    .line 105
    .line 106
    invoke-direct {p0, v1, p1, v0}, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->m(Landroid/view/ViewGroup;Lcom/android/launcher3/widget/group/GroupWidgetData$Widget;Z)V

    .line 107
    .line 108
    .line 109
    :cond_2
    return-void
.end method


# virtual methods
.method public getBgBlurImageView()Lcom/android/launcher3/blur/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->k:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->getBgBlurImageView()Lcom/android/launcher3/blur/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method protected getGroupWidgetContainer()Lcom/android/launcher3/widget/group/GroupWidgetContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOtherWidgetHostViewList()Ljava/util/ArrayList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroid/appwidget/AppWidgetHostView;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    iget-object v3, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 9
    .line 10
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-ge v2, v3, :cond_3

    .line 15
    .line 16
    iget-object v3, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 17
    .line 18
    invoke-virtual {v3, v2}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    instance-of v4, v3, Landroid/appwidget/AppWidgetHostView;

    .line 23
    .line 24
    if-eqz v4, :cond_0

    .line 25
    .line 26
    check-cast v3, Landroid/appwidget/AppWidgetHostView;

    .line 27
    .line 28
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    instance-of v4, v3, Landroid/view/ViewGroup;

    .line 33
    .line 34
    if-eqz v4, :cond_2

    .line 35
    .line 36
    const v4, 0x7f0b02c0

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3, v4}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    instance-of v4, v4, Landroid/util/Pair;

    .line 44
    .line 45
    if-eqz v4, :cond_2

    .line 46
    .line 47
    const v4, 0x7f0b02bc

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    check-cast v4, Landroid/view/ViewGroup;

    .line 55
    .line 56
    const v5, 0x7f0b02bd

    .line 57
    .line 58
    .line 59
    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    check-cast v3, Landroid/view/ViewGroup;

    .line 64
    .line 65
    if-eqz v4, :cond_1

    .line 66
    .line 67
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    if-lez v5, :cond_1

    .line 72
    .line 73
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    instance-of v5, v5, Landroid/appwidget/AppWidgetHostView;

    .line 78
    .line 79
    if-eqz v5, :cond_1

    .line 80
    .line 81
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    check-cast v4, Landroid/appwidget/AppWidgetHostView;

    .line 86
    .line 87
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    :cond_1
    if-eqz v3, :cond_2

    .line 91
    .line 92
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 93
    .line 94
    .line 95
    move-result v4

    .line 96
    if-lez v4, :cond_2

    .line 97
    .line 98
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    instance-of v4, v4, Landroid/appwidget/AppWidgetHostView;

    .line 103
    .line 104
    if-eqz v4, :cond_2

    .line 105
    .line 106
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    check-cast v3, Landroid/appwidget/AppWidgetHostView;

    .line 111
    .line 112
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_3
    return-object v0
.end method

.method protected i(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "onLauncherTextColorChanged color=0x"

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->setPageIndicatorColor(I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public j(Lcom/android/launcher3/widget/group/f;Ljava/lang/String;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->h:Lcom/android/launcher3/widget/group/f;

    .line 2
    .line 3
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const-string v0, ""

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move-object p2, v0

    .line 13
    :goto_0
    iput-object p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->i:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->h:Lcom/android/launcher3/widget/group/f;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->k:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 20
    .line 21
    invoke-virtual {p1, v1, p2, v2}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->y(Lcom/android/launcher3/widget/group/f;Ljava/lang/String;Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;)V

    .line 22
    .line 23
    .line 24
    new-instance p1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string p2, "GroupWidgetLayout{"

    .line 30
    .line 31
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->h:Lcom/android/launcher3/widget/group/f;

    .line 35
    .line 36
    instance-of v1, p2, Lcom/android/launcher3/widget/T;

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    check-cast p2, Lcom/android/launcher3/widget/T;

    .line 41
    .line 42
    invoke-virtual {p2}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    invoke-virtual {p2}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iget-object v1, v1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 53
    .line 54
    if-eqz v1, :cond_1

    .line 55
    .line 56
    invoke-virtual {p2}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    iget-object p2, p2, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 61
    .line 62
    invoke-virtual {p2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    :cond_1
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string p2, "}"

    .line 70
    .line 71
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iput-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 79
    .line 80
    return-void
.end method

.method public k(Lcom/android/launcher3/widget/group/GroupWidgetData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->l(Lcom/android/launcher3/widget/group/GroupWidgetData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->getGroupWidgetRootHostViewTag()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v2, " onAttachedToWindow"

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    invoke-direct {p0, p0}, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->a(Landroid/view/View;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->g:Ljava/lang/String;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->getGroupWidgetRootHostViewTag()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string p0, " onDetachedFromWindow"

    .line 19
    .line 20
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method protected onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b02b7

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 14
    .line 15
    const v0, 0x7f0b02bb

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->l:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->setPageIndicator(Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;)V

    .line 29
    .line 30
    .line 31
    const/high16 v0, 0x1020000

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->k:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget v0, v0, Lcom/android/launcher3/X3;->m0:I

    .line 58
    .line 59
    iget-object v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 60
    .line 61
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    instance-of v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 66
    .line 67
    if-eqz v1, :cond_0

    .line 68
    .line 69
    iget-object v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 70
    .line 71
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 76
    .line 77
    iput v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 78
    .line 79
    iput v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 80
    .line 81
    iget-object v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->j:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 82
    .line 83
    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 84
    .line 85
    .line 86
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->k:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 87
    .line 88
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    instance-of v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 93
    .line 94
    if-eqz v1, :cond_1

    .line 95
    .line 96
    iget-object v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->k:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 97
    .line 98
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 103
    .line 104
    iput v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 105
    .line 106
    iput v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 107
    .line 108
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->k:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 109
    .line 110
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 111
    .line 112
    .line 113
    :cond_1
    return-void
.end method

.method protected setPageIndicatorColor(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->l:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/pageindicators/c;->setColor(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
