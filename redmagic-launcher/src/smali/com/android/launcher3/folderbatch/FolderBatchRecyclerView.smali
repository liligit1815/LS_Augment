.class public Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;
.super Lcom/zte/mifavor/androidx/widget/RecyclerView;
.source "FolderBatchRecyclerView.java"


# instance fields
.field public T:Lcom/android/launcher3/keyboard/b;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/zte/mifavor/androidx/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-static {}, Lx1/O;->k1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;->T:Lcom/android/launcher3/keyboard/b;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/android/launcher3/keyboard/a;->e(Landroid/graphics/Canvas;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 5

    .line 1
    invoke-static {}, Lx1/O;->k1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_3

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/16 v1, 0x14

    .line 18
    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    const/16 v2, 0x13

    .line 22
    .line 23
    if-ne v0, v2, :cond_3

    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getFocusedChild()Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    if-eqz v2, :cond_3

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    :try_start_0
    invoke-static {}, Landroid/view/FocusFinder;->getInstance()Landroid/view/FocusFinder;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    if-ne v0, v1, :cond_1

    .line 37
    .line 38
    const/16 v0, 0x82

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/16 v0, 0x21

    .line 42
    .line 43
    :goto_0
    invoke-virtual {v4, p0, v2, v0}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    if-nez v0, :cond_3

    .line 48
    .line 49
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView;->getChildPosition(Landroid/view/View;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    rem-int/lit8 v4, v1, 0x6

    .line 62
    .line 63
    if-nez v4, :cond_2

    .line 64
    .line 65
    const/4 v4, 0x6

    .line 66
    goto :goto_1

    .line 67
    :cond_2
    rem-int/lit8 v4, v1, 0x6

    .line 68
    .line 69
    :goto_1
    sub-int/2addr v1, v4

    .line 70
    if-ge v0, v1, :cond_3

    .line 71
    .line 72
    invoke-virtual {v2}, Landroid/view/View;->requestFocus()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    .line 75
    return v3

    .line 76
    :catch_0
    move-exception p0

    .line 77
    const-string p1, "DispatchKeyEvent"

    .line 78
    .line 79
    const-string v0, "Error finding next focus view"

    .line 80
    .line 81
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 82
    .line 83
    .line 84
    invoke-virtual {v2}, Landroid/view/View;->requestFocus()Z

    .line 85
    .line 86
    .line 87
    return v3

    .line 88
    :cond_3
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    return p0
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lx1/O;->k1()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/keyboard/b;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Lcom/android/launcher3/keyboard/b;-><init>(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;->T:Lcom/android/launcher3/keyboard/b;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setDefaultFocusHighlightEnabled(Z)V

    .line 19
    .line 20
    .line 21
    const/high16 v0, 0x40000

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public requestFocus(ILandroid/graphics/Rect;)Z
    .locals 3

    .line 1
    invoke-static {}, Lx1/O;->k1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView$a;-><init>(Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;)V

    .line 10
    .line 11
    .line 12
    const-wide/16 v1, 0x32

    .line 13
    .line 14
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/ViewGroup;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->requestFocus(ILandroid/graphics/Rect;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method
