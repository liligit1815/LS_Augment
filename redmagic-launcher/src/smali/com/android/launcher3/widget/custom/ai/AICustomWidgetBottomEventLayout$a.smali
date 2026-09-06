.class Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$a;
.super Ljava/lang/Object;
.source "AICustomWidgetBottomEventLayout.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;)I
    .locals 15

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v0, :cond_18

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto/16 :goto_4

    .line 11
    .line 12
    :cond_0
    instance-of v3, v0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

    .line 13
    .line 14
    const/4 v4, -0x1

    .line 15
    if-eqz v3, :cond_1

    .line 16
    .line 17
    move-object v5, v0

    .line 18
    check-cast v5, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

    .line 19
    .line 20
    invoke-static {v5}, Lcom/android/launcher3/widget/custom/ai/n;->M(Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;)Z

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    if-eqz v5, :cond_1

    .line 25
    .line 26
    return v4

    .line 27
    :cond_1
    instance-of v5, v1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

    .line 28
    .line 29
    const/4 v6, 0x1

    .line 30
    if-eqz v5, :cond_2

    .line 31
    .line 32
    move-object v7, v1

    .line 33
    check-cast v7, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

    .line 34
    .line 35
    invoke-static {v7}, Lcom/android/launcher3/widget/custom/ai/n;->M(Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;)Z

    .line 36
    .line 37
    .line 38
    move-result v7

    .line 39
    if-eqz v7, :cond_2

    .line 40
    .line 41
    return v6

    .line 42
    :cond_2
    if-eqz v3, :cond_3

    .line 43
    .line 44
    move-object v7, v0

    .line 45
    check-cast v7, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

    .line 46
    .line 47
    invoke-static {v7}, Lcom/android/launcher3/widget/custom/ai/n;->P(Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;)Z

    .line 48
    .line 49
    .line 50
    move-result v7

    .line 51
    if-eqz v7, :cond_3

    .line 52
    .line 53
    return v4

    .line 54
    :cond_3
    if-eqz v5, :cond_4

    .line 55
    .line 56
    move-object v7, v1

    .line 57
    check-cast v7, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

    .line 58
    .line 59
    invoke-static {v7}, Lcom/android/launcher3/widget/custom/ai/n;->P(Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;)Z

    .line 60
    .line 61
    .line 62
    move-result v7

    .line 63
    if-eqz v7, :cond_4

    .line 64
    .line 65
    return v6

    .line 66
    :cond_4
    if-eqz v3, :cond_5

    .line 67
    .line 68
    move-object v7, v0

    .line 69
    check-cast v7, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

    .line 70
    .line 71
    invoke-virtual {v7}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->isAllDay()Z

    .line 72
    .line 73
    .line 74
    move-result v7

    .line 75
    if-eqz v7, :cond_5

    .line 76
    .line 77
    move v7, v6

    .line 78
    goto :goto_0

    .line 79
    :cond_5
    move v7, v2

    .line 80
    :goto_0
    if-eqz v5, :cond_6

    .line 81
    .line 82
    move-object v8, v1

    .line 83
    check-cast v8, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

    .line 84
    .line 85
    invoke-virtual {v8}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->isAllDay()Z

    .line 86
    .line 87
    .line 88
    move-result v8

    .line 89
    if-eqz v8, :cond_6

    .line 90
    .line 91
    move v8, v6

    .line 92
    goto :goto_1

    .line 93
    :cond_6
    move v8, v2

    .line 94
    :goto_1
    if-eqz v7, :cond_7

    .line 95
    .line 96
    return v6

    .line 97
    :cond_7
    if-eqz v8, :cond_8

    .line 98
    .line 99
    return v4

    .line 100
    :cond_8
    instance-of v7, v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;

    .line 101
    .line 102
    if-eqz v7, :cond_9

    .line 103
    .line 104
    return v6

    .line 105
    :cond_9
    instance-of v7, v1, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;

    .line 106
    .line 107
    if-eqz v7, :cond_a

    .line 108
    .line 109
    return v4

    .line 110
    :cond_a
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 111
    .line 112
    .line 113
    move-result-wide v7

    .line 114
    instance-of v9, v0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;

    .line 115
    .line 116
    if-eqz v9, :cond_b

    .line 117
    .line 118
    instance-of v10, v1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;

    .line 119
    .line 120
    if-nez v10, :cond_b

    .line 121
    .line 122
    return v4

    .line 123
    :cond_b
    if-nez v9, :cond_c

    .line 124
    .line 125
    instance-of v10, v1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;

    .line 126
    .line 127
    if-eqz v10, :cond_c

    .line 128
    .line 129
    return v6

    .line 130
    :cond_c
    if-eqz v9, :cond_e

    .line 131
    .line 132
    instance-of v9, v1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;

    .line 133
    .line 134
    if-eqz v9, :cond_e

    .line 135
    .line 136
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;

    .line 137
    .line 138
    iget-object v0, v0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->fromTime:Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {v0, v2}, Lcom/android/launcher3/widget/custom/ai/n;->I(Ljava/lang/String;Z)J

    .line 141
    .line 142
    .line 143
    move-result-wide v9

    .line 144
    move-object v0, v1

    .line 145
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;

    .line 146
    .line 147
    iget-object v0, v0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->fromTime:Ljava/lang/String;

    .line 148
    .line 149
    invoke-static {v0, v2}, Lcom/android/launcher3/widget/custom/ai/n;->I(Ljava/lang/String;Z)J

    .line 150
    .line 151
    .line 152
    move-result-wide v0

    .line 153
    sub-long/2addr v9, v7

    .line 154
    invoke-static {v9, v10}, Ljava/lang/Math;->abs(J)J

    .line 155
    .line 156
    .line 157
    move-result-wide v2

    .line 158
    sub-long/2addr v0, v7

    .line 159
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    .line 160
    .line 161
    .line 162
    move-result-wide v0

    .line 163
    cmp-long v0, v2, v0

    .line 164
    .line 165
    if-gtz v0, :cond_d

    .line 166
    .line 167
    return v4

    .line 168
    :cond_d
    return v6

    .line 169
    :cond_e
    const-wide/16 v9, 0x0

    .line 170
    .line 171
    if-eqz v3, :cond_f

    .line 172
    .line 173
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

    .line 174
    .line 175
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->isAllDay()Z

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    if-nez v2, :cond_f

    .line 180
    .line 181
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getStartTimeLong()J

    .line 182
    .line 183
    .line 184
    move-result-wide v2

    .line 185
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getEndTimeLong()J

    .line 186
    .line 187
    .line 188
    move-result-wide v11

    .line 189
    goto :goto_2

    .line 190
    :cond_f
    move-wide v2, v9

    .line 191
    move-wide v11, v2

    .line 192
    :goto_2
    if-eqz v5, :cond_10

    .line 193
    .line 194
    move-object v0, v1

    .line 195
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

    .line 196
    .line 197
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->isAllDay()Z

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    if-nez v1, :cond_10

    .line 202
    .line 203
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getStartTimeLong()J

    .line 204
    .line 205
    .line 206
    move-result-wide v13

    .line 207
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getEndTimeLong()J

    .line 208
    .line 209
    .line 210
    move-result-wide v0

    .line 211
    goto :goto_3

    .line 212
    :cond_10
    move-wide v0, v9

    .line 213
    move-wide v13, v0

    .line 214
    :goto_3
    cmp-long v5, v2, v9

    .line 215
    .line 216
    if-lez v5, :cond_16

    .line 217
    .line 218
    cmp-long v5, v13, v9

    .line 219
    .line 220
    if-lez v5, :cond_16

    .line 221
    .line 222
    cmp-long v5, v2, v7

    .line 223
    .line 224
    if-gez v5, :cond_11

    .line 225
    .line 226
    cmp-long v9, v13, v7

    .line 227
    .line 228
    if-lez v9, :cond_11

    .line 229
    .line 230
    return v4

    .line 231
    :cond_11
    if-lez v5, :cond_12

    .line 232
    .line 233
    cmp-long v9, v13, v7

    .line 234
    .line 235
    if-gez v9, :cond_12

    .line 236
    .line 237
    return v6

    .line 238
    :cond_12
    if-gez v5, :cond_14

    .line 239
    .line 240
    cmp-long v5, v13, v7

    .line 241
    .line 242
    if-gez v5, :cond_14

    .line 243
    .line 244
    sub-long/2addr v11, v7

    .line 245
    invoke-static {v11, v12}, Ljava/lang/Math;->abs(J)J

    .line 246
    .line 247
    .line 248
    move-result-wide v2

    .line 249
    sub-long/2addr v0, v7

    .line 250
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    .line 251
    .line 252
    .line 253
    move-result-wide v0

    .line 254
    cmp-long v0, v2, v0

    .line 255
    .line 256
    if-gtz v0, :cond_13

    .line 257
    .line 258
    return v4

    .line 259
    :cond_13
    return v6

    .line 260
    :cond_14
    sub-long/2addr v2, v7

    .line 261
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    .line 262
    .line 263
    .line 264
    move-result-wide v0

    .line 265
    sub-long/2addr v13, v7

    .line 266
    invoke-static {v13, v14}, Ljava/lang/Math;->abs(J)J

    .line 267
    .line 268
    .line 269
    move-result-wide v2

    .line 270
    cmp-long v0, v0, v2

    .line 271
    .line 272
    if-gtz v0, :cond_15

    .line 273
    .line 274
    return v4

    .line 275
    :cond_15
    return v6

    .line 276
    :cond_16
    cmp-long v0, v2, v13

    .line 277
    .line 278
    if-gtz v0, :cond_17

    .line 279
    .line 280
    return v4

    .line 281
    :cond_17
    return v6

    .line 282
    :cond_18
    :goto_4
    return v2
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;

    .line 2
    .line 3
    check-cast p2, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$a;->a(Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
