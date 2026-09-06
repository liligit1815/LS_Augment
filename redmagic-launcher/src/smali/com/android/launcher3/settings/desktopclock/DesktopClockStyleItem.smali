.class public Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;
.super Landroid/widget/FrameLayout;
.source "DesktopClockStyleItem.java"

# interfaces
.implements Lcom/android/launcher3/settings/desktopclock/MenuEffectView$b;


# instance fields
.field private g:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;->g:I

    .line 6
    .line 7
    sget-object v1, Lcom/android/launcher3/x5;->r0:[I

    .line 8
    .line 9
    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 p2, 0x0

    .line 14
    :try_start_0
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    iput p2, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;->g:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->close()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    :try_start_1
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_1
    move-exception p1

    .line 32
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    :goto_0
    throw p0
.end method

.method private d(I)I
    .locals 1

    .line 1
    sget-object p0, LL1/b;->a:[I

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const p0, 0x7f0e0193

    .line 7
    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    if-ltz p1, :cond_2

    .line 11
    .line 12
    if-lt p1, v0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    aget p0, p0, p1

    .line 16
    .line 17
    return p0

    .line 18
    :cond_2
    :goto_0
    const/4 p1, 0x0

    .line 19
    aget p0, p0, p1

    .line 20
    .line 21
    return p0
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;->d(I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, p1, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    instance-of v0, p1, Lcom/android/launcher3/widget/custom/bubble/z;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget p0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;->g:I

    .line 30
    .line 31
    if-ne p0, v1, :cond_0

    .line 32
    .line 33
    check-cast p1, Lcom/android/launcher3/widget/custom/bubble/z;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/android/launcher3/widget/custom/bubble/z;->b()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    check-cast p1, Lcom/android/launcher3/widget/custom/bubble/z;

    .line 40
    .line 41
    invoke-virtual {p1, p0}, Lcom/android/launcher3/widget/custom/bubble/z;->setScene(I)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    instance-of v0, p0, Lcom/android/launcher3/widget/custom/bubble/z;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    check-cast p0, Lcom/android/launcher3/widget/custom/bubble/z;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/bubble/z;->a()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

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
