.class public final Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;
.super Landroid/widget/TextClock;
.source "DoubleShadowTextClock.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/shared/shadow/DoubleShadowTextClock$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/systemui/shared/shadow/DoubleShadowTextClock$Companion;

.field private static final paddingDividedOffset:I


# instance fields
.field private attributesInput:Landroid/content/res/TypedArray;

.field private mAmbientShadowInfo:Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;

.field private mKeyShadowInfo:Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;

.field private resources:Landroid/content/res/Resources;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;->Companion:Lcom/android/systemui/shared/shadow/DoubleShadowTextClock$Companion;

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    sput v0, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;->paddingDividedOffset:I

    .line 11
    .line 12
    return-void
.end method

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

    invoke-direct/range {v1 .. v7}, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IIILkotlin/jvm/internal/j;)V

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

    invoke-direct/range {v1 .. v7}, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IIILkotlin/jvm/internal/j;)V

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

    invoke-direct/range {v1 .. v7}, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IIILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/TextClock;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 6
    invoke-direct {p0, p2, p3, p4}, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;->initializeAttributes(Landroid/util/AttributeSet;II)V

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
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;Landroid/content/Context;Landroid/util/AttributeSet;IILandroid/content/res/TypedArray;)V
    .locals 1

    const-string v0, "resources"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "context"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 9
    iput-object p6, p0, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;->attributesInput:Landroid/content/res/TypedArray;

    .line 10
    iput-object p1, p0, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;->resources:Landroid/content/res/Resources;

    .line 11
    invoke-direct {p0, p3, p4, p5}, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;->initializeAttributes(Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/res/Resources;Landroid/content/Context;Landroid/util/AttributeSet;IILandroid/content/res/TypedArray;ILkotlin/jvm/internal/j;)V
    .locals 2

    and-int/lit8 p8, p7, 0x4

    const/4 v0, 0x0

    if-eqz p8, :cond_0

    move-object p3, v0

    :cond_0
    and-int/lit8 p8, p7, 0x8

    const/4 v1, 0x0

    if-eqz p8, :cond_1

    move p4, v1

    :cond_1
    and-int/lit8 p8, p7, 0x10

    if-eqz p8, :cond_2

    move p5, v1

    :cond_2
    and-int/lit8 p7, p7, 0x20

    if-eqz p7, :cond_3

    move-object p6, v0

    .line 7
    :cond_3
    invoke-direct/range {p0 .. p6}, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;-><init>(Landroid/content/res/Resources;Landroid/content/Context;Landroid/util/AttributeSet;IILandroid/content/res/TypedArray;)V

    return-void
.end method

.method public static synthetic a(Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;Landroid/graphics/Canvas;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;->onDraw$lambda$0(Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;Landroid/graphics/Canvas;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final initializeAttributes(Landroid/util/AttributeSet;II)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;->attributesInput:Landroid/content/res/TypedArray;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/TextClock;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextClock:[I

    .line 10
    .line 11
    invoke-virtual {v0, p1, v1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string p1, "obtainStyledAttributes(...)"

    .line 16
    .line 17
    invoke-static {v0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p1, p0, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;->resources:Landroid/content/res/Resources;

    .line 21
    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/widget/TextClock;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string p2, "getResources(...)"

    .line 33
    .line 34
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    :try_start_0
    sget p2, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextClock_keyShadowBlur:I

    .line 38
    .line 39
    const/4 p3, 0x0

    .line 40
    invoke-virtual {v0, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    sget v1, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextClock_keyShadowOffsetX:I

    .line 45
    .line 46
    invoke-virtual {v0, v1, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    sget v2, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextClock_keyShadowOffsetY:I

    .line 51
    .line 52
    invoke-virtual {v0, v2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    sget v3, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextClock_keyShadowAlpha:I

    .line 57
    .line 58
    const/4 v4, 0x0

    .line 59
    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    new-instance v5, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;

    .line 64
    .line 65
    int-to-float p2, p2

    .line 66
    int-to-float v1, v1

    .line 67
    int-to-float v2, v2

    .line 68
    invoke-direct {v5, p2, v1, v2, v3}, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;-><init>(FFFF)V

    .line 69
    .line 70
    .line 71
    iput-object v5, p0, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;->mKeyShadowInfo:Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;

    .line 72
    .line 73
    sget p2, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextClock_ambientShadowBlur:I

    .line 74
    .line 75
    invoke-virtual {v0, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    sget v1, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextClock_ambientShadowOffsetX:I

    .line 80
    .line 81
    invoke-virtual {v0, v1, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    sget v2, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextClock_ambientShadowOffsetY:I

    .line 86
    .line 87
    invoke-virtual {v0, v2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    sget v3, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextClock_ambientShadowAlpha:I

    .line 92
    .line 93
    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    new-instance v4, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;

    .line 98
    .line 99
    int-to-float p2, p2

    .line 100
    int-to-float v1, v1

    .line 101
    int-to-float v2, v2

    .line 102
    invoke-direct {v4, p2, v1, v2, v3}, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;-><init>(FFFF)V

    .line 103
    .line 104
    .line 105
    iput-object v4, p0, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;->mAmbientShadowInfo:Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;

    .line 106
    .line 107
    sget p2, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextClock_removeTextDescent:I

    .line 108
    .line 109
    invoke-virtual {v0, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    sget v1, Lcom/android/systemui/shared/R$styleable;->DoubleShadowTextClock_textDescentExtraPadding:I

    .line 114
    .line 115
    invoke-virtual {v0, v1, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-eqz p2, :cond_3

    .line 120
    .line 121
    sget p2, Lcom/android/systemui/shared/R$bool;->dream_overlay_complication_clock_bottom_padding:I

    .line 122
    .line 123
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getBoolean(I)Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    invoke-virtual {p0}, Landroid/widget/TextClock;->getPaint()Landroid/text/TextPaint;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    invoke-virtual {p2}, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    if-eqz p1, :cond_2

    .line 136
    .line 137
    iget p1, p2, Landroid/graphics/Paint$FontMetrics;->descent:F

    .line 138
    .line 139
    float-to-double p1, p1

    .line 140
    invoke-static {p1, p2}, Ljava/lang/Math;->floor(D)D

    .line 141
    .line 142
    .line 143
    move-result-wide p1

    .line 144
    double-to-int p1, p1

    .line 145
    sget p2, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;->paddingDividedOffset:I

    .line 146
    .line 147
    div-int/2addr p1, p2

    .line 148
    add-int/2addr v1, p1

    .line 149
    goto :goto_0

    .line 150
    :catchall_0
    move-exception p0

    .line 151
    goto :goto_1

    .line 152
    :cond_2
    iget p1, p2, Landroid/graphics/Paint$FontMetrics;->descent:F

    .line 153
    .line 154
    float-to-double p1, p1

    .line 155
    invoke-static {p1, p2}, Ljava/lang/Math;->floor(D)D

    .line 156
    .line 157
    .line 158
    move-result-wide p1

    .line 159
    double-to-int p1, p1

    .line 160
    sub-int/2addr v1, p1

    .line 161
    :goto_0
    invoke-virtual {p0, p3, p3, p3, v1}, Landroid/widget/TextClock;->setPaddingRelative(IIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 162
    .line 163
    .line 164
    :cond_3
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :goto_1
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 169
    .line 170
    .line 171
    throw p0
.end method

.method private static final onDraw$lambda$0(Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;Landroid/graphics/Canvas;)Lh4/t;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/TextClock;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 5
    .line 6
    return-object p0
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
    iget-object v0, p0, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;->mKeyShadowInfo:Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;

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
    iget-object v3, p0, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;->mAmbientShadowInfo:Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;

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
    new-instance v6, LB2/a;

    .line 30
    .line 31
    invoke-direct {v6, p0, p1}, LB2/a;-><init>(Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;Landroid/graphics/Canvas;)V

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
