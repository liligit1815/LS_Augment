.class Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;
.super Ljava/lang/Object;
.source "FloatingTaskView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/views/FloatingTaskView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SplitOverlayProperties"
.end annotation


# instance fields
.field private final dX:F

.field private final dY:F

.field private final finalTaskViewScaleX:F

.field private final finalTaskViewScaleY:F


# direct methods
.method constructor <init>(Landroid/graphics/Rect;Landroid/graphics/RectF;II)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    int-to-float v0, v0

    .line 9
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    div-float/2addr v0, v1

    .line 14
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    int-to-float v1, v1

    .line 19
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    div-float/2addr v1, v2

    .line 24
    iput v0, p0, Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;->finalTaskViewScaleX:F

    .line 25
    .line 26
    iput v1, p0, Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;->finalTaskViewScaleY:F

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    sub-int/2addr v0, p3

    .line 33
    int-to-float p3, v0

    .line 34
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    sub-int/2addr p1, p4

    .line 39
    int-to-float p1, p1

    .line 40
    invoke-virtual {p2}, Landroid/graphics/RectF;->centerX()F

    .line 41
    .line 42
    .line 43
    move-result p4

    .line 44
    sub-float/2addr p3, p4

    .line 45
    iput p3, p0, Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;->dX:F

    .line 46
    .line 47
    invoke-virtual {p2}, Landroid/graphics/RectF;->centerY()F

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    sub-float/2addr p1, p2

    .line 52
    iput p1, p0, Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;->dY:F

    .line 53
    .line 54
    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;->dX:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;->dY:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;->finalTaskViewScaleX:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;->finalTaskViewScaleY:F

    .line 2
    .line 3
    return p0
.end method
