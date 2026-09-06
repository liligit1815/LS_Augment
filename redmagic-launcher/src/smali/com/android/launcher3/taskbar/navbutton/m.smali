.class public final Lcom/android/launcher3/taskbar/navbutton/m;
.super Lcom/android/launcher3/taskbar/navbutton/a;
.source "SetupNavLayoutter.kt"


# instance fields
.field private final k:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;Landroid/widget/LinearLayout;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/Space;)V
    .locals 9

    .line 1
    const-string v0, "resources"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "nearestTouchFrame"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "navButtonContainer"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "endContextualContainer"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "startContextualContainer"

    .line 22
    .line 23
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    move-object v1, p0

    .line 27
    move-object v2, p1

    .line 28
    move-object v3, p3

    .line 29
    move-object v4, p4

    .line 30
    move-object v5, p5

    .line 31
    move-object v6, p6

    .line 32
    move-object/from16 v7, p7

    .line 33
    .line 34
    move-object/from16 v8, p8

    .line 35
    .line 36
    invoke-direct/range {v1 .. v8}, Lcom/android/launcher3/taskbar/navbutton/a;-><init>(Landroid/content/res/Resources;Landroid/widget/LinearLayout;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/Space;)V

    .line 37
    .line 38
    .line 39
    iput-object p2, p0, Lcom/android/launcher3/taskbar/navbutton/m;->k:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/taskbar/I1;Z)V
    .locals 10

    .line 1
    const-string p2, "context"

    .line 2
    .line 3
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p2, "setupwizard.theme"

    .line 7
    .line 8
    const-string v0, ""

    .line 9
    .line 10
    invoke-static {p2, v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    const-string v0, "get(...)"

    .line 15
    .line 16
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string v0, "glif_expressive"

    .line 20
    .line 21
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_5

    .line 26
    .line 27
    const-string v0, "glif_expressive_light"

    .line 28
    .line 29
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-eqz p2, :cond_0

    .line 34
    .line 35
    goto/16 :goto_1

    .line 36
    .line 37
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    const-string v0, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 46
    .line 47
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    check-cast p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/android/launcher3/taskbar/navbutton/m;->k:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 53
    .line 54
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {v1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const-string v2, "getDeviceProfile(...)"

    .line 68
    .line 69
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    const/4 v2, 0x0

    .line 73
    invoke-virtual {p2, v2}, Landroid/widget/FrameLayout$LayoutParams;->setMarginEnd(I)V

    .line 74
    .line 75
    .line 76
    const v2, 0x800003

    .line 77
    .line 78
    .line 79
    iput v2, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->B0()I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    invoke-virtual {p1, v2}, Lcom/android/launcher3/taskbar/I1;->m2(I)V

    .line 86
    .line 87
    .line 88
    iget-boolean p1, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 89
    .line 90
    if-eqz p1, :cond_1

    .line 91
    .line 92
    iget-boolean p1, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 93
    .line 94
    if-nez p1, :cond_2

    .line 95
    .line 96
    :cond_1
    iget p1, v0, Lcom/android/launcher3/h0;->Y0:F

    .line 97
    .line 98
    float-to-double v2, p1

    .line 99
    const-wide v4, 0x3fee666666666666L    # 0.95

    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    cmpl-double v2, v2, v4

    .line 105
    .line 106
    if-lez v2, :cond_3

    .line 107
    .line 108
    float-to-double v2, p1

    .line 109
    const-wide v4, 0x3ff0cccccccccccdL    # 1.05

    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    cmpg-double p1, v2, v4

    .line 115
    .line 116
    if-gez p1, :cond_3

    .line 117
    .line 118
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    const v0, 0x7f070b70

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    invoke-virtual {p2, p1}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    const v0, 0x7f070b6e

    .line 137
    .line 138
    .line 139
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    iput p1, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 144
    .line 145
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    const v0, 0x7f070b6f

    .line 150
    .line 151
    .line 152
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    iput p1, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_3
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/taskbar/navbutton/a;->b(Landroid/widget/FrameLayout$LayoutParams;Lcom/android/launcher3/h0;)V

    .line 160
    .line 161
    .line 162
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/navbutton/m;->k:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 163
    .line 164
    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->e()Landroid/view/ViewGroup;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->m()Landroid/view/ViewGroup;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    const p2, 0x7f070b78

    .line 193
    .line 194
    .line 195
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 196
    .line 197
    .line 198
    move-result v3

    .line 199
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->e()Landroid/view/ViewGroup;

    .line 200
    .line 201
    .line 202
    move-result-object v5

    .line 203
    const/4 v8, 0x0

    .line 204
    const v9, 0x800005

    .line 205
    .line 206
    .line 207
    const/4 v6, -0x2

    .line 208
    const/4 v7, 0x0

    .line 209
    move-object v4, p0

    .line 210
    invoke-virtual/range {v4 .. v9}, Lcom/android/launcher3/taskbar/navbutton/a;->n(Landroid/view/ViewGroup;IIII)V

    .line 211
    .line 212
    .line 213
    move-object v0, v4

    .line 214
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->m()Landroid/view/ViewGroup;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    const/4 v2, -0x2

    .line 219
    const v5, 0x800003

    .line 220
    .line 221
    .line 222
    move v4, v3

    .line 223
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/taskbar/navbutton/a;->n(Landroid/view/ViewGroup;IIII)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->g()Landroid/widget/ImageView;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    if-eqz p0, :cond_4

    .line 231
    .line 232
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->m()Landroid/view/ViewGroup;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->g()Landroid/widget/ImageView;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->g()Landroid/widget/ImageView;

    .line 244
    .line 245
    .line 246
    move-result-object p0

    .line 247
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->i()Landroid/widget/FrameLayout$LayoutParams;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 252
    .line 253
    .line 254
    :cond_4
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->c()Landroid/widget/ImageView;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    if-eqz p0, :cond_5

    .line 259
    .line 260
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->e()Landroid/view/ViewGroup;

    .line 261
    .line 262
    .line 263
    move-result-object p0

    .line 264
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->c()Landroid/widget/ImageView;

    .line 265
    .line 266
    .line 267
    move-result-object p1

    .line 268
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->c()Landroid/widget/ImageView;

    .line 272
    .line 273
    .line 274
    move-result-object p0

    .line 275
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->i()Landroid/widget/FrameLayout$LayoutParams;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 280
    .line 281
    .line 282
    :cond_5
    :goto_1
    return-void
.end method
