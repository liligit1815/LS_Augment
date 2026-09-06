.class public Lcom/zte/mifavor/custom/internal/view/MenuAdapterMifavor;
.super Ljava/lang/Object;
.source "MenuAdapterMifavor.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "MenuAdapterMifavor"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getView_itemBg([Ljava/lang/Object;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v3, 0x5

    .line 4
    const/16 v4, 0x8

    .line 5
    .line 6
    const/4 v5, 0x3

    .line 7
    const/4 v6, 0x2

    .line 8
    const/4 v7, 0x1

    .line 9
    const/4 v8, 0x0

    .line 10
    const/4 v9, 0x4

    .line 11
    const/4 v10, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    array-length v11, v0

    .line 15
    if-ge v11, v9, :cond_0

    .line 16
    .line 17
    goto/16 :goto_1

    .line 18
    .line 19
    :cond_0
    aget-object v11, v0, v8

    .line 20
    .line 21
    check-cast v11, Lcom/android/internal/view/menu/MenuAdapter;

    .line 22
    .line 23
    aget-object v12, v0, v7

    .line 24
    .line 25
    check-cast v12, Ljava/lang/Integer;

    .line 26
    .line 27
    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result v12

    .line 31
    aget-object v13, v0, v6

    .line 32
    .line 33
    check-cast v13, Landroid/view/View;

    .line 34
    .line 35
    aget-object v0, v0, v5

    .line 36
    .line 37
    check-cast v0, Landroid/view/ViewGroup;

    .line 38
    .line 39
    if-eqz v11, :cond_6

    .line 40
    .line 41
    if-eqz v13, :cond_6

    .line 42
    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    goto/16 :goto_1

    .line 46
    .line 47
    :cond_1
    invoke-virtual {v13}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object v14

    .line 51
    if-eqz v14, :cond_6

    .line 52
    .line 53
    invoke-virtual {v13}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object v14

    .line 57
    invoke-static {v14}, Lcom/zte/mifavor/custom/Config;->isMifavorTheme(Landroid/content/Context;)Z

    .line 58
    .line 59
    .line 60
    move-result v14

    .line 61
    if-eqz v14, :cond_6

    .line 62
    .line 63
    invoke-virtual {v13}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 64
    .line 65
    .line 66
    move-result-object v14

    .line 67
    if-eqz v14, :cond_6

    .line 68
    .line 69
    if-eqz v12, :cond_2

    .line 70
    .line 71
    invoke-virtual {v11}, Lcom/android/internal/view/menu/MenuAdapter;->getCount()I

    .line 72
    .line 73
    .line 74
    move-result v14

    .line 75
    sub-int/2addr v14, v7

    .line 76
    if-ne v12, v14, :cond_6

    .line 77
    .line 78
    :cond_2
    instance-of v14, v0, Landroid/widget/ListView;

    .line 79
    .line 80
    if-eqz v14, :cond_3

    .line 81
    .line 82
    check-cast v0, Landroid/widget/ListView;

    .line 83
    .line 84
    invoke-virtual {v0}, Landroid/widget/ListView;->getSelector()Landroid/graphics/drawable/Drawable;

    .line 85
    .line 86
    .line 87
    move-result-object v14

    .line 88
    instance-of v14, v14, Landroid/graphics/drawable/ColorDrawable;

    .line 89
    .line 90
    if-eqz v14, :cond_3

    .line 91
    .line 92
    invoke-virtual {v0}, Landroid/widget/ListView;->getSelector()Landroid/graphics/drawable/Drawable;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    check-cast v0, Landroid/graphics/drawable/ColorDrawable;

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_3
    const/4 v0, 0x0

    .line 100
    :goto_0
    invoke-virtual {v13}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 101
    .line 102
    .line 103
    move-result-object v14

    .line 104
    if-eqz v0, :cond_6

    .line 105
    .line 106
    invoke-virtual {v0}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-nez v0, :cond_6

    .line 111
    .line 112
    instance-of v0, v14, Landroid/graphics/drawable/StateListDrawable;

    .line 113
    .line 114
    if-eqz v0, :cond_6

    .line 115
    .line 116
    check-cast v14, Landroid/graphics/drawable/StateListDrawable;

    .line 117
    .line 118
    const v0, 0x10100a7

    .line 119
    .line 120
    .line 121
    filled-new-array {v0}, [I

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v14, v0}, Landroid/graphics/drawable/StateListDrawable;->findStateDrawableIndex([I)I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    invoke-virtual {v14, v0}, Landroid/graphics/drawable/StateListDrawable;->getStateDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    instance-of v14, v0, Landroid/graphics/drawable/GradientDrawable;

    .line 134
    .line 135
    if-eqz v14, :cond_6

    .line 136
    .line 137
    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 138
    .line 139
    invoke-virtual {v13}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 140
    .line 141
    .line 142
    move-result-object v14

    .line 143
    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 144
    .line 145
    .line 146
    move-result-object v14

    .line 147
    sget v15, LR3/e;->b0:I

    .line 148
    .line 149
    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getDimension(I)F

    .line 150
    .line 151
    .line 152
    move-result v14

    .line 153
    invoke-virtual {v13}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 154
    .line 155
    .line 156
    move-result-object v15

    .line 157
    invoke-virtual {v15}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 158
    .line 159
    .line 160
    move-result-object v15

    .line 161
    const/16 v16, 0x7

    .line 162
    .line 163
    sget v1, LR3/e;->c0:I

    .line 164
    .line 165
    invoke-virtual {v15, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    invoke-virtual {v13}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 170
    .line 171
    .line 172
    move-result-object v15

    .line 173
    invoke-virtual {v15}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 174
    .line 175
    .line 176
    move-result-object v15

    .line 177
    const/16 v17, 0x6

    .line 178
    .line 179
    sget v2, LR3/e;->C:I

    .line 180
    .line 181
    invoke-virtual {v15, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    invoke-virtual {v13}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 186
    .line 187
    .line 188
    move-result-object v13

    .line 189
    invoke-virtual {v13}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 190
    .line 191
    .line 192
    move-result-object v13

    .line 193
    sget v15, LR3/e;->B:I

    .line 194
    .line 195
    invoke-virtual {v13, v15}, Landroid/content/res/Resources;->getDimension(I)F

    .line 196
    .line 197
    .line 198
    move-result v13

    .line 199
    invoke-virtual {v11}, Lcom/android/internal/view/menu/MenuAdapter;->getCount()I

    .line 200
    .line 201
    .line 202
    move-result v11

    .line 203
    sub-int/2addr v11, v7

    .line 204
    if-nez v11, :cond_4

    .line 205
    .line 206
    new-array v4, v4, [F

    .line 207
    .line 208
    aput v14, v4, v8

    .line 209
    .line 210
    aput v14, v4, v7

    .line 211
    .line 212
    aput v1, v4, v6

    .line 213
    .line 214
    aput v1, v4, v5

    .line 215
    .line 216
    aput v2, v4, v9

    .line 217
    .line 218
    aput v2, v4, v3

    .line 219
    .line 220
    aput v13, v4, v17

    .line 221
    .line 222
    aput v13, v4, v16

    .line 223
    .line 224
    invoke-virtual {v0, v4}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :cond_4
    if-nez v12, :cond_5

    .line 229
    .line 230
    new-array v2, v4, [F

    .line 231
    .line 232
    aput v14, v2, v8

    .line 233
    .line 234
    aput v14, v2, v7

    .line 235
    .line 236
    aput v1, v2, v6

    .line 237
    .line 238
    aput v1, v2, v5

    .line 239
    .line 240
    aput v10, v2, v9

    .line 241
    .line 242
    aput v10, v2, v3

    .line 243
    .line 244
    aput v10, v2, v17

    .line 245
    .line 246
    aput v10, v2, v16

    .line 247
    .line 248
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 249
    .line 250
    .line 251
    return-void

    .line 252
    :cond_5
    if-ne v12, v11, :cond_6

    .line 253
    .line 254
    new-array v1, v4, [F

    .line 255
    .line 256
    aput v10, v1, v8

    .line 257
    .line 258
    aput v10, v1, v7

    .line 259
    .line 260
    aput v10, v1, v6

    .line 261
    .line 262
    aput v10, v1, v5

    .line 263
    .line 264
    aput v2, v1, v9

    .line 265
    .line 266
    aput v2, v1, v3

    .line 267
    .line 268
    aput v13, v1, v17

    .line 269
    .line 270
    aput v13, v1, v16

    .line 271
    .line 272
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 273
    .line 274
    .line 275
    :cond_6
    :goto_1
    return-void
.end method
