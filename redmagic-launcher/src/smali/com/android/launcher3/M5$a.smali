.class public Lcom/android/launcher3/M5$a;
.super Lcom/android/launcher3/M5;
.source "TransitionEffect.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/M5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private d:Z


# direct methods
.method public constructor <init>(Lcom/android/launcher3/V4;Z)V
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const-string v0, "cube-in"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string v0, "cube-out"

    .line 7
    .line 8
    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/M5;-><init>(Lcom/android/launcher3/V4;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-boolean p2, p0, Lcom/android/launcher3/M5$a;->d:Z

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public d(Landroid/view/View;IF)V
    .locals 3

    .line 1
    const/4 p2, 0x0

    .line 2
    cmpl-float v0, p3, p2

    .line 3
    .line 4
    const/high16 v1, 0x3f800000    # 1.0f

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-boolean p0, p0, Lcom/android/launcher3/M5$a;->d:Z

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    const v0, 0x465ac000    # 14000.0f

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const v0, 0x455ac000    # 3500.0f

    .line 21
    .line 22
    .line 23
    :goto_0
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/high16 p0, 0x42b40000    # 90.0f

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_2
    const/high16 p0, -0x3d4c0000    # -90.0f

    .line 29
    .line 30
    :goto_1
    mul-float/2addr p0, p3

    .line 31
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    .line 40
    .line 41
    mul-float/2addr v2, v0

    .line 42
    invoke-virtual {p1, v2}, Landroid/view/View;->setCameraDistance(F)V

    .line 43
    .line 44
    .line 45
    cmpg-float v0, p3, p2

    .line 46
    .line 47
    if-gez v0, :cond_3

    .line 48
    .line 49
    goto :goto_2

    .line 50
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    int-to-float p2, p2

    .line 55
    :goto_2
    invoke-virtual {p1, p2}, Landroid/view/View;->setPivotX(F)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, p0}, Landroid/view/View;->setRotationY(F)V

    .line 59
    .line 60
    .line 61
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    sub-float/2addr v1, p0

    .line 66
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 67
    .line 68
    .line 69
    return-void
.end method
