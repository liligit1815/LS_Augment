.class public Lcom/android/launcher3/M5$d;
.super Lcom/android/launcher3/M5;
.source "TransitionEffect.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/M5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# direct methods
.method public constructor <init>(Lcom/android/launcher3/V4;)V
    .locals 1

    .line 1
    const-string v0, "glass"

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/M5;-><init>(Lcom/android/launcher3/V4;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public d(Landroid/view/View;IF)V
    .locals 7

    .line 1
    const/high16 p0, 0x42700000    # 60.0f

    .line 2
    .line 3
    mul-float/2addr p0, p3

    .line 4
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    const/high16 v0, 0x3f800000    # 1.0f

    .line 9
    .line 10
    sub-float p2, v0, p2

    .line 11
    .line 12
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/high16 v2, 0x40000000    # 2.0f

    .line 17
    .line 18
    div-float/2addr v1, v2

    .line 19
    sub-float v1, v0, v1

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    cmpg-float v4, v1, v3

    .line 23
    .line 24
    const-string v5, "TransitionEffect"

    .line 25
    .line 26
    if-gez v4, :cond_0

    .line 27
    .line 28
    new-instance v4, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string v6, "Glass--onScreenScrolled--scale error--scale:"

    .line 34
    .line 35
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {v5, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move v1, v0

    .line 49
    :cond_0
    cmpg-float v3, p2, v3

    .line 50
    .line 51
    if-gez v3, :cond_1

    .line 52
    .line 53
    new-instance v3, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    const-string v4, "Glass--onScreenScrolled--alpha error--alpha:"

    .line 59
    .line 60
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-static {v5, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    move p2, v0

    .line 74
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    .line 83
    .line 84
    mul-float/2addr v3, v2

    .line 85
    const v2, 0x455ac000    # 3500.0f

    .line 86
    .line 87
    .line 88
    mul-float/2addr v3, v2

    .line 89
    invoke-virtual {p1, v3}, Landroid/view/View;->setCameraDistance(F)V

    .line 90
    .line 91
    .line 92
    add-float v2, p3, v0

    .line 93
    .line 94
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    int-to-float v3, v3

    .line 99
    mul-float/2addr v2, v3

    .line 100
    const/high16 v3, 0x3f000000    # 0.5f

    .line 101
    .line 102
    mul-float/2addr v2, v3

    .line 103
    invoke-virtual {p1, v2}, Landroid/view/View;->setPivotX(F)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    int-to-float v2, v2

    .line 111
    mul-float/2addr v2, v3

    .line 112
    invoke-virtual {p1, v2}, Landroid/view/View;->setPivotY(F)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1, v1}, Landroid/view/View;->setScaleY(F)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    int-to-float v1, v1

    .line 123
    const/high16 v2, 0x41000000    # 8.0f

    .line 124
    .line 125
    div-float/2addr v1, v2

    .line 126
    mul-float/2addr v1, p3

    .line 127
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 128
    .line 129
    .line 130
    cmpl-float p3, p0, v0

    .line 131
    .line 132
    if-ltz p3, :cond_2

    .line 133
    .line 134
    invoke-virtual {p1, p0}, Landroid/view/View;->setRotationY(F)V

    .line 135
    .line 136
    .line 137
    :cond_2
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 138
    .line 139
    .line 140
    return-void
.end method
