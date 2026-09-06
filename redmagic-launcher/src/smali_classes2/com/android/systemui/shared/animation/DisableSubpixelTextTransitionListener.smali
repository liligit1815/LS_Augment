.class public final Lcom/android/systemui/shared/animation/DisableSubpixelTextTransitionListener;
.super Ljava/lang/Object;
.source "DisableSubpixelTextTransitionListener.kt"

# interfaces
.implements LC2/i$a;


# instance fields
.field private final childrenTextViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/TextView;",
            ">;>;"
        }
    .end annotation
.end field

.field private isTransitionInProgress:Z

.field private final rootView:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/systemui/shared/animation/DisableSubpixelTextTransitionListener;->rootView:Landroid/view/ViewGroup;

    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/systemui/shared/animation/DisableSubpixelTextTransitionListener;->childrenTextViews:Ljava/util/List;

    .line 12
    .line 13
    return-void
.end method

.method private final getAllChildTextView(Landroid/view/ViewGroup;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Ljava/util/List<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/TextView;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_2

    .line 9
    .line 10
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    instance-of v3, v2, Landroid/view/ViewGroup;

    .line 15
    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    check-cast v2, Landroid/view/ViewGroup;

    .line 19
    .line 20
    invoke-direct {p0, v2, p2}, Lcom/android/systemui/shared/animation/DisableSubpixelTextTransitionListener;->getAllChildTextView(Landroid/view/ViewGroup;Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    instance-of v3, v2, Landroid/widget/TextView;

    .line 25
    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    move-object v3, v2

    .line 29
    check-cast v3, Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaintFlags()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    and-int/lit16 v3, v3, 0x80

    .line 36
    .line 37
    if-gtz v3, :cond_1

    .line 38
    .line 39
    new-instance v3, Ljava/lang/ref/WeakReference;

    .line 40
    .line 41
    invoke-direct {v3, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    invoke-interface {p2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    return-void
.end method


# virtual methods
.method public onTransitionFinished()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/systemui/shared/animation/DisableSubpixelTextTransitionListener;->isTransitionInProgress:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/android/systemui/shared/animation/DisableSubpixelTextTransitionListener;->isTransitionInProgress:Z

    .line 8
    .line 9
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    const-string v1, "subpixelFlagEnableForTextView"

    .line 16
    .line 17
    invoke-static {v1}, LK0/a;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    :try_start_0
    iget-object v1, p0, Lcom/android/systemui/shared/animation/DisableSubpixelTextTransitionListener;->childrenTextViews:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_3

    .line 31
    .line 32
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Landroid/widget/TextView;

    .line 43
    .line 44
    if-nez v2, :cond_2

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    invoke-virtual {v2}, Landroid/widget/TextView;->getPaintFlags()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    and-int/lit16 v3, v3, -0x81

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setPaintFlags(I)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :catchall_0
    move-exception p0

    .line 58
    goto :goto_2

    .line 59
    :cond_3
    iget-object p0, p0, Lcom/android/systemui/shared/animation/DisableSubpixelTextTransitionListener;->childrenTextViews:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 62
    .line 63
    .line 64
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    .line 66
    if-eqz v0, :cond_4

    .line 67
    .line 68
    invoke-static {}, LK0/a;->b()V

    .line 69
    .line 70
    .line 71
    :cond_4
    :goto_1
    return-void

    .line 72
    :goto_2
    if-eqz v0, :cond_5

    .line 73
    .line 74
    invoke-static {}, LK0/a;->b()V

    .line 75
    .line 76
    .line 77
    :cond_5
    throw p0
.end method

.method public bridge synthetic onTransitionFinishing()V
    .locals 0

    .line 1
    invoke-super {p0}, LC2/i$a;->onTransitionFinishing()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic onTransitionProgress(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, LC2/i$a;->onTransitionProgress(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onTransitionStarted()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/systemui/shared/animation/DisableSubpixelTextTransitionListener;->isTransitionInProgress:Z

    .line 3
    .line 4
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string v1, "subpixelFlagSetForTextView"

    .line 11
    .line 12
    invoke-static {v1}, LK0/a;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    :try_start_0
    const-string v1, "subpixelFlagTraverseHierarchy"

    .line 16
    .line 17
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    invoke-static {v1}, LK0/a;->a(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    goto :goto_3

    .line 29
    :cond_1
    :goto_0
    :try_start_1
    iget-object v1, p0, Lcom/android/systemui/shared/animation/DisableSubpixelTextTransitionListener;->rootView:Landroid/view/ViewGroup;

    .line 30
    .line 31
    iget-object v3, p0, Lcom/android/systemui/shared/animation/DisableSubpixelTextTransitionListener;->childrenTextViews:Ljava/util/List;

    .line 32
    .line 33
    invoke-direct {p0, v1, v3}, Lcom/android/systemui/shared/animation/DisableSubpixelTextTransitionListener;->getAllChildTextView(Landroid/view/ViewGroup;Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    sget-object v1, Lh4/t;->a:Lh4/t;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 37
    .line 38
    if-eqz v2, :cond_2

    .line 39
    .line 40
    :try_start_2
    invoke-static {}, LK0/a;->b()V

    .line 41
    .line 42
    .line 43
    :cond_2
    const-string v1, "subpixelFlagDisableForTextView"

    .line 44
    .line 45
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_3

    .line 50
    .line 51
    invoke-static {v1}, LK0/a;->a(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 52
    .line 53
    .line 54
    :cond_3
    :try_start_3
    iget-object p0, p0, Lcom/android/systemui/shared/animation/DisableSubpixelTextTransitionListener;->childrenTextViews:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_5

    .line 65
    .line 66
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Landroid/widget/TextView;

    .line 77
    .line 78
    if-nez v1, :cond_4

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_4
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaintFlags()I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    or-int/lit16 v3, v3, 0x80

    .line 86
    .line 87
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setPaintFlags(I)V

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :catchall_1
    move-exception p0

    .line 92
    goto :goto_2

    .line 93
    :cond_5
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 94
    .line 95
    if-eqz v2, :cond_6

    .line 96
    .line 97
    :try_start_4
    invoke-static {}, LK0/a;->b()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 98
    .line 99
    .line 100
    :cond_6
    if-eqz v0, :cond_7

    .line 101
    .line 102
    invoke-static {}, LK0/a;->b()V

    .line 103
    .line 104
    .line 105
    :cond_7
    return-void

    .line 106
    :goto_2
    if-eqz v2, :cond_8

    .line 107
    .line 108
    :try_start_5
    invoke-static {}, LK0/a;->b()V

    .line 109
    .line 110
    .line 111
    :cond_8
    throw p0

    .line 112
    :catchall_2
    move-exception p0

    .line 113
    if-eqz v2, :cond_9

    .line 114
    .line 115
    invoke-static {}, LK0/a;->b()V

    .line 116
    .line 117
    .line 118
    :cond_9
    throw p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 119
    :goto_3
    if-eqz v0, :cond_a

    .line 120
    .line 121
    invoke-static {}, LK0/a;->b()V

    .line 122
    .line 123
    .line 124
    :cond_a
    throw p0
.end method
