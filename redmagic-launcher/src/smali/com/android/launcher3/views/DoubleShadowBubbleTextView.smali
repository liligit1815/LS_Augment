.class public Lcom/android/launcher3/views/DoubleShadowBubbleTextView;
.super Lcom/android/launcher3/BubbleTextView;
.source "DoubleShadowBubbleTextView.java"


# static fields
.field private static G0:I = 0x0

.field private static H0:I = 0x3


# instance fields
.field private A0:Landroid/graphics/Paint;

.field private B0:Landroid/graphics/RectF;

.field private C0:Z

.field private D0:I

.field private E0:I

.field private F0:I

.field private final z0:Lcom/android/launcher3/views/Q;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/BubbleTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->B0:Landroid/graphics/RectF;

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->C0:Z

    .line 5
    sget-object v1, Lcom/android/launcher3/views/Q;->g:Lcom/android/launcher3/views/Q$a;

    invoke-virtual {v1, p1, p2, p3}, Lcom/android/launcher3/views/Q$a;->a(Landroid/content/Context;Landroid/util/AttributeSet;I)Lcom/android/launcher3/views/Q;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->z0:Lcom/android/launcher3/views/Q;

    .line 6
    invoke-virtual {p2}, Lcom/android/launcher3/views/Q;->a()F

    move-result p3

    sget v1, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->G0:I

    int-to-float v1, v1

    sget v2, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->H0:I

    int-to-float v2, v2

    .line 7
    invoke-virtual {p2}, Lcom/android/launcher3/views/Q;->b()I

    move-result p2

    .line 8
    invoke-virtual {p0, p3, v1, v2, p2}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    .line 9
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    move-result-object p2

    iget-boolean p2, p2, Lcom/android/launcher3/r4;->Y:Z

    if-nez p2, :cond_0

    invoke-static {}, Lm1/a;->a()Z

    move-result p2

    if-eqz p2, :cond_1

    :cond_0
    const/4 v0, 0x1

    :cond_1
    iput-boolean v0, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->C0:Z

    if-eqz v0, :cond_2

    .line 10
    invoke-direct {p0, p1}, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->Z0(Landroid/content/Context;)V

    :cond_2
    return-void
.end method

.method private X0(Landroid/graphics/drawable/Drawable;I)Lcom/android/launcher3/views/v;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const v1, 0x7f070119

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    new-instance v1, Lcom/android/launcher3/views/v;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->z0:Lcom/android/launcher3/views/Q;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1, p2, v0}, Lcom/android/launcher3/views/v;-><init>(Lcom/android/launcher3/views/Q;Landroid/graphics/drawable/Drawable;II)V

    .line 21
    .line 22
    .line 23
    return-object v1
.end method

.method private static Y0(II)I
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    mul-int/2addr v0, p1

    .line 6
    int-to-float p1, v0

    .line 7
    const/high16 v0, 0x437f0000    # 255.0f

    .line 8
    .line 9
    div-float/2addr p1, v0

    .line 10
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-static {p0, p1}, Ls1/q;->h(II)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method private Z0(Landroid/content/Context;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->A0:Landroid/graphics/Paint;

    .line 7
    .line 8
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->A0:Landroid/graphics/Paint;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->A0:Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-static {}, Lm1/a;->a()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    const v1, 0x7f0600ac

    .line 28
    .line 29
    .line 30
    :goto_0
    invoke-virtual {p1, v1}, Landroid/content/Context;->getColor(I)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    const v1, 0x7f0600ab

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :goto_1
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 40
    .line 41
    .line 42
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget v0, p1, Lcom/android/launcher3/X3;->Y:I

    .line 51
    .line 52
    iput v0, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->D0:I

    .line 53
    .line 54
    iget v0, p1, Lcom/android/launcher3/X3;->Z:I

    .line 55
    .line 56
    iput v0, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->E0:I

    .line 57
    .line 58
    iget p1, p1, Lcom/android/launcher3/X3;->a0:I

    .line 59
    .line 60
    iput p1, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->F0:I

    .line 61
    .line 62
    return-void
.end method

.method private a1()Z
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v1}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const v2, 0x7f040781

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v2, v1}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iget-object v2, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->z0:Lcom/android/launcher3/views/Q;

    .line 32
    .line 33
    invoke-virtual {v2}, Lcom/android/launcher3/views/Q;->d()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-static {v2}, Landroid/graphics/Color;->alpha(I)I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    iget-object v3, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->z0:Lcom/android/launcher3/views/Q;

    .line 42
    .line 43
    invoke-virtual {v3}, Lcom/android/launcher3/views/Q;->b()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    invoke-static {v3}, Landroid/graphics/Color;->alpha(I)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    invoke-virtual {p0}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    invoke-static {v4}, Landroid/graphics/Color;->alpha(I)I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    invoke-virtual {p0}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 60
    .line 61
    .line 62
    move-result v5

    .line 63
    const/high16 v6, -0x5a000000

    .line 64
    .line 65
    const/4 v7, 0x1

    .line 66
    if-eq v5, v6, :cond_4

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    const/high16 v6, -0x1000000

    .line 73
    .line 74
    if-eq v5, v6, :cond_4

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 77
    .line 78
    .line 79
    move-result-object v5

    .line 80
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    const v6, 0x7f060868

    .line 85
    .line 86
    .line 87
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    if-eq v0, v5, :cond_4

    .line 92
    .line 93
    if-eqz v4, :cond_4

    .line 94
    .line 95
    if-eqz v1, :cond_4

    .line 96
    .line 97
    if-nez v2, :cond_0

    .line 98
    .line 99
    if-nez v3, :cond_0

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_0
    if-lez v3, :cond_2

    .line 103
    .line 104
    const/4 v2, -0x1

    .line 105
    if-ne v2, v0, :cond_1

    .line 106
    .line 107
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iget-object p0, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->z0:Lcom/android/launcher3/views/Q;

    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/android/launcher3/views/Q;->a()F

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    sget v1, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->G0:I

    .line 118
    .line 119
    int-to-float v1, v1

    .line 120
    sget v2, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->H0:I

    .line 121
    .line 122
    int-to-float v2, v2

    .line 123
    const/high16 v3, 0x45000000    # 2048.0f

    .line 124
    .line 125
    invoke-virtual {v0, p0, v1, v2, v3}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 126
    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_1
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iget-object v2, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->z0:Lcom/android/launcher3/views/Q;

    .line 134
    .line 135
    invoke-virtual {v2}, Lcom/android/launcher3/views/Q;->a()F

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    sget v3, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->G0:I

    .line 140
    .line 141
    int-to-float v3, v3

    .line 142
    sget v4, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->H0:I

    .line 143
    .line 144
    int-to-float v4, v4

    .line 145
    iget-object p0, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->z0:Lcom/android/launcher3/views/Q;

    .line 146
    .line 147
    invoke-virtual {p0}, Lcom/android/launcher3/views/Q;->b()I

    .line 148
    .line 149
    .line 150
    move-result p0

    .line 151
    invoke-static {p0, v1}, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->Y0(II)I

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    invoke-virtual {v0, v2, v3, v4, p0}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 156
    .line 157
    .line 158
    :goto_0
    return v7

    .line 159
    :cond_2
    if-lez v2, :cond_3

    .line 160
    .line 161
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    iget-object v2, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->z0:Lcom/android/launcher3/views/Q;

    .line 166
    .line 167
    invoke-virtual {v2}, Lcom/android/launcher3/views/Q;->c()F

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    iget-object v3, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->z0:Lcom/android/launcher3/views/Q;

    .line 172
    .line 173
    invoke-virtual {v3}, Lcom/android/launcher3/views/Q;->e()F

    .line 174
    .line 175
    .line 176
    move-result v3

    .line 177
    iget-object v4, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->z0:Lcom/android/launcher3/views/Q;

    .line 178
    .line 179
    invoke-virtual {v4}, Lcom/android/launcher3/views/Q;->f()F

    .line 180
    .line 181
    .line 182
    move-result v4

    .line 183
    iget-object p0, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->z0:Lcom/android/launcher3/views/Q;

    .line 184
    .line 185
    invoke-virtual {p0}, Lcom/android/launcher3/views/Q;->d()I

    .line 186
    .line 187
    .line 188
    move-result p0

    .line 189
    invoke-static {p0, v1}, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->Y0(II)I

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    invoke-virtual {v0, v2, v3, v4, p0}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 194
    .line 195
    .line 196
    return v7

    .line 197
    :cond_3
    const/4 p0, 0x0

    .line 198
    return p0

    .line 199
    :cond_4
    :goto_1
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    invoke-virtual {p0}, Landroid/text/TextPaint;->clearShadowLayer()V

    .line 204
    .line 205
    .line 206
    return v7
.end method


# virtual methods
.method public L0(Ljava/lang/CharSequence;I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    const-string p0, "DoubleShadowBubbleTextView"

    .line 15
    .line 16
    const-string p1, "setTextWithStartIcon: start icon Drawable not found from resources, will just set text instead."

    .line 17
    .line 18
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-virtual {p2, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/TextView;->getTextSize()F

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-direct {p0}, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->a1()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_1

    .line 42
    .line 43
    invoke-direct {p0, p2, v0}, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->X0(Landroid/graphics/drawable/Drawable;I)Lcom/android/launcher3/views/v;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    :cond_1
    const/4 v1, 0x0

    .line 48
    invoke-virtual {p2, v1, v1, v0, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Landroid/text/style/ImageSpan;

    .line 52
    .line 53
    const/4 v2, 0x2

    .line 54
    invoke-direct {v0, p2, v2}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 55
    .line 56
    .line 57
    new-instance p2, Landroid/text/SpannableString;

    .line 58
    .line 59
    new-instance v2, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    const-string v3, "  "

    .line 65
    .line 66
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-direct {p2, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    const/4 p1, 0x1

    .line 80
    const/16 v2, 0x11

    .line 81
    .line 82
    invoke-virtual {p2, v0, v1, p1, v2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/view/ViewGroup;

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->C0:Z

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    instance-of v0, v0, Lcom/android/launcher3/folder/FolderIcon;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->O2()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->B0:Landroid/graphics/RectF;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/widget/TextView;->getScrollX()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    iget v2, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->E0:I

    .line 46
    .line 47
    add-int/2addr v1, v2

    .line 48
    int-to-float v1, v1

    .line 49
    invoke-virtual {p0}, Landroid/widget/TextView;->getScrollY()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    iget v3, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->D0:I

    .line 54
    .line 55
    add-int/2addr v2, v3

    .line 56
    int-to-float v2, v2

    .line 57
    invoke-virtual {p0}, Landroid/widget/TextView;->getScrollX()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    invoke-virtual {p0}, Landroid/widget/TextView;->getWidth()I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    add-int/2addr v3, v4

    .line 66
    iget v4, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->E0:I

    .line 67
    .line 68
    sub-int/2addr v3, v4

    .line 69
    int-to-float v3, v3

    .line 70
    invoke-virtual {p0}, Landroid/widget/TextView;->getScrollY()I

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    invoke-virtual {p0}, Landroid/widget/TextView;->getHeight()I

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    add-int/2addr v4, v5

    .line 79
    iget v5, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->D0:I

    .line 80
    .line 81
    sub-int/2addr v4, v5

    .line 82
    int-to-float v4, v4

    .line 83
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->B0:Landroid/graphics/RectF;

    .line 87
    .line 88
    iget v1, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->F0:I

    .line 89
    .line 90
    int-to-float v2, v1

    .line 91
    int-to-float v1, v1

    .line 92
    iget-object v3, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->A0:Landroid/graphics/Paint;

    .line 93
    .line 94
    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 95
    .line 96
    .line 97
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->N0()Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_1

    .line 102
    .line 103
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_1

    .line 112
    .line 113
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->Q(Landroid/graphics/Canvas;)V

    .line 114
    .line 115
    .line 116
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->a1()Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_2

    .line 121
    .line 122
    invoke-super {p0, p1}, Lcom/android/launcher3/BubbleTextView;->onDraw(Landroid/graphics/Canvas;)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_2
    invoke-virtual {p0}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    iget-object v2, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->z0:Lcom/android/launcher3/views/Q;

    .line 139
    .line 140
    invoke-virtual {v2}, Lcom/android/launcher3/views/Q;->a()F

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    sget v3, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->G0:I

    .line 145
    .line 146
    int-to-float v3, v3

    .line 147
    sget v4, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->H0:I

    .line 148
    .line 149
    int-to-float v4, v4

    .line 150
    iget-object v5, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->z0:Lcom/android/launcher3/views/Q;

    .line 151
    .line 152
    invoke-virtual {v5}, Lcom/android/launcher3/views/Q;->b()I

    .line 153
    .line 154
    .line 155
    move-result v5

    .line 156
    invoke-static {v5, v0}, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->Y0(II)I

    .line 157
    .line 158
    .line 159
    move-result v5

    .line 160
    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->a0(Landroid/graphics/Canvas;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0}, Landroid/widget/TextView;->getScrollX()I

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    invoke-virtual {p0}, Landroid/widget/TextView;->getScrollY()I

    .line 174
    .line 175
    .line 176
    move-result v2

    .line 177
    invoke-virtual {p0}, Landroid/widget/TextView;->getExtendedPaddingTop()I

    .line 178
    .line 179
    .line 180
    move-result v3

    .line 181
    add-int/2addr v2, v3

    .line 182
    invoke-virtual {p0}, Landroid/widget/TextView;->getScrollX()I

    .line 183
    .line 184
    .line 185
    move-result v3

    .line 186
    invoke-virtual {p0}, Landroid/widget/TextView;->getWidth()I

    .line 187
    .line 188
    .line 189
    move-result v4

    .line 190
    add-int/2addr v3, v4

    .line 191
    invoke-virtual {p0}, Landroid/widget/TextView;->getScrollY()I

    .line 192
    .line 193
    .line 194
    move-result v4

    .line 195
    invoke-virtual {p0}, Landroid/widget/TextView;->getHeight()I

    .line 196
    .line 197
    .line 198
    move-result v5

    .line 199
    add-int/2addr v4, v5

    .line 200
    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 201
    .line 202
    .line 203
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    iget-object v2, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->z0:Lcom/android/launcher3/views/Q;

    .line 208
    .line 209
    invoke-virtual {v2}, Lcom/android/launcher3/views/Q;->c()F

    .line 210
    .line 211
    .line 212
    move-result v2

    .line 213
    iget-object v3, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->z0:Lcom/android/launcher3/views/Q;

    .line 214
    .line 215
    invoke-virtual {v3}, Lcom/android/launcher3/views/Q;->e()F

    .line 216
    .line 217
    .line 218
    move-result v3

    .line 219
    iget-object v4, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->z0:Lcom/android/launcher3/views/Q;

    .line 220
    .line 221
    invoke-virtual {v4}, Lcom/android/launcher3/views/Q;->f()F

    .line 222
    .line 223
    .line 224
    move-result v4

    .line 225
    iget-object v5, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->z0:Lcom/android/launcher3/views/Q;

    .line 226
    .line 227
    invoke-virtual {v5}, Lcom/android/launcher3/views/Q;->d()I

    .line 228
    .line 229
    .line 230
    move-result v5

    .line 231
    invoke-static {v5, v0}, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->Y0(II)I

    .line 232
    .line 233
    .line 234
    move-result v0

    .line 235
    invoke-virtual {v1, v2, v3, v4, v0}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->a0(Landroid/graphics/Canvas;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 242
    .line 243
    .line 244
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->U(Landroid/graphics/Canvas;)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->Y(Landroid/graphics/Canvas;)V

    .line 248
    .line 249
    .line 250
    return-void
.end method

.method protected onFocusChanged(ZILandroid/graphics/Rect;)V
    .locals 3

    .line 1
    invoke-static {}, Lx1/O;->k1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const v0, 0x3f83d70a    # 1.03f

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 14
    .line 15
    :goto_0
    invoke-virtual {p0}, Landroid/widget/TextView;->animate()Landroid/view/ViewPropertyAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-wide/16 v1, 0x64

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 34
    .line 35
    .line 36
    :cond_1
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/BubbleTextView;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->Y:Z

    .line 10
    .line 11
    if-nez v0, :cond_3

    .line 12
    .line 13
    invoke-static {}, Lm1/a;->a()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/BubbleTextView;->p0(FF)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-super {p0, p1}, Lcom/android/launcher3/BubbleTextView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_1
    const-string v0, "DoubleShadowBubbleTextView"

    .line 40
    .line 41
    const-string v1, "onTouchEvent is not touch icon area"

    .line 42
    .line 43
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    const/4 v0, 0x1

    .line 51
    const/4 v1, 0x0

    .line 52
    if-eq p1, v0, :cond_2

    .line 53
    .line 54
    const/4 v0, 0x2

    .line 55
    if-eq p1, v0, :cond_2

    .line 56
    .line 57
    const/4 v0, 0x3

    .line 58
    if-eq p1, v0, :cond_2

    .line 59
    .line 60
    return v1

    .line 61
    :cond_2
    invoke-super {p0}, Lcom/android/launcher3/BubbleTextView;->cancelLongPress()V

    .line 62
    .line 63
    .line 64
    return v1

    .line 65
    :cond_3
    :goto_0
    invoke-super {p0, p1}, Lcom/android/launcher3/BubbleTextView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    return p0
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
