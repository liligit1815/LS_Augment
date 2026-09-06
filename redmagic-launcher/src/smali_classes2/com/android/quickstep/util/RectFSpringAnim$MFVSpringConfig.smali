.class public Lcom/android/quickstep/util/RectFSpringAnim$MFVSpringConfig;
.super Lcom/android/quickstep/util/RectFSpringAnim$DefaultSpringConfig;
.source "RectFSpringAnim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/RectFSpringAnim;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MFVSpringConfig"
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/RectF;Landroid/graphics/RectF;ZFI)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/util/RectFSpringAnim$DefaultSpringConfig;-><init>(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/RectF;Landroid/graphics/RectF;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/android/launcher3/util/g0;->i(Landroid/content/Context;)Lx2/h;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {}, Lx1/O;->Y2()Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    const/4 p3, 0x1

    .line 13
    xor-int/2addr p2, p3

    .line 14
    iput p2, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->tracking:I

    .line 15
    .line 16
    iget p2, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->homeAnimTargetType:I

    .line 17
    .line 18
    if-ne p2, p3, :cond_0

    .line 19
    .line 20
    const p2, 0x7f070add

    .line 21
    .line 22
    .line 23
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    iput p2, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->stiffnessX:F

    .line 28
    .line 29
    const p2, 0x7f070adc

    .line 30
    .line 31
    .line 32
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    iput p2, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->dampingX:F

    .line 37
    .line 38
    const p2, 0x7f070adf

    .line 39
    .line 40
    .line 41
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    iput p2, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->stiffnessY:F

    .line 46
    .line 47
    const p2, 0x7f070ade

    .line 48
    .line 49
    .line 50
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    iput p2, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->dampingY:F

    .line 55
    .line 56
    const p2, 0x7f070adb

    .line 57
    .line 58
    .line 59
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    iput p2, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->rectStiffness:F

    .line 64
    .line 65
    const p2, 0x7f070ada

    .line 66
    .line 67
    .line 68
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    iput p1, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->rectDamping:F

    .line 73
    .line 74
    goto :goto_3

    .line 75
    :cond_0
    const p2, 0x7f070ad0

    .line 76
    .line 77
    .line 78
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    iput p2, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->stiffnessX:F

    .line 83
    .line 84
    invoke-static {p7}, Lcom/android/launcher3/anim/C;->i0(I)Z

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    const/high16 p3, 0x3f800000    # 1.0f

    .line 89
    .line 90
    if-eqz p2, :cond_1

    .line 91
    .line 92
    move p2, p3

    .line 93
    goto :goto_0

    .line 94
    :cond_1
    const p2, 0x7f070ace

    .line 95
    .line 96
    .line 97
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    :goto_0
    iput p2, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->dampingX:F

    .line 102
    .line 103
    const p2, 0x7f070ad8

    .line 104
    .line 105
    .line 106
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 107
    .line 108
    .line 109
    move-result p2

    .line 110
    iput p2, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->stiffnessY:F

    .line 111
    .line 112
    invoke-static {p7}, Lcom/android/launcher3/anim/C;->i0(I)Z

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    if-eqz p2, :cond_2

    .line 117
    .line 118
    move p2, p3

    .line 119
    goto :goto_1

    .line 120
    :cond_2
    const p2, 0x7f070ad6

    .line 121
    .line 122
    .line 123
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 124
    .line 125
    .line 126
    move-result p2

    .line 127
    :goto_1
    iput p2, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->dampingY:F

    .line 128
    .line 129
    const p2, 0x7f070acb

    .line 130
    .line 131
    .line 132
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 133
    .line 134
    .line 135
    move-result p2

    .line 136
    iput p2, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->rectStiffness:F

    .line 137
    .line 138
    invoke-static {p7}, Lcom/android/launcher3/anim/C;->i0(I)Z

    .line 139
    .line 140
    .line 141
    move-result p2

    .line 142
    if-eqz p2, :cond_3

    .line 143
    .line 144
    goto :goto_2

    .line 145
    :cond_3
    const p2, 0x7f070ac7

    .line 146
    .line 147
    .line 148
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 149
    .line 150
    .line 151
    move-result p3

    .line 152
    :goto_2
    iput p3, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->rectDamping:F

    .line 153
    .line 154
    :goto_3
    iput p7, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->homeAnimTargetType:I

    .line 155
    .line 156
    return-void
.end method
