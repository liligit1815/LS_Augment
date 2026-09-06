.class public Lcom/android/launcher3/M5$c;
.super Lcom/android/launcher3/M5;
.source "TransitionEffect.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/M5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# direct methods
.method public constructor <init>(Lcom/android/launcher3/V4;)V
    .locals 1

    .line 1
    const-string v0, "flip"

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
    .locals 3

    .line 1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-static {p0, p3}, Ljava/lang/Math;->min(FF)F

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/high16 v0, -0x40800000    # -1.0f

    .line 8
    .line 9
    invoke-static {v0, p2}, Ljava/lang/Math;->max(FF)F

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    const/high16 v0, -0x3d4c0000    # -90.0f

    .line 14
    .line 15
    mul-float/2addr p2, v0

    .line 16
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/high16 v1, 0x42b40000    # 90.0f

    .line 21
    .line 22
    sub-float v0, v1, v0

    .line 23
    .line 24
    div-float/2addr v0, v1

    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 34
    .line 35
    const/high16 v2, 0x40000000    # 2.0f

    .line 36
    .line 37
    mul-float/2addr v1, v2

    .line 38
    const v2, 0x455ac000    # 3500.0f

    .line 39
    .line 40
    .line 41
    mul-float/2addr v1, v2

    .line 42
    invoke-virtual {p1, v1}, Landroid/view/View;->setCameraDistance(F)V

    .line 43
    .line 44
    .line 45
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    cmpl-float p0, v1, p0

    .line 50
    .line 51
    if-ltz p0, :cond_0

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Landroid/view/View;->setRotationY(F)V

    .line 54
    .line 55
    .line 56
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    int-to-float p0, p0

    .line 61
    mul-float/2addr p0, p3

    .line 62
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationX(F)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 66
    .line 67
    .line 68
    return-void
.end method
