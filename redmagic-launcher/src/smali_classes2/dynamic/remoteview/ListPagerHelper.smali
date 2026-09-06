.class public Ldynamic/remoteview/ListPagerHelper;
.super Ljava/lang/Object;
.source "ListPagerHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ListPagerHelper"


# instance fields
.field private mListView:Ldynamic/remoteview/HorizontalListView;


# direct methods
.method public constructor <init>(Ldynamic/remoteview/HorizontalListView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ldynamic/remoteview/ListPagerHelper;->mListView:Ldynamic/remoteview/HorizontalListView;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public nextPage(IILjava/lang/String;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ldynamic/remoteview/ListPagerHelper;->mListView:Ldynamic/remoteview/HorizontalListView;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto/16 :goto_2

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p1}, Ldynamic/remoteview/HorizontalListView;->getAdapter()Landroid/widget/ListAdapter;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p1}, Landroid/widget/ListAdapter;->getCount()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    add-int/lit8 p1, p1, -0x1

    .line 16
    .line 17
    iget-object v0, p0, Ldynamic/remoteview/ListPagerHelper;->mListView:Ldynamic/remoteview/HorizontalListView;

    .line 18
    .line 19
    invoke-virtual {v0}, Ldynamic/remoteview/HorizontalListView;->getLastVisiblePosition()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-ltz p1, :cond_5

    .line 24
    .line 25
    if-lt v0, p1, :cond_1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    iget-object p1, p0, Ldynamic/remoteview/ListPagerHelper;->mListView:Ldynamic/remoteview/HorizontalListView;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getChildCount()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-gtz p1, :cond_2

    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_2
    iget-object p2, p0, Ldynamic/remoteview/ListPagerHelper;->mListView:Ldynamic/remoteview/HorizontalListView;

    .line 38
    .line 39
    add-int/lit8 p1, p1, -0x1

    .line 40
    .line 41
    invoke-virtual {p2, p1}, Landroid/widget/AdapterView;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    if-nez p1, :cond_3

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_3
    iget-object p2, p0, Ldynamic/remoteview/ListPagerHelper;->mListView:Ldynamic/remoteview/HorizontalListView;

    .line 49
    .line 50
    invoke-virtual {p2}, Ldynamic/remoteview/HorizontalListView;->getHorizontalOffset()I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    new-instance p3, Landroid/graphics/Rect;

    .line 55
    .line 56
    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, p3}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 60
    .line 61
    .line 62
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    .line 63
    .line 64
    .line 65
    move-result p3

    .line 66
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-ge p3, v0, :cond_4

    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    goto :goto_0

    .line 77
    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    :goto_0
    iget-object p0, p0, Ldynamic/remoteview/ListPagerHelper;->mListView:Ldynamic/remoteview/HorizontalListView;

    .line 82
    .line 83
    add-int/2addr p2, p1

    .line 84
    invoke-virtual {p0, p2}, Ldynamic/remoteview/HorizontalListView;->scrollTo(I)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_5
    :goto_1
    iget-object p0, p0, Ldynamic/remoteview/ListPagerHelper;->mListView:Ldynamic/remoteview/HorizontalListView;

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/widget/AdapterView;->getContext()Landroid/content/Context;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    if-nez p0, :cond_6

    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_6
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    const/4 p3, 0x0

    .line 102
    if-eqz p1, :cond_7

    .line 103
    .line 104
    const p1, 0x7f140338

    .line 105
    .line 106
    .line 107
    invoke-static {p0, p1, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_7
    :try_start_0
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-static {p0, p1, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    .line 125
    .line 126
    goto :goto_2

    .line 127
    :catch_0
    move-exception p0

    .line 128
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 129
    .line 130
    .line 131
    :goto_2
    return-void
.end method
