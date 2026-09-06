.class Lcom/zte/mifavor/widget/NumberPickerZTE$d;
.super Landroid/view/accessibility/AccessibilityNodeProvider;
.source "NumberPickerZTE.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/NumberPickerZTE;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "d"
.end annotation


# instance fields
.field private final a:Landroid/graphics/Rect;

.field private final b:[I

.field private c:I

.field final synthetic d:Lcom/zte/mifavor/widget/NumberPickerZTE;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/NumberPickerZTE;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/accessibility/AccessibilityNodeProvider;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->a:Landroid/graphics/Rect;

    .line 12
    .line 13
    const/4 p1, 0x2

    .line 14
    new-array p1, p1, [I

    .line 15
    .line 16
    iput-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->b:[I

    .line 17
    .line 18
    const/high16 p1, -0x80000000

    .line 19
    .line 20
    iput p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 21
    .line 22
    return-void
.end method

.method private a(IIII)Landroid/view/accessibility/AccessibilityNodeInfo;
    .locals 4

    .line 1
    invoke-static {}, Landroid/view/accessibility/AccessibilityNodeInfo;->obtain()Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->G(Lcom/zte/mifavor/widget/NumberPickerZTE;)Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setPackageName(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setSource(Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->g()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 39
    .line 40
    const/4 v2, 0x3

    .line 41
    invoke-virtual {v0, v1, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->addChild(Landroid/view/View;I)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 45
    .line 46
    const/4 v2, 0x2

    .line 47
    invoke-virtual {v0, v1, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->addChild(Landroid/view/View;I)V

    .line 48
    .line 49
    .line 50
    invoke-direct {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->h()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    const/4 v2, 0x1

    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 58
    .line 59
    invoke-virtual {v0, v1, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->addChild(Landroid/view/View;I)V

    .line 60
    .line 61
    .line 62
    :cond_1
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 63
    .line 64
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getParentForAccessibility()Landroid/view/ViewParent;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    check-cast v1, Landroid/view/View;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setParent(Landroid/view/View;)V

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 74
    .line 75
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->isEnabled()Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setEnabled(Z)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setScrollable(Z)V

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 86
    .line 87
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v1}, Landroid/content/res/Resources;->getCompatibilityInfo()Landroid/content/res/CompatibilityInfo;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iget v1, v1, Landroid/content/res/CompatibilityInfo;->applicationScale:F

    .line 100
    .line 101
    iget-object v3, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->a:Landroid/graphics/Rect;

    .line 102
    .line 103
    invoke-virtual {v3, p1, p2, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 104
    .line 105
    .line 106
    const/high16 p1, 0x3f800000    # 1.0f

    .line 107
    .line 108
    cmpl-float p1, v1, p1

    .line 109
    .line 110
    const/high16 p2, 0x3f000000    # 0.5f

    .line 111
    .line 112
    if-eqz p1, :cond_2

    .line 113
    .line 114
    iget p3, v3, Landroid/graphics/Rect;->left:I

    .line 115
    .line 116
    int-to-float p3, p3

    .line 117
    mul-float/2addr p3, v1

    .line 118
    add-float/2addr p3, p2

    .line 119
    float-to-int p3, p3

    .line 120
    iput p3, v3, Landroid/graphics/Rect;->left:I

    .line 121
    .line 122
    iget p3, v3, Landroid/graphics/Rect;->top:I

    .line 123
    .line 124
    int-to-float p3, p3

    .line 125
    mul-float/2addr p3, v1

    .line 126
    add-float/2addr p3, p2

    .line 127
    float-to-int p3, p3

    .line 128
    iput p3, v3, Landroid/graphics/Rect;->top:I

    .line 129
    .line 130
    iget p3, v3, Landroid/graphics/Rect;->right:I

    .line 131
    .line 132
    int-to-float p3, p3

    .line 133
    mul-float/2addr p3, v1

    .line 134
    add-float/2addr p3, p2

    .line 135
    float-to-int p3, p3

    .line 136
    iput p3, v3, Landroid/graphics/Rect;->right:I

    .line 137
    .line 138
    iget p3, v3, Landroid/graphics/Rect;->bottom:I

    .line 139
    .line 140
    int-to-float p3, p3

    .line 141
    mul-float/2addr p3, v1

    .line 142
    add-float/2addr p3, p2

    .line 143
    float-to-int p3, p3

    .line 144
    iput p3, v3, Landroid/graphics/Rect;->bottom:I

    .line 145
    .line 146
    :cond_2
    invoke-virtual {v0, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->setBoundsInParent(Landroid/graphics/Rect;)V

    .line 147
    .line 148
    .line 149
    iget-object p3, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 150
    .line 151
    invoke-virtual {p3}, Landroid/widget/LinearLayout;->isVisibleToUser()Z

    .line 152
    .line 153
    .line 154
    move-result p3

    .line 155
    invoke-virtual {v0, p3}, Landroid/view/accessibility/AccessibilityNodeInfo;->setVisibleToUser(Z)V

    .line 156
    .line 157
    .line 158
    iget-object p3, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->b:[I

    .line 159
    .line 160
    iget-object p4, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 161
    .line 162
    invoke-virtual {p4, p3}, Landroid/widget/LinearLayout;->getLocationOnScreen([I)V

    .line 163
    .line 164
    .line 165
    const/4 p4, 0x0

    .line 166
    aget p4, p3, p4

    .line 167
    .line 168
    aget p3, p3, v2

    .line 169
    .line 170
    invoke-virtual {v3, p4, p3}, Landroid/graphics/Rect;->offset(II)V

    .line 171
    .line 172
    .line 173
    if-eqz p1, :cond_3

    .line 174
    .line 175
    iget p1, v3, Landroid/graphics/Rect;->left:I

    .line 176
    .line 177
    int-to-float p1, p1

    .line 178
    mul-float/2addr p1, v1

    .line 179
    add-float/2addr p1, p2

    .line 180
    float-to-int p1, p1

    .line 181
    iput p1, v3, Landroid/graphics/Rect;->left:I

    .line 182
    .line 183
    iget p1, v3, Landroid/graphics/Rect;->top:I

    .line 184
    .line 185
    int-to-float p1, p1

    .line 186
    mul-float/2addr p1, v1

    .line 187
    add-float/2addr p1, p2

    .line 188
    float-to-int p1, p1

    .line 189
    iput p1, v3, Landroid/graphics/Rect;->top:I

    .line 190
    .line 191
    iget p1, v3, Landroid/graphics/Rect;->right:I

    .line 192
    .line 193
    int-to-float p1, p1

    .line 194
    mul-float/2addr p1, v1

    .line 195
    add-float/2addr p1, p2

    .line 196
    float-to-int p1, p1

    .line 197
    iput p1, v3, Landroid/graphics/Rect;->right:I

    .line 198
    .line 199
    iget p1, v3, Landroid/graphics/Rect;->bottom:I

    .line 200
    .line 201
    int-to-float p1, p1

    .line 202
    mul-float/2addr p1, v1

    .line 203
    add-float/2addr p1, p2

    .line 204
    float-to-int p1, p1

    .line 205
    iput p1, v3, Landroid/graphics/Rect;->bottom:I

    .line 206
    .line 207
    :cond_3
    invoke-virtual {v0, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->setBoundsInScreen(Landroid/graphics/Rect;)V

    .line 208
    .line 209
    .line 210
    iget p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 211
    .line 212
    const/4 p2, -0x1

    .line 213
    if-eq p1, p2, :cond_4

    .line 214
    .line 215
    const/16 p1, 0x40

    .line 216
    .line 217
    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 218
    .line 219
    .line 220
    :cond_4
    iget p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 221
    .line 222
    if-ne p1, p2, :cond_5

    .line 223
    .line 224
    const/16 p1, 0x80

    .line 225
    .line 226
    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 227
    .line 228
    .line 229
    :cond_5
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 230
    .line 231
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->isEnabled()Z

    .line 232
    .line 233
    .line 234
    move-result p1

    .line 235
    if-eqz p1, :cond_9

    .line 236
    .line 237
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 238
    .line 239
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getWrapSelectorWheel()Z

    .line 240
    .line 241
    .line 242
    move-result p1

    .line 243
    if-nez p1, :cond_6

    .line 244
    .line 245
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 246
    .line 247
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 248
    .line 249
    .line 250
    move-result p1

    .line 251
    iget-object p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 252
    .line 253
    invoke-virtual {p2}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getMaxValue()I

    .line 254
    .line 255
    .line 256
    move-result p2

    .line 257
    if-ge p1, p2, :cond_7

    .line 258
    .line 259
    :cond_6
    const/16 p1, 0x1000

    .line 260
    .line 261
    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 262
    .line 263
    .line 264
    :cond_7
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 265
    .line 266
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getWrapSelectorWheel()Z

    .line 267
    .line 268
    .line 269
    move-result p1

    .line 270
    if-nez p1, :cond_8

    .line 271
    .line 272
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 273
    .line 274
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 275
    .line 276
    .line 277
    move-result p1

    .line 278
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 279
    .line 280
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getMinValue()I

    .line 281
    .line 282
    .line 283
    move-result p0

    .line 284
    if-le p1, p0, :cond_9

    .line 285
    .line 286
    :cond_8
    const/16 p0, 0x2000

    .line 287
    .line 288
    invoke-virtual {v0, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 289
    .line 290
    .line 291
    :cond_9
    return-object v0
.end method

.method private b(ILjava/lang/String;IIII)Landroid/view/accessibility/AccessibilityNodeInfo;
    .locals 2

    .line 1
    invoke-static {}, Landroid/view/accessibility/AccessibilityNodeInfo;->obtain()Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Landroid/widget/Button;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->E(Lcom/zte/mifavor/widget/NumberPickerZTE;)Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setPackageName(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 28
    .line 29
    invoke-virtual {v0, v1, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setSource(Landroid/view/View;I)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setParent(Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    const/4 p2, 0x1

    .line 41
    invoke-virtual {v0, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClickable(Z)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setLongClickable(Z)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 48
    .line 49
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->isEnabled()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setEnabled(Z)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->a:Landroid/graphics/Rect;

    .line 57
    .line 58
    invoke-virtual {v1, p3, p4, p5, p6}, Landroid/graphics/Rect;->set(IIII)V

    .line 59
    .line 60
    .line 61
    iget-object p3, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 62
    .line 63
    invoke-static {p3, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->F(Lcom/zte/mifavor/widget/NumberPickerZTE;Landroid/graphics/Rect;)Z

    .line 64
    .line 65
    .line 66
    move-result p3

    .line 67
    invoke-virtual {v0, p3}, Landroid/view/accessibility/AccessibilityNodeInfo;->setVisibleToUser(Z)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setBoundsInParent(Landroid/graphics/Rect;)V

    .line 71
    .line 72
    .line 73
    iget-object p3, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->b:[I

    .line 74
    .line 75
    iget-object p4, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 76
    .line 77
    invoke-virtual {p4, p3}, Landroid/widget/LinearLayout;->getLocationOnScreen([I)V

    .line 78
    .line 79
    .line 80
    const/4 p4, 0x0

    .line 81
    aget p4, p3, p4

    .line 82
    .line 83
    aget p2, p3, p2

    .line 84
    .line 85
    invoke-virtual {v1, p4, p2}, Landroid/graphics/Rect;->offset(II)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setBoundsInScreen(Landroid/graphics/Rect;)V

    .line 89
    .line 90
    .line 91
    iget p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 92
    .line 93
    if-eq p2, p1, :cond_0

    .line 94
    .line 95
    const/16 p2, 0x40

    .line 96
    .line 97
    invoke-virtual {v0, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 98
    .line 99
    .line 100
    :cond_0
    iget p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 101
    .line 102
    if-ne p2, p1, :cond_1

    .line 103
    .line 104
    const/16 p1, 0x80

    .line 105
    .line 106
    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 107
    .line 108
    .line 109
    :cond_1
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 110
    .line 111
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isEnabled()Z

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    if-eqz p0, :cond_2

    .line 116
    .line 117
    const/16 p0, 0x10

    .line 118
    .line 119
    invoke-virtual {v0, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 120
    .line 121
    .line 122
    :cond_2
    return-object v0
.end method

.method private c(IIII)Landroid/view/accessibility/AccessibilityNodeInfo;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->e(Lcom/zte/mifavor/widget/NumberPickerZTE;)Landroid/widget/EditText;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/widget/EditText;->createAccessibilityNodeInfo()Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 12
    .line 13
    const/4 v2, 0x2

    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setSource(Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    iget v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 18
    .line 19
    if-eq v1, v2, :cond_0

    .line 20
    .line 21
    const/16 v1, 0x40

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 27
    .line 28
    if-ne v1, v2, :cond_1

    .line 29
    .line 30
    const/16 v1, 0x80

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->a:Landroid/graphics/Rect;

    .line 36
    .line 37
    invoke-virtual {v1, p1, p2, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 41
    .line 42
    invoke-static {p1, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->D(Lcom/zte/mifavor/widget/NumberPickerZTE;Landroid/graphics/Rect;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setVisibleToUser(Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setBoundsInParent(Landroid/graphics/Rect;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->b:[I

    .line 53
    .line 54
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->getLocationOnScreen([I)V

    .line 57
    .line 58
    .line 59
    const/4 p0, 0x0

    .line 60
    aget p0, p1, p0

    .line 61
    .line 62
    const/4 p2, 0x1

    .line 63
    aget p1, p1, p2

    .line 64
    .line 65
    invoke-virtual {v1, p0, p1}, Landroid/graphics/Rect;->offset(II)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setBoundsInScreen(Landroid/graphics/Rect;)V

    .line 69
    .line 70
    .line 71
    return-object v0
.end method

.method private d(Ljava/lang/String;ILjava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List<",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p2, v0, :cond_3

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p2, v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    if-eq p2, v0, :cond_0

    .line 9
    .line 10
    goto/16 :goto_0

    .line 11
    .line 12
    :cond_0
    invoke-direct {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->e()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_4

    .line 21
    .line 22
    invoke-virtual {p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p2, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_4

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-interface {p3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    iget-object p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 49
    .line 50
    invoke-static {p2}, Lcom/zte/mifavor/widget/NumberPickerZTE;->e(Lcom/zte/mifavor/widget/NumberPickerZTE;)Landroid/widget/EditText;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-nez v1, :cond_2

    .line 63
    .line 64
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {p2, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    invoke-virtual {p2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    if-eqz p2, :cond_2

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-interface {p3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_2
    iget-object p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 91
    .line 92
    invoke-static {p2}, Lcom/zte/mifavor/widget/NumberPickerZTE;->e(Lcom/zte/mifavor/widget/NumberPickerZTE;)Landroid/widget/EditText;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-nez v1, :cond_4

    .line 105
    .line 106
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {p2, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    invoke-virtual {p2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-eqz p1, :cond_4

    .line 123
    .line 124
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-interface {p3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_3
    invoke-direct {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->f()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-nez v1, :cond_4

    .line 141
    .line 142
    invoke-virtual {p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-virtual {p2, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p2

    .line 154
    invoke-virtual {p2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    if-eqz p1, :cond_4

    .line 159
    .line 160
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    invoke-interface {p3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    :cond_4
    :goto_0
    return-void
.end method

.method private e()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->l(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->m(Lcom/zte/mifavor/widget/NumberPickerZTE;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->t(Lcom/zte/mifavor/widget/NumberPickerZTE;I)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    :cond_0
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 24
    .line 25
    invoke-static {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->h(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-lt v0, v1, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->c(Lcom/zte/mifavor/widget/NumberPickerZTE;)[Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 40
    .line 41
    invoke-static {p0, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->r(Lcom/zte/mifavor/widget/NumberPickerZTE;I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_1
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 47
    .line 48
    invoke-static {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->c(Lcom/zte/mifavor/widget/NumberPickerZTE;)[Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 53
    .line 54
    invoke-static {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->h(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    sub-int/2addr v0, p0

    .line 59
    aget-object p0, v1, v0

    .line 60
    .line 61
    return-object p0

    .line 62
    :cond_2
    const/4 p0, 0x0

    .line 63
    return-object p0
.end method

.method private f()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->l(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->m(Lcom/zte/mifavor/widget/NumberPickerZTE;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->t(Lcom/zte/mifavor/widget/NumberPickerZTE;I)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    :cond_0
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 24
    .line 25
    invoke-static {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->g(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-gt v0, v1, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->c(Lcom/zte/mifavor/widget/NumberPickerZTE;)[Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 40
    .line 41
    invoke-static {p0, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->r(Lcom/zte/mifavor/widget/NumberPickerZTE;I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_1
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 47
    .line 48
    invoke-static {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->c(Lcom/zte/mifavor/widget/NumberPickerZTE;)[Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 53
    .line 54
    invoke-static {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->h(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    sub-int/2addr v0, p0

    .line 59
    aget-object p0, v1, v0

    .line 60
    .line 61
    return-object p0

    .line 62
    :cond_2
    const/4 p0, 0x0

    .line 63
    return-object p0
.end method

.method private g()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getWrapSelectorWheel()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getMinValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-le v0, p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method private h()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getWrapSelectorWheel()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getMaxValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-ge v0, p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method private i(IILjava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->B(Lcom/zte/mifavor/widget/NumberPickerZTE;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "accessibility"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-static {p2}, Landroid/view/accessibility/AccessibilityEvent;->obtain(I)Landroid/view/accessibility/AccessibilityEvent;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    const-class v0, Landroid/widget/Button;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p2, v0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->C(Lcom/zte/mifavor/widget/NumberPickerZTE;)Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p2, v0}, Landroid/view/accessibility/AccessibilityEvent;->setPackageName(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-interface {v0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    iget-object p3, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 55
    .line 56
    invoke-virtual {p3}, Landroid/widget/LinearLayout;->isEnabled()Z

    .line 57
    .line 58
    .line 59
    move-result p3

    .line 60
    invoke-virtual {p2, p3}, Landroid/view/accessibility/AccessibilityEvent;->setEnabled(Z)V

    .line 61
    .line 62
    .line 63
    iget-object p3, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 64
    .line 65
    invoke-virtual {p2, p3, p1}, Landroid/view/accessibility/AccessibilityEvent;->setSource(Landroid/view/View;I)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 69
    .line 70
    invoke-virtual {p0, p0, p2}, Landroid/widget/LinearLayout;->requestSendAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    .line 71
    .line 72
    .line 73
    :cond_0
    return-void
.end method

.method private j(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->A(Lcom/zte/mifavor/widget/NumberPickerZTE;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "accessibility"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-static {p1}, Landroid/view/accessibility/AccessibilityEvent;->obtain(I)Landroid/view/accessibility/AccessibilityEvent;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->e(Lcom/zte/mifavor/widget/NumberPickerZTE;)Landroid/widget/EditText;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0, p1}, Landroid/widget/EditText;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->e(Lcom/zte/mifavor/widget/NumberPickerZTE;)Landroid/widget/EditText;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0, p1}, Landroid/widget/EditText;->onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 44
    .line 45
    const/4 v1, 0x2

    .line 46
    invoke-virtual {p1, v0, v1}, Landroid/view/accessibility/AccessibilityEvent;->setSource(Landroid/view/View;I)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 50
    .line 51
    invoke-virtual {p0, p0, p1}, Landroid/widget/LinearLayout;->requestSendAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method


# virtual methods
.method public createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;
    .locals 7

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eq p1, v0, :cond_3

    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    if-eq p1, v0, :cond_2

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    if-eq p1, v0, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x3

    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    invoke-super {p0, p1}, Landroid/view/accessibility/AccessibilityNodeProvider;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-direct {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->e()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getScrollX()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getScrollY()I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getScrollX()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getRight()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 47
    .line 48
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLeft()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    sub-int/2addr v0, v1

    .line 53
    add-int v5, p1, v0

    .line 54
    .line 55
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 56
    .line 57
    invoke-static {p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->k(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 62
    .line 63
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->i(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int v6, p1, v0

    .line 68
    .line 69
    const/4 v1, 0x3

    .line 70
    move-object v0, p0

    .line 71
    invoke-direct/range {v0 .. v6}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->b(ILjava/lang/String;IIII)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_1
    move-object v0, p0

    .line 77
    iget-object p0, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 78
    .line 79
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getScrollX()I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    iget-object p1, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 84
    .line 85
    invoke-static {p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->k(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    iget-object v1, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 90
    .line 91
    invoke-static {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->i(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    add-int/2addr p1, v1

    .line 96
    iget-object v1, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 97
    .line 98
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getScrollX()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    iget-object v2, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 103
    .line 104
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getRight()I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    iget-object v3, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 109
    .line 110
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getLeft()I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    sub-int/2addr v2, v3

    .line 115
    add-int/2addr v1, v2

    .line 116
    iget-object v2, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 117
    .line 118
    invoke-static {v2}, Lcom/zte/mifavor/widget/NumberPickerZTE;->a(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    iget-object v3, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 123
    .line 124
    invoke-static {v3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->i(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    sub-int/2addr v2, v3

    .line 129
    invoke-direct {v0, p0, p1, v1, v2}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c(IIII)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    return-object p0

    .line 134
    :cond_2
    move-object v0, p0

    .line 135
    invoke-direct {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->f()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    iget-object p0, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 140
    .line 141
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getScrollX()I

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    iget-object p0, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 146
    .line 147
    invoke-static {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->a(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 148
    .line 149
    .line 150
    move-result p0

    .line 151
    iget-object p1, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 152
    .line 153
    invoke-static {p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->i(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    sub-int v4, p0, p1

    .line 158
    .line 159
    iget-object p0, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 160
    .line 161
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getScrollX()I

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    iget-object p1, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 166
    .line 167
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getRight()I

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    iget-object v1, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 172
    .line 173
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLeft()I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    sub-int/2addr p1, v1

    .line 178
    add-int v5, p0, p1

    .line 179
    .line 180
    iget-object p0, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 181
    .line 182
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getScrollY()I

    .line 183
    .line 184
    .line 185
    move-result p0

    .line 186
    iget-object p1, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 187
    .line 188
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getBottom()I

    .line 189
    .line 190
    .line 191
    move-result p1

    .line 192
    iget-object v1, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 193
    .line 194
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getTop()I

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    sub-int/2addr p1, v1

    .line 199
    add-int v6, p0, p1

    .line 200
    .line 201
    const/4 v1, 0x1

    .line 202
    invoke-direct/range {v0 .. v6}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->b(ILjava/lang/String;IIII)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    return-object p0

    .line 207
    :cond_3
    move-object v0, p0

    .line 208
    iget-object p0, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 209
    .line 210
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getScrollX()I

    .line 211
    .line 212
    .line 213
    move-result p0

    .line 214
    iget-object p1, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 215
    .line 216
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getScrollY()I

    .line 217
    .line 218
    .line 219
    move-result p1

    .line 220
    iget-object v1, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 221
    .line 222
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getScrollX()I

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    iget-object v2, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 227
    .line 228
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getRight()I

    .line 229
    .line 230
    .line 231
    move-result v2

    .line 232
    iget-object v3, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 233
    .line 234
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getLeft()I

    .line 235
    .line 236
    .line 237
    move-result v3

    .line 238
    sub-int/2addr v2, v3

    .line 239
    add-int/2addr v1, v2

    .line 240
    iget-object v2, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 241
    .line 242
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getScrollY()I

    .line 243
    .line 244
    .line 245
    move-result v2

    .line 246
    iget-object v3, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 247
    .line 248
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getBottom()I

    .line 249
    .line 250
    .line 251
    move-result v3

    .line 252
    iget-object v4, v0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 253
    .line 254
    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getTop()I

    .line 255
    .line 256
    .line 257
    move-result v4

    .line 258
    sub-int/2addr v3, v4

    .line 259
    add-int/2addr v2, v3

    .line 260
    invoke-direct {v0, p0, p1, v1, v2}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->a(IIII)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 261
    .line 262
    .line 263
    move-result-object p0

    .line 264
    return-object p0
.end method

.method public findAccessibilityNodeInfosByText(Ljava/lang/String;I)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/List<",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    const/4 v2, -0x1

    .line 24
    const/4 v3, 0x3

    .line 25
    const/4 v4, 0x2

    .line 26
    const/4 v5, 0x1

    .line 27
    if-eq p2, v2, :cond_2

    .line 28
    .line 29
    if-eq p2, v5, :cond_1

    .line 30
    .line 31
    if-eq p2, v4, :cond_1

    .line 32
    .line 33
    if-eq p2, v3, :cond_1

    .line 34
    .line 35
    invoke-super {p0, p1, p2}, Landroid/view/accessibility/AccessibilityNodeProvider;->findAccessibilityNodeInfosByText(Ljava/lang/String;I)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_1
    invoke-direct {p0, v0, p2, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d(Ljava/lang/String;ILjava/util/List;)V

    .line 41
    .line 42
    .line 43
    return-object v1

    .line 44
    :cond_2
    invoke-direct {p0, v0, v3, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d(Ljava/lang/String;ILjava/util/List;)V

    .line 45
    .line 46
    .line 47
    invoke-direct {p0, v0, v4, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d(Ljava/lang/String;ILjava/util/List;)V

    .line 48
    .line 49
    .line 50
    invoke-direct {p0, v0, v5, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d(Ljava/lang/String;ILjava/util/List;)V

    .line 51
    .line 52
    .line 53
    return-object v1
.end method

.method public k(II)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p1, v0, :cond_2

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p1, v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-direct {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->g()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    invoke-direct {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->e()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->i(IILjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-direct {p0, p2}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->j(I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_2
    invoke-direct {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->h()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    invoke-direct {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->f()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->i(IILjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_3
    :goto_0
    return-void
.end method

.method public performAction(IILandroid/os/Bundle;)Z
    .locals 9

    .line 1
    const/4 v0, -0x1

    .line 2
    const/high16 v1, -0x80000000

    .line 3
    .line 4
    const/16 v2, 0x80

    .line 5
    .line 6
    const/16 v3, 0x40

    .line 7
    .line 8
    const/4 v4, 0x1

    .line 9
    const/4 v5, 0x0

    .line 10
    if-eq p1, v0, :cond_1a

    .line 11
    .line 12
    const v0, 0x8000

    .line 13
    .line 14
    .line 15
    const/high16 v6, 0x10000

    .line 16
    .line 17
    const/16 v7, 0x10

    .line 18
    .line 19
    if-eq p1, v4, :cond_13

    .line 20
    .line 21
    const/4 v8, 0x2

    .line 22
    if-eq p1, v8, :cond_8

    .line 23
    .line 24
    const/4 v8, 0x3

    .line 25
    if-eq p1, v8, :cond_0

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :cond_0
    if-eq p2, v7, :cond_5

    .line 30
    .line 31
    if-eq p2, v3, :cond_3

    .line 32
    .line 33
    if-eq p2, v2, :cond_1

    .line 34
    .line 35
    return v5

    .line 36
    :cond_1
    iget p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 37
    .line 38
    if-ne p2, p1, :cond_2

    .line 39
    .line 40
    iput v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 41
    .line 42
    invoke-virtual {p0, p1, v6}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->k(II)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getRight()I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 52
    .line 53
    invoke-static {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->k(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    invoke-virtual {p1, v5, v5, p2, p0}, Landroid/widget/LinearLayout;->invalidate(IIII)V

    .line 58
    .line 59
    .line 60
    return v4

    .line 61
    :cond_2
    return v5

    .line 62
    :cond_3
    iget p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 63
    .line 64
    if-eq p2, p1, :cond_4

    .line 65
    .line 66
    iput p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 67
    .line 68
    invoke-virtual {p0, p1, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->k(II)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 72
    .line 73
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getRight()I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 78
    .line 79
    invoke-static {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->k(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    invoke-virtual {p1, v5, v5, p2, p0}, Landroid/widget/LinearLayout;->invalidate(IIII)V

    .line 84
    .line 85
    .line 86
    return v4

    .line 87
    :cond_4
    return v5

    .line 88
    :cond_5
    iget-object p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 89
    .line 90
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->isEnabled()Z

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    if-eqz p2, :cond_7

    .line 95
    .line 96
    if-ne p1, v4, :cond_6

    .line 97
    .line 98
    move v5, v4

    .line 99
    :cond_6
    iget-object p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 100
    .line 101
    invoke-static {p2, v5}, Lcom/zte/mifavor/widget/NumberPickerZTE;->q(Lcom/zte/mifavor/widget/NumberPickerZTE;Z)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, p1, v4}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->k(II)V

    .line 105
    .line 106
    .line 107
    return v4

    .line 108
    :cond_7
    return v5

    .line 109
    :cond_8
    if-eq p2, v4, :cond_11

    .line 110
    .line 111
    if-eq p2, v8, :cond_f

    .line 112
    .line 113
    if-eq p2, v7, :cond_d

    .line 114
    .line 115
    if-eq p2, v3, :cond_b

    .line 116
    .line 117
    if-eq p2, v2, :cond_9

    .line 118
    .line 119
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 120
    .line 121
    invoke-static {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->e(Lcom/zte/mifavor/widget/NumberPickerZTE;)Landroid/widget/EditText;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {p0, p2, p3}, Landroid/widget/EditText;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    return p0

    .line 130
    :cond_9
    iget p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 131
    .line 132
    if-ne p2, p1, :cond_a

    .line 133
    .line 134
    iput v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 135
    .line 136
    invoke-virtual {p0, p1, v6}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->k(II)V

    .line 137
    .line 138
    .line 139
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 140
    .line 141
    invoke-static {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->e(Lcom/zte/mifavor/widget/NumberPickerZTE;)Landroid/widget/EditText;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-virtual {p0}, Landroid/widget/EditText;->invalidate()V

    .line 146
    .line 147
    .line 148
    return v4

    .line 149
    :cond_a
    return v5

    .line 150
    :cond_b
    iget p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 151
    .line 152
    if-eq p2, p1, :cond_c

    .line 153
    .line 154
    iput p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 155
    .line 156
    invoke-virtual {p0, p1, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->k(II)V

    .line 157
    .line 158
    .line 159
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 160
    .line 161
    invoke-static {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->e(Lcom/zte/mifavor/widget/NumberPickerZTE;)Landroid/widget/EditText;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-virtual {p0}, Landroid/widget/EditText;->invalidate()V

    .line 166
    .line 167
    .line 168
    return v4

    .line 169
    :cond_c
    return v5

    .line 170
    :cond_d
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 171
    .line 172
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->isEnabled()Z

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-eqz p1, :cond_e

    .line 177
    .line 178
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 179
    .line 180
    invoke-static {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->x(Lcom/zte/mifavor/widget/NumberPickerZTE;)V

    .line 181
    .line 182
    .line 183
    return v4

    .line 184
    :cond_e
    return v5

    .line 185
    :cond_f
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 186
    .line 187
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->isEnabled()Z

    .line 188
    .line 189
    .line 190
    move-result p1

    .line 191
    if-eqz p1, :cond_10

    .line 192
    .line 193
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 194
    .line 195
    invoke-static {p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->e(Lcom/zte/mifavor/widget/NumberPickerZTE;)Landroid/widget/EditText;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    invoke-virtual {p1}, Landroid/widget/EditText;->isFocused()Z

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    if-eqz p1, :cond_10

    .line 204
    .line 205
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 206
    .line 207
    invoke-static {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->e(Lcom/zte/mifavor/widget/NumberPickerZTE;)Landroid/widget/EditText;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    invoke-virtual {p0}, Landroid/widget/EditText;->clearFocus()V

    .line 212
    .line 213
    .line 214
    return v4

    .line 215
    :cond_10
    return v5

    .line 216
    :cond_11
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 217
    .line 218
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->isEnabled()Z

    .line 219
    .line 220
    .line 221
    move-result p1

    .line 222
    if-eqz p1, :cond_12

    .line 223
    .line 224
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 225
    .line 226
    invoke-static {p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->e(Lcom/zte/mifavor/widget/NumberPickerZTE;)Landroid/widget/EditText;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    invoke-virtual {p1}, Landroid/widget/EditText;->isFocused()Z

    .line 231
    .line 232
    .line 233
    move-result p1

    .line 234
    if-nez p1, :cond_12

    .line 235
    .line 236
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 237
    .line 238
    invoke-static {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->e(Lcom/zte/mifavor/widget/NumberPickerZTE;)Landroid/widget/EditText;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    invoke-virtual {p0}, Landroid/widget/EditText;->requestFocus()Z

    .line 243
    .line 244
    .line 245
    move-result p0

    .line 246
    return p0

    .line 247
    :cond_12
    return v5

    .line 248
    :cond_13
    if-eq p2, v7, :cond_18

    .line 249
    .line 250
    if-eq p2, v3, :cond_16

    .line 251
    .line 252
    if-eq p2, v2, :cond_14

    .line 253
    .line 254
    return v5

    .line 255
    :cond_14
    iget p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 256
    .line 257
    if-ne p2, p1, :cond_15

    .line 258
    .line 259
    iput v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 260
    .line 261
    invoke-virtual {p0, p1, v6}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->k(II)V

    .line 262
    .line 263
    .line 264
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 265
    .line 266
    invoke-static {p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->a(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 267
    .line 268
    .line 269
    move-result p2

    .line 270
    iget-object p3, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 271
    .line 272
    invoke-virtual {p3}, Landroid/widget/LinearLayout;->getRight()I

    .line 273
    .line 274
    .line 275
    move-result p3

    .line 276
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 277
    .line 278
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBottom()I

    .line 279
    .line 280
    .line 281
    move-result p0

    .line 282
    invoke-virtual {p1, v5, p2, p3, p0}, Landroid/widget/LinearLayout;->invalidate(IIII)V

    .line 283
    .line 284
    .line 285
    return v4

    .line 286
    :cond_15
    return v5

    .line 287
    :cond_16
    iget p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 288
    .line 289
    if-eq p2, p1, :cond_17

    .line 290
    .line 291
    iput p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 292
    .line 293
    invoke-virtual {p0, p1, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->k(II)V

    .line 294
    .line 295
    .line 296
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 297
    .line 298
    invoke-static {p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->a(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 299
    .line 300
    .line 301
    move-result p2

    .line 302
    iget-object p3, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 303
    .line 304
    invoke-virtual {p3}, Landroid/widget/LinearLayout;->getRight()I

    .line 305
    .line 306
    .line 307
    move-result p3

    .line 308
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 309
    .line 310
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBottom()I

    .line 311
    .line 312
    .line 313
    move-result p0

    .line 314
    invoke-virtual {p1, v5, p2, p3, p0}, Landroid/widget/LinearLayout;->invalidate(IIII)V

    .line 315
    .line 316
    .line 317
    return v4

    .line 318
    :cond_17
    return v5

    .line 319
    :cond_18
    iget-object p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 320
    .line 321
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->isEnabled()Z

    .line 322
    .line 323
    .line 324
    move-result p2

    .line 325
    if-eqz p2, :cond_19

    .line 326
    .line 327
    iget-object p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 328
    .line 329
    invoke-static {p2, v4}, Lcom/zte/mifavor/widget/NumberPickerZTE;->q(Lcom/zte/mifavor/widget/NumberPickerZTE;Z)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {p0, p1, v4}, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->k(II)V

    .line 333
    .line 334
    .line 335
    return v4

    .line 336
    :cond_19
    return v5

    .line 337
    :cond_1a
    if-eq p2, v3, :cond_23

    .line 338
    .line 339
    if-eq p2, v2, :cond_21

    .line 340
    .line 341
    const/16 v0, 0x1000

    .line 342
    .line 343
    if-eq p2, v0, :cond_1e

    .line 344
    .line 345
    const/16 v0, 0x2000

    .line 346
    .line 347
    if-eq p2, v0, :cond_1b

    .line 348
    .line 349
    :goto_0
    invoke-super {p0, p1, p2, p3}, Landroid/view/accessibility/AccessibilityNodeProvider;->performAction(IILandroid/os/Bundle;)Z

    .line 350
    .line 351
    .line 352
    move-result p0

    .line 353
    return p0

    .line 354
    :cond_1b
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 355
    .line 356
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->isEnabled()Z

    .line 357
    .line 358
    .line 359
    move-result p1

    .line 360
    if-eqz p1, :cond_1d

    .line 361
    .line 362
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 363
    .line 364
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getWrapSelectorWheel()Z

    .line 365
    .line 366
    .line 367
    move-result p1

    .line 368
    if-nez p1, :cond_1c

    .line 369
    .line 370
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 371
    .line 372
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 373
    .line 374
    .line 375
    move-result p1

    .line 376
    iget-object p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 377
    .line 378
    invoke-virtual {p2}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getMinValue()I

    .line 379
    .line 380
    .line 381
    move-result p2

    .line 382
    if-le p1, p2, :cond_1d

    .line 383
    .line 384
    :cond_1c
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 385
    .line 386
    invoke-static {p0, v5}, Lcom/zte/mifavor/widget/NumberPickerZTE;->q(Lcom/zte/mifavor/widget/NumberPickerZTE;Z)V

    .line 387
    .line 388
    .line 389
    return v4

    .line 390
    :cond_1d
    return v5

    .line 391
    :cond_1e
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 392
    .line 393
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->isEnabled()Z

    .line 394
    .line 395
    .line 396
    move-result p1

    .line 397
    if-eqz p1, :cond_20

    .line 398
    .line 399
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 400
    .line 401
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getWrapSelectorWheel()Z

    .line 402
    .line 403
    .line 404
    move-result p1

    .line 405
    if-nez p1, :cond_1f

    .line 406
    .line 407
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 408
    .line 409
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 410
    .line 411
    .line 412
    move-result p1

    .line 413
    iget-object p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 414
    .line 415
    invoke-virtual {p2}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getMaxValue()I

    .line 416
    .line 417
    .line 418
    move-result p2

    .line 419
    if-ge p1, p2, :cond_20

    .line 420
    .line 421
    :cond_1f
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 422
    .line 423
    invoke-static {p0, v4}, Lcom/zte/mifavor/widget/NumberPickerZTE;->q(Lcom/zte/mifavor/widget/NumberPickerZTE;Z)V

    .line 424
    .line 425
    .line 426
    return v4

    .line 427
    :cond_20
    return v5

    .line 428
    :cond_21
    iget p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 429
    .line 430
    if-ne p2, p1, :cond_22

    .line 431
    .line 432
    iput v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 433
    .line 434
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 435
    .line 436
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->clearAccessibilityFocus()V

    .line 437
    .line 438
    .line 439
    return v4

    .line 440
    :cond_22
    return v5

    .line 441
    :cond_23
    iget p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 442
    .line 443
    if-eq p2, p1, :cond_24

    .line 444
    .line 445
    iput p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->c:I

    .line 446
    .line 447
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$d;->d:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 448
    .line 449
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestAccessibilityFocus()Z

    .line 450
    .line 451
    .line 452
    return v4

    .line 453
    :cond_24
    return v5
.end method
