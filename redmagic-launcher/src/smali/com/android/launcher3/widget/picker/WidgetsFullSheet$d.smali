.class Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;
.super Ljava/lang/Object;
.source "WidgetsFullSheet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/picker/WidgetsFullSheet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "d"
.end annotation


# instance fields
.field private a:F

.field private b:F


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, -0x40800000    # -1.0f

    .line 3
    iput v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;->a:F

    .line 4
    iput v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;->b:F

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/widget/picker/A;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;-><init>()V

    return-void
.end method


# virtual methods
.method a(Landroid/view/MotionEvent;F)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    iput p2, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;->a:F

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;->b:F

    .line 19
    .line 20
    return v1

    .line 21
    :cond_0
    const/4 v2, 0x3

    .line 22
    const/high16 v3, -0x40800000    # -1.0f

    .line 23
    .line 24
    if-ne v0, v2, :cond_1

    .line 25
    .line 26
    iput v3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;->b:F

    .line 27
    .line 28
    iput v3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;->a:F

    .line 29
    .line 30
    return v1

    .line 31
    :cond_1
    const/4 v2, 0x1

    .line 32
    if-ne v0, v2, :cond_2

    .line 33
    .line 34
    iput v3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;->b:F

    .line 35
    .line 36
    iput v3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;->a:F

    .line 37
    .line 38
    return v2

    .line 39
    :cond_2
    const/4 v4, 0x2

    .line 40
    if-ne v0, v4, :cond_4

    .line 41
    .line 42
    iget v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;->a:F

    .line 43
    .line 44
    cmpl-float v0, v0, v3

    .line 45
    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    iget v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;->b:F

    .line 49
    .line 50
    cmpl-float v4, v0, v3

    .line 51
    .line 52
    if-eqz v4, :cond_4

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    sub-float/2addr v0, v4

    .line 59
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iget v4, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;->a:F

    .line 64
    .line 65
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    sub-float/2addr v4, p1

    .line 70
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    cmpl-float v0, v0, p2

    .line 75
    .line 76
    if-gez v0, :cond_3

    .line 77
    .line 78
    cmpl-float p1, p1, p2

    .line 79
    .line 80
    if-ltz p1, :cond_4

    .line 81
    .line 82
    :cond_3
    iput v3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;->b:F

    .line 83
    .line 84
    iput v3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;->a:F

    .line 85
    .line 86
    return v2

    .line 87
    :cond_4
    return v1
.end method
