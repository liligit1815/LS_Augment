.class public Lcom/zte/mifavor/custom/widget/AbsListView;
.super Ljava/lang/Object;
.source "AbsListView.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "AbsListView"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static onInterceptTouchEvent_setMenuItemSelector([Ljava/lang/Object;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v0, p0, v0

    .line 3
    .line 4
    check-cast v0, Landroid/content/Context;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/zte/mifavor/custom/Config;->isMifavorTheme(Landroid/content/Context;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v0, 0x1

    .line 14
    aget-object v1, p0, v0

    .line 15
    .line 16
    check-cast v1, Landroid/widget/AbsListView;

    .line 17
    .line 18
    instance-of v2, v1, Landroidx/appcompat/widget/O$c;

    .line 19
    .line 20
    if-eqz v2, :cond_5

    .line 21
    .line 22
    const/4 v2, 0x2

    .line 23
    aget-object p0, p0, v2

    .line 24
    .line 25
    check-cast p0, Ljava/lang/Integer;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    const/4 v2, -0x1

    .line 32
    if-ne p0, v2, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    if-nez p0, :cond_3

    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/widget/AbsListView;->getAdapter()Landroid/widget/Adapter;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Landroid/widget/ListAdapter;

    .line 42
    .line 43
    invoke-interface {v2}, Landroid/widget/ListAdapter;->getCount()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    sub-int/2addr v2, v0

    .line 48
    if-ne p0, v2, :cond_2

    .line 49
    .line 50
    sget p0, LR3/f;->s:I

    .line 51
    .line 52
    invoke-virtual {v1, p0}, Landroid/widget/AbsListView;->setSelector(I)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    sget p0, LR3/f;->u:I

    .line 57
    .line 58
    invoke-virtual {v1, p0}, Landroid/widget/AbsListView;->setSelector(I)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_3
    invoke-virtual {v1}, Landroid/widget/AbsListView;->getAdapter()Landroid/widget/Adapter;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    check-cast v2, Landroid/widget/ListAdapter;

    .line 67
    .line 68
    invoke-interface {v2}, Landroid/widget/ListAdapter;->getCount()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    sub-int/2addr v2, v0

    .line 73
    if-ne p0, v2, :cond_4

    .line 74
    .line 75
    sget p0, LR3/f;->t:I

    .line 76
    .line 77
    invoke-virtual {v1, p0}, Landroid/widget/AbsListView;->setSelector(I)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_4
    sget p0, LR3/f;->r:I

    .line 82
    .line 83
    invoke-virtual {v1, p0}, Landroid/widget/AbsListView;->setSelector(I)V

    .line 84
    .line 85
    .line 86
    :cond_5
    :goto_0
    return-void
.end method
