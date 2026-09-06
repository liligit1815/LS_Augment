.class public Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;
.super Landroid/widget/LinearLayout;
.source "AIFutureWidgetLayout.java"

# interfaces
.implements Lk2/m;


# instance fields
.field private g:Landroid/appwidget/AppWidgetHostView;

.field private h:I

.field private i:Z

.field private j:Landroid/view/ViewGroup;

.field private k:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 3
    iput-boolean p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->i:Z

    return-void
.end method

.method public static synthetic b(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p0, "AIFutureWidgetLayout"

    .line 2
    .line 3
    const-string v0, "onClick"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(Landroid/view/View;)Z
    .locals 1

    .line 1
    const-string p0, "AIFutureWidgetLayout"

    .line 2
    .line 3
    const-string v0, "onLongClick"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method private e(Landroid/view/ViewGroup;Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;)V
    .locals 10

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "AIFutureWidgetLayout"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "loadWidgetView bgDataModel null return"

    .line 10
    .line 11
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    instance-of v0, v0, Lcom/android/launcher3/C2;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    new-instance p1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    const-string p2, "loadWidgetView Launcher error return, getContext="

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Lcom/android/launcher3/C2;

    .line 53
    .line 54
    new-instance v2, Landroid/content/ComponentName;

    .line 55
    .line 56
    iget-object v3, p2, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;->pkg:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v4, p2, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;->cls:Ljava/lang/String;

    .line 59
    .line 60
    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->A2()Lcom/android/launcher3/widget/Y0;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-virtual {v3, v2, v4}, Lcom/android/launcher3/widget/Y0;->d(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/widget/U;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    if-nez v3, :cond_3

    .line 76
    .line 77
    new-instance v3, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    const-string v4, "loadWidgetView widget="

    .line 83
    .line 84
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v4, " widgetProviderInfo null, widgetProvider="

    .line 91
    .line 92
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    iget-object v1, p2, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;->pkg:Ljava/lang/String;

    .line 106
    .line 107
    const-string v2, "com.zte.aiassistant"

    .line 108
    .line 109
    if-ne v1, v2, :cond_2

    .line 110
    .line 111
    invoke-static {v0, v2}, Lx1/O;->h1(Landroid/content/Context;Ljava/lang/String;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-nez v0, :cond_2

    .line 116
    .line 117
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->o(Landroid/view/ViewGroup;Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;)V

    .line 118
    .line 119
    .line 120
    :cond_2
    return-void

    .line 121
    :cond_3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->getAIFutureWidgetId()I

    .line 126
    .line 127
    .line 128
    move-result v5

    .line 129
    invoke-static {v4, v5, v2}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->h0(Landroid/content/Context;ILandroid/content/ComponentName;)I

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    if-gez v4, :cond_4

    .line 134
    .line 135
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->I1()Lcom/android/launcher3/widget/l0;

    .line 136
    .line 137
    .line 138
    move-result-object v4

    .line 139
    invoke-virtual {v4}, Lcom/android/launcher3/widget/l0;->r()I

    .line 140
    .line 141
    .line 142
    move-result v4

    .line 143
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 144
    .line 145
    .line 146
    move-result-object v5

    .line 147
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->getAIFutureWidgetId()I

    .line 148
    .line 149
    .line 150
    move-result v6

    .line 151
    invoke-static {v5, v6, v4, v2}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->d(Landroid/content/Context;IILandroid/content/ComponentName;)V

    .line 152
    .line 153
    .line 154
    :cond_4
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->A2()Lcom/android/launcher3/widget/Y0;

    .line 155
    .line 156
    .line 157
    move-result-object v5

    .line 158
    const/4 v6, 0x0

    .line 159
    invoke-virtual {v5, v4, v3, v6}, Lcom/android/launcher3/widget/Y0;->c(ILandroid/appwidget/AppWidgetProviderInfo;Landroid/os/Bundle;)Z

    .line 160
    .line 161
    .line 162
    move-result v5

    .line 163
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->getAIFutureWidgetId()I

    .line 164
    .line 165
    .line 166
    move-result v6

    .line 167
    invoke-static {v6, v4}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->c(II)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->I1()Lcom/android/launcher3/widget/l0;

    .line 171
    .line 172
    .line 173
    move-result-object v6

    .line 174
    invoke-virtual {v6, v4, v3}, Lcom/android/launcher3/widget/l0;->v(ILcom/android/launcher3/widget/U;)Landroid/appwidget/AppWidgetHostView;

    .line 175
    .line 176
    .line 177
    move-result-object v6

    .line 178
    instance-of v7, v6, Lcom/android/launcher3/widget/suggest/m;

    .line 179
    .line 180
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    .line 181
    .line 182
    const/4 v8, -0x1

    .line 183
    const/4 v9, -0x2

    .line 184
    invoke-direct {v7, v8, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 188
    .line 189
    .line 190
    move-result-object v8

    .line 191
    iget v8, v8, Lcom/android/launcher3/h0;->U0:I

    .line 192
    .line 193
    invoke-virtual {p2, v8}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;->getHeightPx(I)I

    .line 194
    .line 195
    .line 196
    move-result v8

    .line 197
    if-lez v8, :cond_5

    .line 198
    .line 199
    iput v8, v7, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 200
    .line 201
    :cond_5
    instance-of v8, v6, Lcom/android/launcher3/widget/group/f;

    .line 202
    .line 203
    if-eqz v8, :cond_6

    .line 204
    .line 205
    iget v8, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->h:I

    .line 206
    .line 207
    if-lez v8, :cond_6

    .line 208
    .line 209
    invoke-static {v3}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->D(Landroid/appwidget/AppWidgetProviderInfo;)Z

    .line 210
    .line 211
    .line 212
    move-result v8

    .line 213
    if-nez v8, :cond_6

    .line 214
    .line 215
    iget v8, v3, Lcom/android/launcher3/widget/U;->h:I

    .line 216
    .line 217
    iget p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->h:I

    .line 218
    .line 219
    mul-int/2addr v8, p0

    .line 220
    iput v8, v7, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 221
    .line 222
    :cond_6
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    iget p0, p0, Lcom/android/launcher3/h0;->U0:I

    .line 227
    .line 228
    invoke-virtual {p2, p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;->getMarginTopBottomPx(I)Landroid/graphics/Point;

    .line 229
    .line 230
    .line 231
    move-result-object p0

    .line 232
    iget v8, p0, Landroid/graphics/Point;->x:I

    .line 233
    .line 234
    iput v8, v7, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 235
    .line 236
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 237
    .line 238
    iput p0, v7, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 239
    .line 240
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    iget-object p0, p0, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 245
    .line 246
    iget p0, p0, Landroid/graphics/Rect;->left:I

    .line 247
    .line 248
    invoke-static {v3}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->u(Landroid/appwidget/AppWidgetProviderInfo;)Z

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    if-eqz v0, :cond_7

    .line 253
    .line 254
    const/4 p0, 0x0

    .line 255
    :cond_7
    iput p0, v7, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 256
    .line 257
    iput p0, v7, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 258
    .line 259
    invoke-virtual {v6, v7}, Landroid/appwidget/AppWidgetHostView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 260
    .line 261
    .line 262
    new-instance p0, Ljava/lang/StringBuilder;

    .line 263
    .line 264
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 265
    .line 266
    .line 267
    const-string v0, "loadWidgetView bind="

    .line 268
    .line 269
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    const-string v0, " appWidgetId="

    .line 276
    .line 277
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    const-string v0, " widgetProvider="

    .line 284
    .line 285
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object p0

    .line 295
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    .line 297
    .line 298
    sget-object p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->m:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;

    .line 299
    .line 300
    if-ne p2, p0, :cond_8

    .line 301
    .line 302
    sget-object p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->s:Ljava/util/List;

    .line 303
    .line 304
    invoke-interface {p0, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 305
    .line 306
    .line 307
    move-result p0

    .line 308
    invoke-virtual {p1, v6, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 309
    .line 310
    .line 311
    return-void

    .line 312
    :cond_8
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 313
    .line 314
    .line 315
    return-void
.end method

.method private getAIFutureOtherWidgetHostViewList()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;",
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
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->getOtherWidgetHostViewList()Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Landroid/appwidget/AppWidgetHostView;

    .line 25
    .line 26
    instance-of v2, v1, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 27
    .line 28
    if-eqz v2, :cond_0

    .line 29
    .line 30
    check-cast v1, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    return-object v0
.end method

.method private getAIFutureWidgetId()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->g:Landroid/appwidget/AppWidgetHostView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

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

.method private o(Landroid/view/ViewGroup;Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onAiAssistantPkgChanged widgetData="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p2, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;->cls:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "AIFutureWidgetLayout"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    sget-object v0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->m:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    if-ne p2, v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const v2, 0x7f0e0048

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const v1, 0x7f0b009d

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    const/4 v2, 0x4

    .line 55
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    :cond_0
    sget-object v1, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->s:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v1, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    sget-object v0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->p:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;

    .line 69
    .line 70
    if-ne p2, v0, :cond_2

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const v2, 0x7f0e004a

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 88
    .line 89
    .line 90
    :cond_2
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->getAIFutureWidgetId()I

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    invoke-static {p1, p0, p2}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->b0(Landroid/content/Context;ILcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method private p()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/android/launcher3/C2;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, v1}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    instance-of v2, v0, Lcom/android/launcher3/CellLayout;

    .line 25
    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    check-cast v0, Lcom/android/launcher3/CellLayout;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-lez v2, :cond_0

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->h:I

    .line 41
    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    const-string v1, "updateCellHeight mCellHeight="

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    iget p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->h:I

    .line 53
    .line 54
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v0, "AIFutureWidgetLayout"

    .line 62
    .line 63
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    const/4 p0, 0x1

    .line 67
    return p0

    .line 68
    :cond_0
    return v1
.end method


# virtual methods
.method public a()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->getOtherWidgetHostViewList()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/appwidget/AppWidgetHostView;

    .line 20
    .line 21
    instance-of v1, v0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    check-cast v0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->d0()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public d()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->getOtherWidgetHostViewList()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/appwidget/AppWidgetHostView;

    .line 20
    .line 21
    instance-of v1, v0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    check-cast v0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->g0()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method protected f()V
    .locals 2

    .line 1
    const-string v0, "AIFutureWidgetLayout"

    .line 2
    .line 3
    const-string v1, "onAIFutureScreenWidgetHostViewRemoved"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->getOtherWidgetHostViewList()Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroid/appwidget/AppWidgetHostView;

    .line 27
    .line 28
    instance-of v1, v0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    check-cast v0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->i0()V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-void
.end method

.method protected g(ZZ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->getAIFutureOtherWidgetHostViewList()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 20
    .line 21
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->j0(ZZ)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public getOtherWidgetHostViewList()Ljava/util/ArrayList;
    .locals 5
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
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->j:Landroid/view/ViewGroup;

    .line 9
    .line 10
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-ge v2, v3, :cond_1

    .line 15
    .line 16
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->j:Landroid/view/ViewGroup;

    .line 17
    .line 18
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    instance-of v4, v3, Lcom/android/launcher3/widget/T;

    .line 23
    .line 24
    if-eqz v4, :cond_0

    .line 25
    .line 26
    check-cast v3, Lcom/android/launcher3/widget/T;

    .line 27
    .line 28
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3}, Lcom/android/launcher3/widget/T;->getOtherWidgetHostViewList()Ljava/util/ArrayList;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    :goto_1
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->k:Landroid/view/ViewGroup;

    .line 42
    .line 43
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-ge v1, v2, :cond_3

    .line 48
    .line 49
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->k:Landroid/view/ViewGroup;

    .line 50
    .line 51
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    instance-of v3, v2, Lcom/android/launcher3/widget/T;

    .line 56
    .line 57
    if-eqz v3, :cond_2

    .line 58
    .line 59
    check-cast v2, Lcom/android/launcher3/widget/T;

    .line 60
    .line 61
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2}, Lcom/android/launcher3/widget/T;->getOtherWidgetHostViewList()Ljava/util/ArrayList;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 69
    .line 70
    .line 71
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_3
    return-object v0
.end method

.method protected h(Z)V
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    move-object v2, v0

    .line 4
    move-object v3, v2

    .line 5
    move-object v4, v3

    .line 6
    move v5, v1

    .line 7
    :goto_0
    iget-object v6, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->j:Landroid/view/ViewGroup;

    .line 8
    .line 9
    invoke-virtual {v6}, Landroid/view/ViewGroup;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result v6

    .line 13
    const v7, 0x7f0b00a5

    .line 14
    .line 15
    .line 16
    const v8, 0x7f0b009b

    .line 17
    .line 18
    .line 19
    if-ge v5, v6, :cond_4

    .line 20
    .line 21
    iget-object v6, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->j:Landroid/view/ViewGroup;

    .line 22
    .line 23
    invoke-virtual {v6, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v6

    .line 27
    instance-of v9, v6, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 28
    .line 29
    if-eqz v9, :cond_1

    .line 30
    .line 31
    check-cast v6, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 32
    .line 33
    invoke-virtual {v6}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->e0()Z

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    if-eqz v7, :cond_0

    .line 38
    .line 39
    move-object v0, v6

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    invoke-virtual {v6}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->f0()Z

    .line 42
    .line 43
    .line 44
    move-result v7

    .line 45
    if-eqz v7, :cond_3

    .line 46
    .line 47
    move-object v2, v6

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    if-eqz v6, :cond_3

    .line 50
    .line 51
    invoke-virtual {v6}, Landroid/view/View;->getId()I

    .line 52
    .line 53
    .line 54
    move-result v9

    .line 55
    if-ne v8, v9, :cond_2

    .line 56
    .line 57
    move-object v3, v6

    .line 58
    goto :goto_1

    .line 59
    :cond_2
    invoke-virtual {v6}, Landroid/view/View;->getId()I

    .line 60
    .line 61
    .line 62
    move-result v8

    .line 63
    if-ne v7, v8, :cond_3

    .line 64
    .line 65
    move-object v4, v6

    .line 66
    :cond_3
    :goto_1
    add-int/lit8 v5, v5, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_4
    move v5, v1

    .line 70
    :goto_2
    iget-object v6, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->k:Landroid/view/ViewGroup;

    .line 71
    .line 72
    invoke-virtual {v6}, Landroid/view/ViewGroup;->getChildCount()I

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    if-ge v5, v6, :cond_9

    .line 77
    .line 78
    iget-object v6, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->k:Landroid/view/ViewGroup;

    .line 79
    .line 80
    invoke-virtual {v6, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v6

    .line 84
    instance-of v9, v6, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 85
    .line 86
    if-eqz v9, :cond_6

    .line 87
    .line 88
    check-cast v6, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 89
    .line 90
    invoke-virtual {v6}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->e0()Z

    .line 91
    .line 92
    .line 93
    move-result v9

    .line 94
    if-eqz v9, :cond_5

    .line 95
    .line 96
    move-object v0, v6

    .line 97
    goto :goto_3

    .line 98
    :cond_5
    invoke-virtual {v6}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->f0()Z

    .line 99
    .line 100
    .line 101
    move-result v9

    .line 102
    if-eqz v9, :cond_8

    .line 103
    .line 104
    move-object v2, v6

    .line 105
    goto :goto_3

    .line 106
    :cond_6
    if-eqz v6, :cond_8

    .line 107
    .line 108
    invoke-virtual {v6}, Landroid/view/View;->getId()I

    .line 109
    .line 110
    .line 111
    move-result v9

    .line 112
    if-ne v8, v9, :cond_7

    .line 113
    .line 114
    move-object v3, v6

    .line 115
    goto :goto_3

    .line 116
    :cond_7
    invoke-virtual {v6}, Landroid/view/View;->getId()I

    .line 117
    .line 118
    .line 119
    move-result v9

    .line 120
    if-ne v7, v9, :cond_8

    .line 121
    .line 122
    move-object v4, v6

    .line 123
    :cond_8
    :goto_3
    add-int/lit8 v5, v5, 0x1

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_9
    new-instance v5, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 129
    .line 130
    .line 131
    const-string v6, "onAiAssistantPkgChanged installed="

    .line 132
    .line 133
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v6, " futureHostView="

    .line 140
    .line 141
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    const/4 v6, 0x1

    .line 145
    if-eqz v0, :cond_a

    .line 146
    .line 147
    move v7, v6

    .line 148
    goto :goto_4

    .line 149
    :cond_a
    move v7, v1

    .line 150
    :goto_4
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v7, " micHostView="

    .line 154
    .line 155
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    if-eqz v2, :cond_b

    .line 159
    .line 160
    move v7, v6

    .line 161
    goto :goto_5

    .line 162
    :cond_b
    move v7, v1

    .line 163
    :goto_5
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    const-string v7, " futureEmptyView="

    .line 167
    .line 168
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    if-eqz v3, :cond_c

    .line 172
    .line 173
    move v7, v6

    .line 174
    goto :goto_6

    .line 175
    :cond_c
    move v7, v1

    .line 176
    :goto_6
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    const-string v7, " micEmptyView="

    .line 180
    .line 181
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    if-eqz v4, :cond_d

    .line 185
    .line 186
    move v1, v6

    .line 187
    :cond_d
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    const-string v5, "AIFutureWidgetLayout"

    .line 195
    .line 196
    invoke-static {v5, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    .line 198
    .line 199
    if-eqz p1, :cond_11

    .line 200
    .line 201
    if-eqz v3, :cond_e

    .line 202
    .line 203
    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    instance-of v1, p1, Landroid/view/ViewGroup;

    .line 208
    .line 209
    if-eqz v1, :cond_e

    .line 210
    .line 211
    check-cast p1, Landroid/view/ViewGroup;

    .line 212
    .line 213
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 214
    .line 215
    .line 216
    :cond_e
    if-eqz v4, :cond_f

    .line 217
    .line 218
    invoke-virtual {v4}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    instance-of v1, p1, Landroid/view/ViewGroup;

    .line 223
    .line 224
    if-eqz v1, :cond_f

    .line 225
    .line 226
    check-cast p1, Landroid/view/ViewGroup;

    .line 227
    .line 228
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 229
    .line 230
    .line 231
    :cond_f
    if-nez v0, :cond_10

    .line 232
    .line 233
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->j:Landroid/view/ViewGroup;

    .line 234
    .line 235
    sget-object v0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->m:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;

    .line 236
    .line 237
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->e(Landroid/view/ViewGroup;Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;)V

    .line 238
    .line 239
    .line 240
    :cond_10
    if-nez v2, :cond_15

    .line 241
    .line 242
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->k:Landroid/view/ViewGroup;

    .line 243
    .line 244
    sget-object v0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->p:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;

    .line 245
    .line 246
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->e(Landroid/view/ViewGroup;Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;)V

    .line 247
    .line 248
    .line 249
    return-void

    .line 250
    :cond_11
    if-eqz v0, :cond_12

    .line 251
    .line 252
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHostView;->getParent()Landroid/view/ViewParent;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    instance-of v1, p1, Landroid/view/ViewGroup;

    .line 257
    .line 258
    if-eqz v1, :cond_12

    .line 259
    .line 260
    check-cast p1, Landroid/view/ViewGroup;

    .line 261
    .line 262
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 263
    .line 264
    .line 265
    :cond_12
    if-eqz v2, :cond_13

    .line 266
    .line 267
    invoke-virtual {v2}, Landroid/appwidget/AppWidgetHostView;->getParent()Landroid/view/ViewParent;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    instance-of v0, p1, Landroid/view/ViewGroup;

    .line 272
    .line 273
    if-eqz v0, :cond_13

    .line 274
    .line 275
    check-cast p1, Landroid/view/ViewGroup;

    .line 276
    .line 277
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 278
    .line 279
    .line 280
    :cond_13
    if-nez v3, :cond_14

    .line 281
    .line 282
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->j:Landroid/view/ViewGroup;

    .line 283
    .line 284
    sget-object v0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->m:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;

    .line 285
    .line 286
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->o(Landroid/view/ViewGroup;Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;)V

    .line 287
    .line 288
    .line 289
    :cond_14
    if-nez v4, :cond_15

    .line 290
    .line 291
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->k:Landroid/view/ViewGroup;

    .line 292
    .line 293
    sget-object v0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->p:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;

    .line 294
    .line 295
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->o(Landroid/view/ViewGroup;Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;)V

    .line 296
    .line 297
    .line 298
    :cond_15
    return-void
.end method

.method protected i()V
    .locals 2

    .line 1
    const-string v0, "AIFutureWidgetLayout"

    .line 2
    .line 3
    const-string v1, "onLauncherDestroy"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->getAIFutureOtherWidgetHostViewList()Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->l0()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method protected j()V
    .locals 2

    .line 1
    const-string v0, "AIFutureWidgetLayout"

    .line 2
    .line 3
    const-string v1, "onLauncherPaused"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->getAIFutureOtherWidgetHostViewList()Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->m0()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method protected k()V
    .locals 2

    .line 1
    const-string v0, "AIFutureWidgetLayout"

    .line 2
    .line 3
    const-string v1, "onLauncherResumed"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->getAIFutureOtherWidgetHostViewList()Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->n0()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method protected l()V
    .locals 2

    .line 1
    const-string v0, "AIFutureWidgetLayout"

    .line 2
    .line 3
    const-string v1, "onLauncherStarted"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->getAIFutureOtherWidgetHostViewList()Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->o0()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method protected m()V
    .locals 2

    .line 1
    const-string v0, "AIFutureWidgetLayout"

    .line 2
    .line 3
    const-string v1, "onLauncherStopped"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->getAIFutureOtherWidgetHostViewList()Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;->p0()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method protected n()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->j:Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->k:Landroid/view/ViewGroup;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v1, "rebindWidgetIfNeedWhenUserUnlocked mUserUnlockedWhenLoadWidgetView="

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->i:Z

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, " c1="

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->j:Landroid/view/ViewGroup;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v1, " c2="

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->k:Landroid/view/ViewGroup;

    .line 45
    .line 46
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const-string v1, "AIFutureWidgetLayout"

    .line 58
    .line 59
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->i:Z

    .line 63
    .line 64
    if-nez v0, :cond_1

    .line 65
    .line 66
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->j:Landroid/view/ViewGroup;

    .line 67
    .line 68
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez v0, :cond_1

    .line 73
    .line 74
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->k:Landroid/view/ViewGroup;

    .line 75
    .line 76
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_1

    .line 81
    .line 82
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->g:Landroid/appwidget/AppWidgetHostView;

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->setAppWidgetHostView(Landroid/appwidget/AppWidgetHostView;)V

    .line 85
    .line 86
    .line 87
    :cond_1
    :goto_0
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->L(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/C2;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0, v0, v0, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Lcom/android/launcher3/widget/custom/future/e;

    .line 18
    .line 19
    invoke-direct {v0}, Lcom/android/launcher3/widget/custom/future/e;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Lcom/android/launcher3/widget/custom/future/f;

    .line 26
    .line 27
    invoke-direct {v0}, Lcom/android/launcher3/widget/custom/future/f;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 31
    .line 32
    .line 33
    const v0, 0x7f0b00a3

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroid/view/ViewGroup;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->j:Landroid/view/ViewGroup;

    .line 43
    .line 44
    const v0, 0x7f0b00a2

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Landroid/view/ViewGroup;

    .line 52
    .line 53
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->k:Landroid/view/ViewGroup;

    .line 54
    .line 55
    return-void
.end method

.method protected onMeasure(II)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->h:I

    .line 5
    .line 6
    if-gtz p1, :cond_1

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->p()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    new-instance p2, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v0, "onMeasure  mCellHeight="

    .line 18
    .line 19
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->h:I

    .line 23
    .line 24
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v0, " changed="

    .line 28
    .line 29
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    const-string v0, "AIFutureWidgetLayout"

    .line 40
    .line 41
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    if-eqz p1, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->getOtherWidgetHostViewList()Ljava/util/ArrayList;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-eqz p2, :cond_1

    .line 59
    .line 60
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    check-cast p2, Landroid/appwidget/AppWidgetHostView;

    .line 65
    .line 66
    instance-of v0, p2, Lcom/android/launcher3/widget/group/f;

    .line 67
    .line 68
    if-eqz v0, :cond_0

    .line 69
    .line 70
    invoke-virtual {p2}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    instance-of v0, v0, Lcom/android/launcher3/widget/U;

    .line 75
    .line 76
    if-eqz v0, :cond_0

    .line 77
    .line 78
    invoke-virtual {p2}, Landroid/appwidget/AppWidgetHostView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    instance-of v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 83
    .line 84
    if-eqz v0, :cond_0

    .line 85
    .line 86
    invoke-virtual {p2}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->D(Landroid/appwidget/AppWidgetProviderInfo;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-nez v0, :cond_0

    .line 95
    .line 96
    invoke-virtual {p2}, Landroid/appwidget/AppWidgetHostView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 101
    .line 102
    invoke-virtual {p2}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    check-cast v1, Lcom/android/launcher3/widget/U;

    .line 107
    .line 108
    iget v1, v1, Lcom/android/launcher3/widget/U;->h:I

    .line 109
    .line 110
    iget v2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->h:I

    .line 111
    .line 112
    mul-int/2addr v1, v2

    .line 113
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 114
    .line 115
    invoke-virtual {p2, v0}, Landroid/appwidget/AppWidgetHostView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_1
    return-void
.end method

.method protected setAppWidgetHostView(Landroid/appwidget/AppWidgetHostView;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/launcher3/C2;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->u0()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    :goto_0
    iput-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->i:Z

    .line 27
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string v1, "setAppWidgetHostView isUserUnlocked="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->i:Z

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-string v1, "AIFutureWidgetLayout"

    .line 48
    .line 49
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->g:Landroid/appwidget/AppWidgetHostView;

    .line 53
    .line 54
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->p()Z

    .line 55
    .line 56
    .line 57
    sget-object p1, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->s:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_1

    .line 68
    .line 69
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;

    .line 74
    .line 75
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->j:Landroid/view/ViewGroup;

    .line 76
    .line 77
    invoke-direct {p0, v1, v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->e(Landroid/view/ViewGroup;Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;)V

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_1
    sget-object p1, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->t:Ljava/util/List;

    .line 82
    .line 83
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_2

    .line 92
    .line 93
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;

    .line 98
    .line 99
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->k:Landroid/view/ViewGroup;

    .line 100
    .line 101
    invoke-direct {p0, v1, v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetLayout;->e(Landroid/view/ViewGroup;Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;)V

    .line 102
    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_2
    return-void
.end method
