.class public Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;
.super Lcom/android/launcher3/widget/custom/ai/r;
.source "AICustomWidgetTopNoticeLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;
    }
.end annotation


# instance fields
.field private j:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;

.field private k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;",
            ">;"
        }
    .end annotation
.end field

.field private l:I

.field private m:I

.field private n:I

.field private o:I

.field private p:Lcom/android/launcher3/widget/custom/ai/r$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/widget/custom/ai/r;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->k:Ljava/util/ArrayList;

    const/4 p1, 0x0

    .line 4
    iput p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->l:I

    .line 5
    iput p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->m:I

    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070098

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->n:I

    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f07009d

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->o:I

    .line 8
    new-instance p1, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$a;

    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$a;-><init>(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;)V

    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->p:Lcom/android/launcher3/widget/custom/ai/r$a;

    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;)Z
    .locals 3

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;->isAvailable()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 13
    :goto_1
    if-eqz v0, :cond_2

    .line 14
    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v2, "updateViewsByNoticeData remove noticeData="

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string v1, "AICustomWidgetTopNoticeLayout"

    .line 33
    .line 34
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    :cond_2
    return v0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method protected f(Ljava/util/ArrayList;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "updateViewsByNoticeData noticeDataList.size="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move-object v2, v1

    .line 24
    :goto_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v2, "AICustomWidgetTopNoticeLayout"

    .line 32
    .line 33
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    sget-boolean v0, Lcom/android/launcher3/widget/custom/ai/n;->u:Z

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string v3, "updateViewsByNoticeData noticeDataList="

    .line 46
    .line 47
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    new-instance v3, Lcom/google/gson/f;

    .line 51
    .line 52
    invoke-direct {v3}, Lcom/google/gson/f;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, p1}, Lcom/google/gson/f;->s(Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    :cond_1
    if-nez p1, :cond_2

    .line 70
    .line 71
    return-void

    .line 72
    :cond_2
    new-instance v0, Lcom/android/launcher3/widget/custom/ai/p;

    .line 73
    .line 74
    invoke-direct {v0}, Lcom/android/launcher3/widget/custom/ai/p;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 78
    .line 79
    .line 80
    new-instance v0, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    if-eqz v3, :cond_6

    .line 94
    .line 95
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    check-cast v3, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;

    .line 100
    .line 101
    iget-object v4, v3, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;->pkg:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    :cond_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 108
    .line 109
    .line 110
    move-result v6

    .line 111
    if-eqz v6, :cond_4

    .line 112
    .line 113
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v6

    .line 117
    check-cast v6, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 118
    .line 119
    if-eqz v6, :cond_3

    .line 120
    .line 121
    iget-object v7, v6, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->a:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v7

    .line 127
    if-eqz v7, :cond_3

    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_4
    move-object v6, v1

    .line 131
    :goto_2
    if-nez v6, :cond_5

    .line 132
    .line 133
    new-instance v6, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 134
    .line 135
    invoke-direct {v6, v4, v1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;-><init>(Ljava/lang/String;Lcom/android/launcher3/widget/custom/ai/q;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    :cond_5
    iget-object v4, v6, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->b:Ljava/util/ArrayList;

    .line 142
    .line 143
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    goto :goto_1

    .line 147
    :cond_6
    new-instance p1, Ljava/util/ArrayList;

    .line 148
    .line 149
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    :cond_7
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    const/4 v4, 0x4

    .line 161
    const/4 v5, 0x7

    .line 162
    const/4 v6, 0x0

    .line 163
    if-eqz v3, :cond_b

    .line 164
    .line 165
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    check-cast v3, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 170
    .line 171
    if-eqz v3, :cond_a

    .line 172
    .line 173
    invoke-virtual {v3}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->a()Z

    .line 174
    .line 175
    .line 176
    move-result v7

    .line 177
    if-nez v7, :cond_8

    .line 178
    .line 179
    goto :goto_4

    .line 180
    :cond_8
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 181
    .line 182
    .line 183
    move-result v7

    .line 184
    if-ge v7, v4, :cond_7

    .line 185
    .line 186
    new-instance v4, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 187
    .line 188
    iget-object v7, v3, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->a:Ljava/lang/String;

    .line 189
    .line 190
    invoke-direct {v4, v7, v1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;-><init>(Ljava/lang/String;Lcom/android/launcher3/widget/custom/ai/q;)V

    .line 191
    .line 192
    .line 193
    new-instance v7, Ljava/util/ArrayList;

    .line 194
    .line 195
    iget-object v3, v3, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->b:Ljava/util/ArrayList;

    .line 196
    .line 197
    invoke-direct {v7, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 198
    .line 199
    .line 200
    iput-object v7, v4, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->b:Ljava/util/ArrayList;

    .line 201
    .line 202
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 203
    .line 204
    .line 205
    move-result v3

    .line 206
    if-le v3, v5, :cond_9

    .line 207
    .line 208
    new-instance v3, Ljava/util/ArrayList;

    .line 209
    .line 210
    iget-object v7, v4, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->b:Ljava/util/ArrayList;

    .line 211
    .line 212
    invoke-virtual {v7, v6, v5}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    .line 213
    .line 214
    .line 215
    move-result-object v5

    .line 216
    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 217
    .line 218
    .line 219
    iput-object v3, v4, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->b:Ljava/util/ArrayList;

    .line 220
    .line 221
    :cond_9
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    goto :goto_3

    .line 225
    :cond_a
    :goto_4
    new-instance v4, Ljava/lang/StringBuilder;

    .line 226
    .line 227
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 228
    .line 229
    .line 230
    const-string v5, "updateViewsByNoticeData noticeCardData error in allNoticeCardDataList, noticeCardData="

    .line 231
    .line 232
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v3

    .line 242
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    .line 244
    .line 245
    goto :goto_3

    .line 246
    :cond_b
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    const/4 v1, 0x1

    .line 251
    if-ne v0, v1, :cond_c

    .line 252
    .line 253
    invoke-virtual {p1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 258
    .line 259
    iput v5, v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->c:I

    .line 260
    .line 261
    goto/16 :goto_7

    .line 262
    .line 263
    :cond_c
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 264
    .line 265
    .line 266
    move-result v0

    .line 267
    const/4 v3, 0x2

    .line 268
    if-ne v0, v3, :cond_f

    .line 269
    .line 270
    invoke-virtual {p1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 275
    .line 276
    iget-object v0, v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->b:Ljava/util/ArrayList;

    .line 277
    .line 278
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 279
    .line 280
    .line 281
    move-result v0

    .line 282
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object v3

    .line 286
    check-cast v3, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 287
    .line 288
    iget-object v3, v3, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->b:Ljava/util/ArrayList;

    .line 289
    .line 290
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 291
    .line 292
    .line 293
    move-result v3

    .line 294
    const/4 v4, 0x6

    .line 295
    if-lt v0, v4, :cond_e

    .line 296
    .line 297
    if-lez v3, :cond_d

    .line 298
    .line 299
    move v0, v1

    .line 300
    goto :goto_5

    .line 301
    :cond_d
    move v0, v6

    .line 302
    :goto_5
    rsub-int/lit8 v0, v0, 0x6

    .line 303
    .line 304
    :cond_e
    rsub-int/lit8 v3, v0, 0x6

    .line 305
    .line 306
    invoke-virtual {p1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object v4

    .line 310
    check-cast v4, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 311
    .line 312
    iput v0, v4, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->c:I

    .line 313
    .line 314
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 319
    .line 320
    iput v3, v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->c:I

    .line 321
    .line 322
    goto :goto_7

    .line 323
    :cond_f
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 324
    .line 325
    .line 326
    move-result v0

    .line 327
    const/4 v5, 0x5

    .line 328
    const/4 v7, 0x3

    .line 329
    if-ne v0, v7, :cond_10

    .line 330
    .line 331
    invoke-virtual {p1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 336
    .line 337
    iput v5, v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->c:I

    .line 338
    .line 339
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 344
    .line 345
    iput-boolean v1, v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->d:Z

    .line 346
    .line 347
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 348
    .line 349
    .line 350
    move-result-object v0

    .line 351
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 352
    .line 353
    iput-boolean v1, v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->d:Z

    .line 354
    .line 355
    goto :goto_7

    .line 356
    :cond_10
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 357
    .line 358
    .line 359
    move-result v0

    .line 360
    if-ne v0, v4, :cond_13

    .line 361
    .line 362
    invoke-virtual {p1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 367
    .line 368
    iget-object v0, v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->b:Ljava/util/ArrayList;

    .line 369
    .line 370
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 371
    .line 372
    .line 373
    move-result v0

    .line 374
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 375
    .line 376
    .line 377
    move-result-object v4

    .line 378
    check-cast v4, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 379
    .line 380
    iget-object v4, v4, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->b:Ljava/util/ArrayList;

    .line 381
    .line 382
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 383
    .line 384
    .line 385
    move-result v4

    .line 386
    if-lt v0, v5, :cond_12

    .line 387
    .line 388
    if-lez v4, :cond_11

    .line 389
    .line 390
    move v0, v1

    .line 391
    goto :goto_6

    .line 392
    :cond_11
    move v0, v6

    .line 393
    :goto_6
    rsub-int/lit8 v0, v0, 0x5

    .line 394
    .line 395
    :cond_12
    rsub-int/lit8 v4, v0, 0x5

    .line 396
    .line 397
    invoke-virtual {p1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 398
    .line 399
    .line 400
    move-result-object v5

    .line 401
    check-cast v5, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 402
    .line 403
    iput v0, v5, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->c:I

    .line 404
    .line 405
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 406
    .line 407
    .line 408
    move-result-object v0

    .line 409
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 410
    .line 411
    iput v4, v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->c:I

    .line 412
    .line 413
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 414
    .line 415
    .line 416
    move-result-object v0

    .line 417
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 418
    .line 419
    iput-boolean v1, v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->d:Z

    .line 420
    .line 421
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 422
    .line 423
    .line 424
    move-result-object v0

    .line 425
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 426
    .line 427
    iput-boolean v1, v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->d:Z

    .line 428
    .line 429
    :cond_13
    :goto_7
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 430
    .line 431
    .line 432
    move-result v0

    .line 433
    if-eqz v0, :cond_14

    .line 434
    .line 435
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->k:Ljava/util/ArrayList;

    .line 436
    .line 437
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 438
    .line 439
    .line 440
    move-result v0

    .line 441
    if-eqz v0, :cond_14

    .line 442
    .line 443
    const-string p0, "updateViewsByNoticeData before and after all empty return"

    .line 444
    .line 445
    invoke-static {v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 446
    .line 447
    .line 448
    return-void

    .line 449
    :cond_14
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->k:Ljava/util/ArrayList;

    .line 450
    .line 451
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 452
    .line 453
    .line 454
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->k:Ljava/util/ArrayList;

    .line 455
    .line 456
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 457
    .line 458
    .line 459
    new-instance p1, Ljava/lang/StringBuilder;

    .line 460
    .line 461
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 462
    .line 463
    .line 464
    const-string v0, "updateViewsByNoticeData mShowCardDataList.size="

    .line 465
    .line 466
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 467
    .line 468
    .line 469
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->k:Ljava/util/ArrayList;

    .line 470
    .line 471
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 472
    .line 473
    .line 474
    move-result v0

    .line 475
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 476
    .line 477
    .line 478
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 479
    .line 480
    .line 481
    move-result-object p1

    .line 482
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 483
    .line 484
    .line 485
    move p1, v6

    .line 486
    :goto_8
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->k:Ljava/util/ArrayList;

    .line 487
    .line 488
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 489
    .line 490
    .line 491
    move-result v0

    .line 492
    if-ge p1, v0, :cond_15

    .line 493
    .line 494
    new-instance v0, Ljava/lang/StringBuilder;

    .line 495
    .line 496
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 497
    .line 498
    .line 499
    const-string v1, "updateViewsByNoticeData mShowCardDataList i="

    .line 500
    .line 501
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 502
    .line 503
    .line 504
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 505
    .line 506
    .line 507
    const-string v1, " list="

    .line 508
    .line 509
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 510
    .line 511
    .line 512
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->k:Ljava/util/ArrayList;

    .line 513
    .line 514
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 515
    .line 516
    .line 517
    move-result-object v1

    .line 518
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 519
    .line 520
    .line 521
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 522
    .line 523
    .line 524
    move-result-object v0

    .line 525
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 526
    .line 527
    .line 528
    add-int/lit8 p1, p1, 0x1

    .line 529
    .line 530
    goto :goto_8

    .line 531
    :cond_15
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->k:Ljava/util/ArrayList;

    .line 532
    .line 533
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 534
    .line 535
    .line 536
    move-result p1

    .line 537
    if-lez p1, :cond_16

    .line 538
    .line 539
    goto :goto_9

    .line 540
    :cond_16
    const/16 v6, 0x8

    .line 541
    .line 542
    :goto_9
    invoke-virtual {p0, v6}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 543
    .line 544
    .line 545
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/ai/r;->b()V

    .line 546
    .line 547
    .line 548
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/widget/custom/ai/r;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->p:Lcom/android/launcher3/widget/custom/ai/r$a;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/custom/ai/r;->setCustomCardContainerCallback(Lcom/android/launcher3/widget/custom/ai/r$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    const/4 p3, 0x0

    .line 20
    move p4, p3

    .line 21
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 22
    .line 23
    .line 24
    move-result p5

    .line 25
    if-ge p4, p5, :cond_5

    .line 26
    .line 27
    invoke-virtual {p0, p4}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p5

    .line 31
    invoke-virtual {p5}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    instance-of v0, v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    invoke-virtual {p5}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 45
    .line 46
    iget-boolean v0, v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->d:Z

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    move v0, v1

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    move v0, p3

    .line 53
    :goto_1
    if-eqz v0, :cond_2

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    sub-int/2addr v2, v1

    .line 60
    if-ne p4, v2, :cond_2

    .line 61
    .line 62
    iget v2, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->m:I

    .line 63
    .line 64
    iget v3, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->n:I

    .line 65
    .line 66
    add-int/2addr v2, v3

    .line 67
    goto :goto_2

    .line 68
    :cond_2
    move v2, p3

    .line 69
    :goto_2
    new-instance v3, Landroid/graphics/Rect;

    .line 70
    .line 71
    add-int/2addr v2, p1

    .line 72
    invoke-virtual {p5}, Landroid/view/View;->getMeasuredWidth()I

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    add-int/2addr v4, v2

    .line 77
    invoke-virtual {p5}, Landroid/view/View;->getMeasuredHeight()I

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    add-int/2addr v5, p2

    .line 82
    invoke-direct {v3, v2, p2, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 83
    .line 84
    .line 85
    iget v2, v3, Landroid/graphics/Rect;->left:I

    .line 86
    .line 87
    iget v4, v3, Landroid/graphics/Rect;->top:I

    .line 88
    .line 89
    iget v5, v3, Landroid/graphics/Rect;->right:I

    .line 90
    .line 91
    iget v6, v3, Landroid/graphics/Rect;->bottom:I

    .line 92
    .line 93
    invoke-virtual {p5, v2, v4, v5, v6}, Landroid/view/View;->layout(IIII)V

    .line 94
    .line 95
    .line 96
    if-eqz v0, :cond_3

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 99
    .line 100
    .line 101
    move-result p5

    .line 102
    sub-int/2addr p5, v1

    .line 103
    if-ne p4, p5, :cond_4

    .line 104
    .line 105
    :cond_3
    iget p2, v3, Landroid/graphics/Rect;->bottom:I

    .line 106
    .line 107
    iget p5, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->o:I

    .line 108
    .line 109
    add-int/2addr p2, p5

    .line 110
    :cond_4
    add-int/lit8 p4, p4, 0x1

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_5
    return-void
.end method

.method protected onMeasure(II)V
    .locals 8

    .line 1
    iget v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->l:I

    .line 2
    .line 3
    if-gtz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->l:I

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    sub-int/2addr v0, v1

    .line 16
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingRight()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    sub-int/2addr v0, v1

    .line 21
    iget v1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->n:I

    .line 22
    .line 23
    sub-int/2addr v0, v1

    .line 24
    int-to-float v0, v0

    .line 25
    const/high16 v1, 0x3f800000    # 1.0f

    .line 26
    .line 27
    mul-float/2addr v0, v1

    .line 28
    const/high16 v1, 0x40000000    # 2.0f

    .line 29
    .line 30
    div-float/2addr v0, v1

    .line 31
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->m:I

    .line 36
    .line 37
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-gtz v0, :cond_1

    .line 42
    .line 43
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    iget p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->l:I

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    sub-int/2addr p1, v0

    .line 54
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingRight()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    sub-int/2addr p1, v0

    .line 59
    const/4 v0, 0x0

    .line 60
    move v1, v0

    .line 61
    move v2, v1

    .line 62
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-ge v1, v3, :cond_7

    .line 67
    .line 68
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    instance-of v4, v4, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 77
    .line 78
    const/4 v5, 0x1

    .line 79
    if-eqz v4, :cond_2

    .line 80
    .line 81
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    check-cast v4, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;

    .line 86
    .line 87
    iget-boolean v4, v4, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout$b;->d:Z

    .line 88
    .line 89
    if-eqz v4, :cond_2

    .line 90
    .line 91
    move v4, v5

    .line 92
    goto :goto_1

    .line 93
    :cond_2
    move v4, v0

    .line 94
    :goto_1
    if-eqz v4, :cond_3

    .line 95
    .line 96
    iget v6, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->m:I

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_3
    move v6, p1

    .line 100
    :goto_2
    const/high16 v7, 0x40000000    # 2.0f

    .line 101
    .line 102
    invoke-static {v6, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 103
    .line 104
    .line 105
    move-result v6

    .line 106
    invoke-virtual {v3, v6, p2}, Landroid/view/View;->measure(II)V

    .line 107
    .line 108
    .line 109
    if-eqz v4, :cond_4

    .line 110
    .line 111
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 112
    .line 113
    .line 114
    move-result v6

    .line 115
    sub-int/2addr v6, v5

    .line 116
    if-eq v1, v6, :cond_5

    .line 117
    .line 118
    :cond_4
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    add-int/2addr v2, v3

    .line 123
    :cond_5
    if-nez v4, :cond_6

    .line 124
    .line 125
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    sub-int/2addr v3, v5

    .line 130
    if-eq v1, v3, :cond_6

    .line 131
    .line 132
    iget v3, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->o:I

    .line 133
    .line 134
    add-int/2addr v2, v3

    .line 135
    :cond_6
    add-int/lit8 v1, v1, 0x1

    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_7
    iget p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->l:I

    .line 139
    .line 140
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 141
    .line 142
    .line 143
    move-result p2

    .line 144
    add-int/2addr v2, p2

    .line 145
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingBottom()I

    .line 146
    .line 147
    .line 148
    move-result p2

    .line 149
    add-int/2addr v2, p2

    .line 150
    invoke-virtual {p0, p1, v2}, Landroid/widget/FrameLayout;->setMeasuredDimension(II)V

    .line 151
    .line 152
    .line 153
    return-void
.end method

.method protected setAICustomWidgetLayout(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->j:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;

    .line 2
    .line 3
    sget-object p1, Lcom/android/launcher3/widget/custom/ai/n;->v:Lcom/android/launcher3/util/I;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/android/launcher3/widget/custom/ai/n;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetTopNoticeLayout;->j:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;

    .line 17
    .line 18
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/widget/custom/ai/n;->A(ZLcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
