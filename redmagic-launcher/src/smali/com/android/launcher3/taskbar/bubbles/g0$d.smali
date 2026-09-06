.class Lcom/android/launcher3/taskbar/bubbles/g0$d;
.super Ljava/lang/Object;
.source "BubbleBarViewController.java"

# interfaces
.implements LW1/n;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/bubbles/g0;->O()LW1/n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/taskbar/bubbles/g0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0$d;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$d;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->r(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->V()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$d;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->H0()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    move v0, v2

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v0, v1

    .line 26
    :goto_0
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/g0$d;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 27
    .line 28
    invoke-static {v3}, Lcom/android/launcher3/taskbar/bubbles/g0;->r(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarLocation()LN2/h;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$d;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 37
    .line 38
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->r(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-virtual {v3, p0}, LN2/h;->e(Z)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eq v0, p0, :cond_1

    .line 51
    .line 52
    return v2

    .line 53
    :cond_1
    return v1
.end method

.method public b()Landroid/graphics/PointF;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$d;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->r(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getSelectedBubbleDotDistanceFromTopLeft()Landroid/graphics/PointF;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0$d;->a()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/high16 v2, 0x40000000    # 2.0f

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget v1, v0, Landroid/graphics/PointF;->x:F

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0$d;->e()F

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    :goto_0
    div-float/2addr v3, v2

    .line 26
    sub-float/2addr v1, v3

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0$d;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 29
    .line 30
    invoke-static {v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->r(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getWidth()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    int-to-float v1, v1

    .line 39
    iget v3, v0, Landroid/graphics/PointF;->x:F

    .line 40
    .line 41
    sub-float/2addr v1, v3

    .line 42
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0$d;->e()F

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    goto :goto_0

    .line 47
    :goto_1
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0$d;->e()F

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    div-float/2addr p0, v2

    .line 54
    add-float/2addr v0, p0

    .line 55
    new-instance p0, Landroid/graphics/PointF;

    .line 56
    .line 57
    invoke-direct {p0, v1, v0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 58
    .line 59
    .line 60
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$d;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->r(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getSelectedBubbleDotColor()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public d()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$d;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->r(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleElevation()F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public e()F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$d;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->x(Lcom/android/launcher3/taskbar/bubbles/g0;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    int-to-float p0, p0

    .line 8
    const v0, 0x3e6978d5    # 0.228f

    .line 9
    .line 10
    .line 11
    mul-float/2addr p0, v0

    .line 12
    return p0
.end method

.method public f()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0$d;->b()Landroid/graphics/PointF;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$d;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->r(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getPointerSize()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    int-to-float p0, p0

    .line 18
    sub-float/2addr v0, p0

    .line 19
    return v0
.end method

.method public g()F
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$d;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->r(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getTranslationY()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0$d;->a:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->r(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    int-to-float p0, p0

    .line 22
    sub-float/2addr v0, p0

    .line 23
    return v0
.end method
