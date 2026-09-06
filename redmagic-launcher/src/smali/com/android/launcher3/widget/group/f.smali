.class public interface abstract Lcom/android/launcher3/widget/group/f;
.super Ljava/lang/Object;
.source "GroupWidgetRootHostView.java"


# virtual methods
.method public abstract a()Z
.end method

.method public abstract b()Z
.end method

.method public abstract getAppWidgetId()I
.end method

.method public abstract getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;
.end method

.method public getGroupWidgetContainerOffsetRect()Landroid/graphics/Rect;
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    instance-of v1, p0, Landroid/view/View;

    .line 7
    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    check-cast p0, Landroid/view/View;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/android/launcher3/widget/group/GroupWidgetUtils;->f(Landroid/view/View;)Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    :goto_0
    instance-of v1, p0, Lcom/android/launcher3/widget/group/b;

    .line 19
    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    add-int/2addr v1, v2

    .line 29
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 30
    .line 31
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    add-int/2addr v1, v2

    .line 38
    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    instance-of v2, v1, Landroid/view/ViewGroup;

    .line 45
    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    check-cast v1, Landroid/view/ViewGroup;

    .line 49
    .line 50
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getWidth()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-lez v2, :cond_0

    .line 55
    .line 56
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getHeight()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-lez v2, :cond_0

    .line 61
    .line 62
    iget v2, v0, Landroid/graphics/Rect;->right:I

    .line 63
    .line 64
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getWidth()I

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    sub-int/2addr v3, v4

    .line 73
    add-int/2addr v2, v3

    .line 74
    iput v2, v0, Landroid/graphics/Rect;->right:I

    .line 75
    .line 76
    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 77
    .line 78
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getHeight()I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    sub-int/2addr v3, p0

    .line 87
    add-int/2addr v2, v3

    .line 88
    iput v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 89
    .line 90
    :cond_0
    move-object p0, v1

    .line 91
    goto :goto_0

    .line 92
    :cond_1
    return-object v0
.end method

.method public abstract getHostViewTitle()Ljava/lang/String;
.end method

.method public abstract getRootTitleTextView()Landroid/widget/TextView;
.end method
