.class public Lcom/android/launcher3/M5$e;
.super Lcom/android/launcher3/M5;
.source "TransitionEffect.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/M5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# direct methods
.method public constructor <init>(Lcom/android/launcher3/V4;)V
    .locals 1

    .line 1
    const-string v0, "wave"

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
    .locals 6

    .line 1
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/high16 v0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    sub-float p2, v0, p2

    .line 8
    .line 9
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    sub-float v1, v0, v1

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    cmpg-float v3, p2, v2

    .line 17
    .line 18
    const-string v4, "TransitionEffect"

    .line 19
    .line 20
    if-gez v3, :cond_0

    .line 21
    .line 22
    new-instance v3, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v5, "Wave--onScreenScrolled--scale error--scale:"

    .line 28
    .line 29
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-static {v4, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move p2, v0

    .line 43
    :cond_0
    cmpg-float v3, v1, v2

    .line 44
    .line 45
    if-gez v3, :cond_1

    .line 46
    .line 47
    new-instance v3, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    const-string v5, "Wave--onScreenScrolled--alpha error--alpha:"

    .line 53
    .line 54
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-static {v4, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    move v0, v1

    .line 69
    :goto_0
    const v1, 0x3f333333    # 0.7f

    .line 70
    .line 71
    .line 72
    cmpg-float v3, p2, v1

    .line 73
    .line 74
    if-gtz v3, :cond_2

    .line 75
    .line 76
    move p2, v1

    .line 77
    :cond_2
    cmpg-float p3, p3, v2

    .line 78
    .line 79
    if-gez p3, :cond_3

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 83
    .line 84
    .line 85
    move-result p3

    .line 86
    int-to-float v2, p3

    .line 87
    :goto_1
    invoke-virtual {p1, v2}, Landroid/view/View;->setPivotX(F)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 91
    .line 92
    .line 93
    move-result p3

    .line 94
    int-to-float p3, p3

    .line 95
    const/high16 v1, 0x3f000000    # 0.5f

    .line 96
    .line 97
    mul-float/2addr p3, v1

    .line 98
    invoke-virtual {p1, p3}, Landroid/view/View;->setPivotY(F)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleX(F)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleY(F)V

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Lcom/android/launcher3/M5;->a:Lcom/android/launcher3/V4;

    .line 108
    .line 109
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/V4;->setChildAlpha(Landroid/view/View;F)V

    .line 110
    .line 111
    .line 112
    return-void
.end method
