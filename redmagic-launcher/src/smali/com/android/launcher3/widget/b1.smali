.class public Lcom/android/launcher3/widget/b1;
.super Landroid/widget/TableRow;
.source "WidgetTableRow.java"

# interfaces
.implements Lcom/android/launcher3/widget/WidgetCell$c;


# instance fields
.field private g:I

.field private h:I

.field private i:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/TableRow;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/widget/b1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/b1;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic b()V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/TableRow;->setAlpha(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private c()V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    invoke-virtual {p0}, Landroid/widget/TableRow;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result v3

    .line 8
    if-ge v1, v3, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/widget/TableRow;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    check-cast v3, Lcom/android/launcher3/widget/WidgetCell;

    .line 15
    .line 16
    invoke-virtual {v3}, Lcom/android/launcher3/widget/WidgetCell;->getPreviewContentHeight()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget v1, p0, Lcom/android/launcher3/widget/b1;->i:I

    .line 28
    .line 29
    if-lez v1, :cond_1

    .line 30
    .line 31
    new-instance v1, Lcom/android/launcher3/widget/a1;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/a1;-><init>(Lcom/android/launcher3/widget/b1;)V

    .line 34
    .line 35
    .line 36
    iget v3, p0, Lcom/android/launcher3/widget/b1;->i:I

    .line 37
    .line 38
    int-to-long v3, v3

    .line 39
    invoke-virtual {p0, v1, v3, v4}, Landroid/widget/TableRow;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 40
    .line 41
    .line 42
    :cond_1
    if-lez v2, :cond_2

    .line 43
    .line 44
    :goto_1
    invoke-virtual {p0}, Landroid/widget/TableRow;->getChildCount()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-ge v0, v1, :cond_2

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/widget/TableRow;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Lcom/android/launcher3/widget/WidgetCell;

    .line 55
    .line 56
    invoke-virtual {v1, v2}, Lcom/android/launcher3/widget/WidgetCell;->setParentAlignedPreviewHeight(I)V

    .line 57
    .line 58
    .line 59
    new-instance v3, Lcom/android/launcher3/dragndrop/d;

    .line 60
    .line 61
    invoke-direct {v3, v1}, Lcom/android/launcher3/dragndrop/d;-><init>(Lcom/android/launcher3/widget/WidgetCell;)V

    .line 62
    .line 63
    .line 64
    iget v4, p0, Lcom/android/launcher3/widget/b1;->i:I

    .line 65
    .line 66
    int-to-long v4, v4

    .line 67
    invoke-virtual {v1, v3, v4, v5}, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 68
    .line 69
    .line 70
    add-int/lit8 v0, v0, 0x1

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_2
    return-void
.end method


# virtual methods
.method public d(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/widget/b1;->h:I

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput p1, p0, Lcom/android/launcher3/widget/b1;->g:I

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/widget/b1;->i:I

    .line 7
    .line 8
    if-lez p2, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/TableRow;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/TableRow;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/widget/b1;->g:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/android/launcher3/widget/b1;->g:I

    .line 6
    .line 7
    iget v1, p0, Lcom/android/launcher3/widget/b1;->h:I

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/widget/b1;->c()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
