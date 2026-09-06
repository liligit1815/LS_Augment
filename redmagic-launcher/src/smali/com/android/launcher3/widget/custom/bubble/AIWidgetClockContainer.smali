.class public Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;
.super Landroid/widget/FrameLayout;
.source "AIWidgetClockContainer.java"


# instance fields
.field private g:Ljava/lang/String;

.field private h:Lcom/android/launcher3/widget/custom/bubble/z;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    const-string p1, "pointer_clock_default"

    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->g:Ljava/lang/String;

    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object p2

    iget-object p2, p2, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    iget-boolean p2, p2, Lcom/android/launcher3/r4;->l:Z

    if-eqz p2, :cond_0

    const/4 p3, 0x0

    goto :goto_0

    :cond_0
    const/16 p3, 0x8

    .line 6
    :goto_0
    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout;->setVisibility(I)V

    if-eqz p2, :cond_1

    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object p1

    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    iget-object p1, p1, Lcom/android/launcher3/r4;->m:Ljava/lang/String;

    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->g:Ljava/lang/String;

    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->c(Landroid/content/Context;)V

    :cond_1
    return-void
.end method

.method private c(Landroid/content/Context;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->g:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    const-string v2, "digital_clock_default"

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    new-instance v1, Lcom/android/launcher3/widget/custom/bubble/PointerClock;

    .line 21
    .line 22
    invoke-direct {v1, p1}, Lcom/android/launcher3/widget/custom/bubble/PointerClock;-><init>(Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->h:Lcom/android/launcher3/widget/custom/bubble/z;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    new-instance v1, Lcom/android/launcher3/widget/custom/bubble/DigitalClock;

    .line 29
    .line 30
    invoke-direct {v1, p1}, Lcom/android/launcher3/widget/custom/bubble/DigitalClock;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->h:Lcom/android/launcher3/widget/custom/bubble/z;

    .line 34
    .line 35
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->h:Lcom/android/launcher3/widget/custom/bubble/z;

    .line 36
    .line 37
    invoke-virtual {p0, p1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->h:Lcom/android/launcher3/widget/custom/bubble/z;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/bubble/z;->b()V

    .line 43
    .line 44
    .line 45
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->g:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->h:Lcom/android/launcher3/widget/custom/bubble/z;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->c(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method protected b()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "doUnlockAnim: clock view: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->h:Lcom/android/launcher3/widget/custom/bubble/z;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "AIWidgetClockContainer"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->h:Lcom/android/launcher3/widget/custom/bubble/z;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/z;->c()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->S()Lcom/android/launcher3/W3;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {p0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Lcom/android/launcher3/q4;->S()Lcom/android/launcher3/W3;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const-string v0, "clock"

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Lcom/android/launcher3/W3;->t(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void
.end method

.method protected d()V
    .locals 0

    .line 1
    return-void
.end method

.method protected e()V
    .locals 0

    .line 1
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->h:Lcom/android/launcher3/widget/custom/bubble/z;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/bubble/z;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public g(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->h:Lcom/android/launcher3/widget/custom/bubble/z;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/z;->d(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method protected h()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->h:Lcom/android/launcher3/widget/custom/bubble/z;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/bubble/z;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
