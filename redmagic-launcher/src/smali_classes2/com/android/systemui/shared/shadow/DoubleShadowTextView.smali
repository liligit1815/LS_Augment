.class public Lcom/android/systemui/shared/shadow/DoubleShadowTextView;
.super Landroid/widget/TextView;
.source "DoubleShadowTextView.kt"


# instance fields
.field private mAmbientShadowInfo:Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;

.field private mKeyShadowInfo:Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 8

    .line 1
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v6, 0xe

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v1 .. v7}, Lcom/android/systemui/shared/shadow/DoubleShadowTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IIILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 8

    .line 2
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v6, 0xc

    const/4 v7, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v7}, Lcom/android/systemui/shared/shadow/DoubleShadowTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IIILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 8

    .line 3
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v6, 0x8

    const/4 v7, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    invoke-direct/range {v1 .. v7}, Lcom/android/systemui/shared/shadow/DoubleShadowTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IIILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 6
    sget-object v0, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextView:[I

    .line 7
    invoke-virtual {p1, p2, v0, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    const-string p2, "obtainStyledAttributes(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    invoke-direct {p0, p1}, Lcom/android/systemui/shared/shadow/DoubleShadowTextView;->updateShadowDrawables(Landroid/content/res/TypedArray;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IIILkotlin/jvm/internal/j;)V
    .locals 1

    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p6, p5, 0x4

    const/4 v0, 0x0

    if-eqz p6, :cond_1

    move p3, v0

    :cond_1
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_2

    move p4, v0

    .line 4
    :cond_2
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/systemui/shared/shadow/DoubleShadowTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public static synthetic a(Lcom/android/systemui/shared/shadow/DoubleShadowTextView;Landroid/graphics/Canvas;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/systemui/shared/shadow/DoubleShadowTextView;->onDraw$lambda$0(Lcom/android/systemui/shared/shadow/DoubleShadowTextView;Landroid/graphics/Canvas;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final onDraw$lambda$0(Lcom/android/systemui/shared/shadow/DoubleShadowTextView;Landroid/graphics/Canvas;)Lh4/t;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 5
    .line 6
    return-object p0
.end method

.method private final updateShadowDrawables(Landroid/content/res/TypedArray;)V
    .locals 14

    .line 1
    :try_start_0
    sget v0, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextView_keyShadowBlur:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    sget v2, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextView_keyShadowOffsetX:I

    .line 9
    .line 10
    invoke-virtual {p1, v2, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    sget v3, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextView_keyShadowOffsetY:I

    .line 15
    .line 16
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    sget v4, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextView_keyShadowAlpha:I

    .line 21
    .line 22
    invoke-virtual {p1, v4, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    new-instance v5, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;

    .line 27
    .line 28
    invoke-direct {v5, v0, v2, v3, v4}, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;-><init>(FFFF)V

    .line 29
    .line 30
    .line 31
    iput-object v5, p0, Lcom/android/systemui/shared/shadow/DoubleShadowTextView;->mKeyShadowInfo:Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;

    .line 32
    .line 33
    sget v0, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextView_ambientShadowBlur:I

    .line 34
    .line 35
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    sget v2, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextView_ambientShadowOffsetX:I

    .line 40
    .line 41
    invoke-virtual {p1, v2, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    sget v3, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextView_ambientShadowOffsetY:I

    .line 46
    .line 47
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    sget v4, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextView_ambientShadowAlpha:I

    .line 52
    .line 53
    invoke-virtual {p1, v4, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    new-instance v4, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;

    .line 58
    .line 59
    invoke-direct {v4, v0, v2, v3, v1}, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;-><init>(FFFF)V

    .line 60
    .line 61
    .line 62
    iput-object v4, p0, Lcom/android/systemui/shared/shadow/DoubleShadowTextView;->mAmbientShadowInfo:Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;

    .line 63
    .line 64
    sget v0, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextView_drawableIconSize:I

    .line 65
    .line 66
    const/4 v1, 0x0

    .line 67
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 68
    .line 69
    .line 70
    move-result v6

    .line 71
    sget v0, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextView_drawableIconInsetSize:I

    .line 72
    .line 73
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 74
    .line 75
    .line 76
    move-result v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 78
    .line 79
    .line 80
    const/4 p1, 0x4

    .line 81
    new-array p1, p1, [Landroid/graphics/drawable/Drawable;

    .line 82
    .line 83
    const/4 v0, 0x0

    .line 84
    aput-object v0, p1, v1

    .line 85
    .line 86
    const/4 v8, 0x1

    .line 87
    aput-object v0, p1, v8

    .line 88
    .line 89
    const/4 v9, 0x2

    .line 90
    aput-object v0, p1, v9

    .line 91
    .line 92
    const/4 v10, 0x3

    .line 93
    aput-object v0, p1, v10

    .line 94
    .line 95
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    .line 96
    .line 97
    .line 98
    move-result-object v11

    .line 99
    const-string v2, "getCompoundDrawablesRelative(...)"

    .line 100
    .line 101
    invoke-static {v11, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    array-length v12, v11

    .line 105
    move v13, v1

    .line 106
    :goto_0
    if-ge v13, v12, :cond_3

    .line 107
    .line 108
    aget-object v5, v11, v13

    .line 109
    .line 110
    if-eqz v5, :cond_2

    .line 111
    .line 112
    new-instance v2, Lcom/android/systemui/shared/shadow/DoubleShadowIconDrawable;

    .line 113
    .line 114
    iget-object v3, p0, Lcom/android/systemui/shared/shadow/DoubleShadowTextView;->mKeyShadowInfo:Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;

    .line 115
    .line 116
    if-nez v3, :cond_0

    .line 117
    .line 118
    const-string v3, "mKeyShadowInfo"

    .line 119
    .line 120
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    move-object v3, v0

    .line 124
    :cond_0
    iget-object v4, p0, Lcom/android/systemui/shared/shadow/DoubleShadowTextView;->mAmbientShadowInfo:Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;

    .line 125
    .line 126
    if-nez v4, :cond_1

    .line 127
    .line 128
    const-string v4, "mAmbientShadowInfo"

    .line 129
    .line 130
    invoke-static {v4}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    move-object v4, v0

    .line 134
    :cond_1
    invoke-direct/range {v2 .. v7}, Lcom/android/systemui/shared/shadow/DoubleShadowIconDrawable;-><init>(Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;Landroid/graphics/drawable/Drawable;II)V

    .line 135
    .line 136
    .line 137
    aput-object v2, p1, v13

    .line 138
    .line 139
    :cond_2
    add-int/lit8 v13, v13, 0x1

    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_3
    aget-object v0, p1, v1

    .line 143
    .line 144
    aget-object v1, p1, v8

    .line 145
    .line 146
    aget-object v2, p1, v9

    .line 147
    .line 148
    aget-object p1, p1, v10

    .line 149
    .line 150
    invoke-virtual {p0, v0, v1, v2, p1}, Landroid/widget/TextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :catchall_0
    move-exception v0

    .line 155
    move-object p0, v0

    .line 156
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 157
    .line 158
    .line 159
    throw p0
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    const-string v0, "canvas"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper;->INSTANCE:Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/systemui/shared/shadow/DoubleShadowTextView;->mKeyShadowInfo:Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const-string v0, "mKeyShadowInfo"

    .line 14
    .line 15
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    move-object v0, v2

    .line 19
    :cond_0
    iget-object v3, p0, Lcom/android/systemui/shared/shadow/DoubleShadowTextView;->mAmbientShadowInfo:Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;

    .line 20
    .line 21
    if-nez v3, :cond_1

    .line 22
    .line 23
    const-string v3, "mAmbientShadowInfo"

    .line 24
    .line 25
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    move-object v3, v2

    .line 29
    :cond_1
    new-instance v6, LB2/b;

    .line 30
    .line 31
    invoke-direct {v6, p0, p1}, LB2/b;-><init>(Lcom/android/systemui/shared/shadow/DoubleShadowTextView;Landroid/graphics/Canvas;)V

    .line 32
    .line 33
    .line 34
    move-object v4, p0

    .line 35
    move-object v5, p1

    .line 36
    move-object v2, v0

    .line 37
    invoke-virtual/range {v1 .. v6}, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper;->applyShadows(Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;Landroid/widget/TextView;Landroid/graphics/Canvas;Lu4/a;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public setTextAppearance(I)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextView:[I

    .line 9
    .line 10
    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string v0, "obtainStyledAttributes(...)"

    .line 15
    .line 16
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0, p1}, Lcom/android/systemui/shared/shadow/DoubleShadowTextView;->updateShadowDrawables(Landroid/content/res/TypedArray;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
