.class public Lcom/android/launcher3/shortcuts/DeepShortcutView;
.super Landroid/widget/FrameLayout;
.source "DeepShortcutView.java"

# interfaces
.implements Lcom/android/launcher3/views/s;


# static fields
.field private static final l:Landroid/graphics/Point;


# instance fields
.field private final g:Landroid/graphics/drawable/Drawable;

.field private h:Lcom/android/launcher3/BubbleTextView;

.field private i:Landroid/view/View;

.field private j:Lcom/android/launcher3/model/data/I;

.field private k:Landroid/content/pm/ShortcutInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Point;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->l:Landroid/graphics/Point;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/shortcuts/DeepShortcutView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p1, Landroid/graphics/drawable/ColorDrawable;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object p1, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->g:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/popup/PopupContainerWithArrow;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/android/launcher3/a;->close(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p0

    .line 7
    const-string v0, "DeepShortcutView"

    .line 8
    .line 9
    const-string v1, "isAutoDismissAfterClick onClick error"

    .line 10
    .line 11
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/popup/PopupContainerWithArrow;Landroid/view/View;)V
    .locals 3

    .line 1
    const-string v0, "DeepShortcutView"

    .line 2
    .line 3
    const-string v1, "isAutoDismissAfterClick onClick"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->getItemClickListener()Landroid/view/View$OnClickListener;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, LN1/b;

    .line 16
    .line 17
    invoke-direct {v0, p0}, LN1/b;-><init>(Lcom/android/launcher3/popup/PopupContainerWithArrow;)V

    .line 18
    .line 19
    .line 20
    const-wide/16 v1, 0xc8

    .line 21
    .line 22
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private e()V
    .locals 4

    .line 1
    invoke-static {}, Lx1/O;->k1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    instance-of v0, v0, Landroid/graphics/drawable/GradientDrawable;

    .line 13
    .line 14
    if-eqz v0, :cond_3

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->h:Lcom/android/launcher3/BubbleTextView;

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const v2, 0x101042c

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v2}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    .line 39
    .line 40
    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 44
    .line 45
    .line 46
    const/4 v3, 0x0

    .line 47
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/graphics/drawable/GradientDrawable;->getCornerRadii()[F

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    if-eqz v3, :cond_2

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/graphics/drawable/GradientDrawable;->getCornerRadii()[F

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    invoke-virtual {v0}, Landroid/graphics/drawable/GradientDrawable;->getCornerRadius()F

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 69
    .line 70
    .line 71
    :goto_0
    new-instance v0, Landroid/graphics/drawable/RippleDrawable;

    .line 72
    .line 73
    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    iget-object v3, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->g:Landroid/graphics/drawable/Drawable;

    .line 78
    .line 79
    invoke-direct {v0, v1, v3, v2}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->h:Lcom/android/launcher3/BubbleTextView;

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 85
    .line 86
    .line 87
    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method public d(Lcom/android/launcher3/model/data/I;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/popup/PopupContainerWithArrow;)V
    .locals 6

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->j:Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->k:Landroid/content/pm/ShortcutInfo;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->h:Lcom/android/launcher3/BubbleTextView;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/android/launcher3/BubbleTextView;->y(Lcom/android/launcher3/model/data/I;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->h:Lcom/android/launcher3/BubbleTextView;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 13
    .line 14
    .line 15
    iget-object v0, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Ls1/d;->i()Landroid/graphics/drawable/Drawable;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 27
    .line 28
    invoke-virtual {v0}, Ls1/d;->i()Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    instance-of v2, v0, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 33
    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    iget-object v2, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->h:Lcom/android/launcher3/BubbleTextView;

    .line 37
    .line 38
    invoke-virtual {v2}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-static {v2, v0, v1}, Lx1/O;->V(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)Landroid/graphics/drawable/Drawable;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->h:Lcom/android/launcher3/BubbleTextView;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const v2, 0x7f070ab4

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    const-string v3, "deep_shortcut_bg"

    .line 69
    .line 70
    invoke-static {v2, v3}, Lf1/d;->f(Landroid/content/Context;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    iget-object v3, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->h:Lcom/android/launcher3/BubbleTextView;

    .line 75
    .line 76
    invoke-virtual {v3}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    iget-object v4, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->h:Lcom/android/launcher3/BubbleTextView;

    .line 81
    .line 82
    invoke-virtual {v4}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    invoke-static {v3, v4, v0}, Lx1/O;->V(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)Landroid/graphics/drawable/Drawable;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p3, v2, v0, v1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->c0(ILandroid/graphics/drawable/Drawable;I)Landroid/graphics/drawable/Drawable;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    :cond_1
    :goto_0
    invoke-static {}, Lcom/android/launcher3/widget/group/h;->e()Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    const/4 v3, 0x1

    .line 99
    if-eqz v2, :cond_2

    .line 100
    .line 101
    invoke-static {p2}, Lcom/android/launcher3/widget/group/h;->d(Landroid/content/pm/ShortcutInfo;)Lcom/android/launcher3/widget/group/WidgetShortcutData;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    if-eqz v2, :cond_2

    .line 106
    .line 107
    move v2, v3

    .line 108
    goto :goto_1

    .line 109
    :cond_2
    move v2, v1

    .line 110
    :goto_1
    iget-object v4, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->i:Landroid/view/View;

    .line 111
    .line 112
    invoke-virtual {v4, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->h:Lcom/android/launcher3/BubbleTextView;

    .line 116
    .line 117
    instance-of v0, v0, Lcom/android/launcher3/shortcuts/DeepShortcutTextView;

    .line 118
    .line 119
    if-eqz v0, :cond_4

    .line 120
    .line 121
    iget-object v0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->i:Landroid/view/View;

    .line 122
    .line 123
    invoke-virtual {v0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->i:Landroid/view/View;

    .line 127
    .line 128
    invoke-virtual {p3}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->getItemClickListener()Landroid/view/View$OnClickListener;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    invoke-virtual {v0, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 133
    .line 134
    .line 135
    if-nez v2, :cond_3

    .line 136
    .line 137
    iget-object v0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->i:Landroid/view/View;

    .line 138
    .line 139
    invoke-virtual {p3}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->getItemDragHandler()Lcom/android/launcher3/popup/PopupContainerWithArrow$f;

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    invoke-virtual {v0, v4}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 144
    .line 145
    .line 146
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->i:Landroid/view/View;

    .line 147
    .line 148
    invoke-virtual {p3}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->getItemDragHandler()Lcom/android/launcher3/popup/PopupContainerWithArrow$f;

    .line 149
    .line 150
    .line 151
    move-result-object v4

    .line 152
    invoke-virtual {v0, v4}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 153
    .line 154
    .line 155
    :cond_4
    invoke-static {}, Lcom/android/launcher3/widget/group/h;->e()Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_5

    .line 160
    .line 161
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->getIntent()Landroid/content/Intent;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-static {p1, p2, p3}, Lcom/android/launcher3/widget/group/h;->i(Landroid/content/Intent;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/popup/PopupContainerWithArrow;)V

    .line 166
    .line 167
    .line 168
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->k:Landroid/content/pm/ShortcutInfo;

    .line 169
    .line 170
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getLongLabel()Ljava/lang/CharSequence;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    iget-object v0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->h:Lcom/android/launcher3/BubbleTextView;

    .line 175
    .line 176
    invoke-virtual {v0}, Landroid/widget/TextView;->getWidth()I

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    iget-object v4, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->h:Lcom/android/launcher3/BubbleTextView;

    .line 181
    .line 182
    invoke-virtual {v4}, Landroid/widget/TextView;->getTotalPaddingLeft()I

    .line 183
    .line 184
    .line 185
    move-result v4

    .line 186
    sub-int/2addr v0, v4

    .line 187
    iget-object v4, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->h:Lcom/android/launcher3/BubbleTextView;

    .line 188
    .line 189
    invoke-virtual {v4}, Landroid/widget/TextView;->getTotalPaddingRight()I

    .line 190
    .line 191
    .line 192
    move-result v4

    .line 193
    sub-int/2addr v0, v4

    .line 194
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 195
    .line 196
    .line 197
    move-result v4

    .line 198
    if-nez v4, :cond_6

    .line 199
    .line 200
    iget-object v4, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->h:Lcom/android/launcher3/BubbleTextView;

    .line 201
    .line 202
    invoke-virtual {v4}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 203
    .line 204
    .line 205
    move-result-object v4

    .line 206
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v5

    .line 210
    invoke-virtual {v4, v5}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    .line 211
    .line 212
    .line 213
    move-result v4

    .line 214
    int-to-float v0, v0

    .line 215
    cmpg-float v0, v4, v0

    .line 216
    .line 217
    if-gtz v0, :cond_6

    .line 218
    .line 219
    move v1, v3

    .line 220
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->h:Lcom/android/launcher3/BubbleTextView;

    .line 221
    .line 222
    if-eqz v1, :cond_7

    .line 223
    .line 224
    goto :goto_2

    .line 225
    :cond_7
    iget-object p1, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->k:Landroid/content/pm/ShortcutInfo;

    .line 226
    .line 227
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getShortLabel()Ljava/lang/CharSequence;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    :goto_2
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 232
    .line 233
    .line 234
    iget-object p1, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->h:Lcom/android/launcher3/BubbleTextView;

    .line 235
    .line 236
    invoke-virtual {p3}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->getItemClickListener()Landroid/view/View$OnClickListener;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 241
    .line 242
    .line 243
    if-nez v2, :cond_8

    .line 244
    .line 245
    iget-object p1, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->h:Lcom/android/launcher3/BubbleTextView;

    .line 246
    .line 247
    invoke-virtual {p3}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->getItemDragHandler()Lcom/android/launcher3/popup/PopupContainerWithArrow$f;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 252
    .line 253
    .line 254
    :cond_8
    iget-object p1, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->h:Lcom/android/launcher3/BubbleTextView;

    .line 255
    .line 256
    invoke-virtual {p3}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->getItemDragHandler()Lcom/android/launcher3/popup/PopupContainerWithArrow$f;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 261
    .line 262
    .line 263
    invoke-static {}, Lcom/android/launcher3/widget/group/h;->e()Z

    .line 264
    .line 265
    .line 266
    move-result p1

    .line 267
    if-eqz p1, :cond_a

    .line 268
    .line 269
    invoke-static {p2}, Lcom/android/launcher3/widget/group/h;->d(Landroid/content/pm/ShortcutInfo;)Lcom/android/launcher3/widget/group/WidgetShortcutData;

    .line 270
    .line 271
    .line 272
    move-result-object p1

    .line 273
    if-eqz p1, :cond_a

    .line 274
    .line 275
    invoke-virtual {p1}, Lcom/android/launcher3/widget/group/WidgetShortcutData;->isAvailable()Z

    .line 276
    .line 277
    .line 278
    move-result p2

    .line 279
    if-eqz p2, :cond_a

    .line 280
    .line 281
    invoke-virtual {p1}, Lcom/android/launcher3/widget/group/WidgetShortcutData;->isAutoDismissAfterClick()Z

    .line 282
    .line 283
    .line 284
    move-result p1

    .line 285
    if-eqz p1, :cond_a

    .line 286
    .line 287
    new-instance p1, LN1/a;

    .line 288
    .line 289
    invoke-direct {p1, p3}, LN1/a;-><init>(Lcom/android/launcher3/popup/PopupContainerWithArrow;)V

    .line 290
    .line 291
    .line 292
    iget-object p2, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->i:Landroid/view/View;

    .line 293
    .line 294
    instance-of p3, p2, Lcom/android/launcher3/shortcuts/DeepShortcutTextView;

    .line 295
    .line 296
    if-eqz p3, :cond_9

    .line 297
    .line 298
    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 299
    .line 300
    .line 301
    :cond_9
    iget-object p0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->h:Lcom/android/launcher3/BubbleTextView;

    .line 302
    .line 303
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 304
    .line 305
    .line 306
    :cond_a
    return-void
.end method

.method public getBubbleText()Lcom/android/launcher3/BubbleTextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->h:Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDetail()Landroid/content/pm/ShortcutInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->k:Landroid/content/pm/ShortcutInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFinalInfo()Lcom/android/launcher3/model/data/I;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->j:Lcom/android/launcher3/model/data/I;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/model/data/I;-><init>(Lcom/android/launcher3/model/data/I;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object p0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->k:Landroid/content/pm/ShortcutInfo;

    .line 21
    .line 22
    invoke-virtual {v1, v0, p0}, Lcom/android/launcher3/D3;->d1(Lcom/android/launcher3/model/data/I;Landroid/content/pm/ShortcutInfo;)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public getIconCenter()Landroid/graphics/Point;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->l:Landroid/graphics/Point;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    div-int/lit8 v1, v1, 0x2

    .line 8
    .line 9
    iput v1, v0, Landroid/graphics/Point;->x:I

    .line 10
    .line 11
    iput v1, v0, Landroid/graphics/Point;->y:I

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    iget v1, v0, Landroid/graphics/Point;->x:I

    .line 28
    .line 29
    sub-int/2addr p0, v1

    .line 30
    iput p0, v0, Landroid/graphics/Point;->x:I

    .line 31
    .line 32
    :cond_0
    return-object v0
.end method

.method public getIconView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->i:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method protected onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b012d

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->h:Lcom/android/launcher3/BubbleTextView;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/BubbleTextView;->setHideBadge(Z)V

    .line 17
    .line 18
    .line 19
    const v0, 0x7f0b02fc

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->i:Landroid/view/View;

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->e()V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lx1/O;->k1()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setDefaultFocusHighlightEnabled(Z)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public setBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->e()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setBackgroundResource(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setBackgroundResource(I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->e()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic setForceHideDot(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/s;->setForceHideDot(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic setForceHideRing(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/H;->setForceHideRing(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic setIconVisible(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/s;->setIconVisible(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setWillDrawIcon(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutView;->i:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p1, 0x4

    .line 8
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
