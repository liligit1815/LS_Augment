.class public final Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper;
.super Ljava/lang/Object;
.source "DoubleShadowTextHelper.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper;->INSTANCE:Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final applyShadows(Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;Landroid/widget/TextView;Landroid/graphics/Canvas;Lu4/a;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;",
            "Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;",
            "Landroid/widget/TextView;",
            "Landroid/graphics/Canvas;",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string p0, "keyShadowInfo"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "ambientShadowInfo"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "view"

    .line 12
    .line 13
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "canvas"

    .line 17
    .line 18
    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "onDrawCallback"

    .line 22
    .line 23
    invoke-static {p5, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p2}, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;->getBlur()F

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-virtual {p2}, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;->getOffsetX()F

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {p2}, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;->getOffsetY()F

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {p2}, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;->getAlpha()F

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    const/4 v3, 0x0

    .line 47
    invoke-static {p2, v3, v3, v3}, Landroid/graphics/Color;->argb(FFFF)I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    invoke-virtual {p0, v0, v1, v2, p2}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 52
    .line 53
    .line 54
    invoke-interface {p5}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p4}, Landroid/graphics/Canvas;->save()I

    .line 58
    .line 59
    .line 60
    invoke-virtual {p3}, Landroid/widget/TextView;->getScrollX()I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    invoke-virtual {p3}, Landroid/widget/TextView;->getScrollY()I

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    invoke-virtual {p3}, Landroid/widget/TextView;->getExtendedPaddingTop()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    add-int/2addr p2, v0

    .line 73
    invoke-virtual {p3}, Landroid/widget/TextView;->getScrollX()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    invoke-virtual {p3}, Landroid/widget/TextView;->getWidth()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    add-int/2addr v0, v1

    .line 82
    invoke-virtual {p3}, Landroid/widget/TextView;->getScrollY()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    invoke-virtual {p3}, Landroid/widget/TextView;->getHeight()I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    add-int/2addr v1, v2

    .line 91
    invoke-virtual {p4, p0, p2, v0, v1}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 92
    .line 93
    .line 94
    invoke-virtual {p3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p1}, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;->getBlur()F

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    invoke-virtual {p1}, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;->getOffsetX()F

    .line 103
    .line 104
    .line 105
    move-result p3

    .line 106
    invoke-virtual {p1}, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;->getOffsetY()F

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    invoke-virtual {p1}, Lcom/android/systemui/shared/shadow/DoubleShadowTextHelper$ShadowInfo;->getAlpha()F

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    invoke-static {p1, v3, v3, v3}, Landroid/graphics/Color;->argb(FFFF)I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    invoke-virtual {p0, p2, p3, v0, p1}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 119
    .line 120
    .line 121
    invoke-interface {p5}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    invoke-virtual {p4}, Landroid/graphics/Canvas;->restore()V

    .line 125
    .line 126
    .line 127
    return-void
.end method
