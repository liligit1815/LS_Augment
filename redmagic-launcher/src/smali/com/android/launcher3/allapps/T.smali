.class public Lcom/android/launcher3/allapps/T;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.source "PrivateAppsSectionDecorator.java"


# instance fields
.field private final g:Lcom/android/launcher3/allapps/M;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/allapps/M<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/launcher3/allapps/M;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/allapps/M<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/allapps/T;->g:Lcom/android/launcher3/allapps/M;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 6

    .line 1
    new-instance p3, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :goto_0
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ge v0, v1, :cond_4

    .line 12
    .line 13
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p2, v1}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-ltz v2, :cond_3

    .line 22
    .line 23
    iget-object v3, p0, Lcom/android/launcher3/allapps/T;->g:Lcom/android/launcher3/allapps/M;

    .line 24
    .line 25
    invoke-virtual {v3}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-lt v2, v3, :cond_0

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_0
    iget-object v3, p0, Lcom/android/launcher3/allapps/T;->g:Lcom/android/launcher3/allapps/M;

    .line 37
    .line 38
    invoke-virtual {v3}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Lcom/android/launcher3/allapps/O$a;

    .line 47
    .line 48
    iget-object v2, v2, Lcom/android/launcher3/allapps/O$a;->e:Lcom/android/launcher3/allapps/r0;

    .line 49
    .line 50
    if-nez v2, :cond_1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    invoke-virtual {v2}, Lcom/android/launcher3/allapps/r0;->a()Lcom/android/launcher3/allapps/q0;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {v2}, Lcom/android/launcher3/allapps/r0;->c()Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_2

    .line 62
    .line 63
    new-instance v2, Lcom/android/launcher3/allapps/q0$a;

    .line 64
    .line 65
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    invoke-direct {v2, v3, v4, v5}, Lcom/android/launcher3/allapps/q0$a;-><init>(Lcom/android/launcher3/allapps/q0;II)V

    .line 74
    .line 75
    .line 76
    const-string v4, "private_apps"

    .line 77
    .line 78
    invoke-virtual {p3, v4, v2}, Ljava/util/HashMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Lcom/android/launcher3/allapps/q0$a;

    .line 83
    .line 84
    invoke-virtual {v2, v3, v1}, Lcom/android/launcher3/allapps/q0$a;->e(Lcom/android/launcher3/allapps/q0;Landroid/view/View;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p3, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_2
    invoke-virtual {v3, p1, v1}, Lcom/android/launcher3/allapps/q0;->c(Landroid/graphics/Canvas;Landroid/view/View;)V

    .line 92
    .line 93
    .line 94
    :cond_3
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_4
    invoke-virtual {p3}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    if-eqz p2, :cond_5

    .line 110
    .line 111
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    check-cast p2, Lcom/android/launcher3/allapps/q0$a;

    .line 116
    .line 117
    invoke-virtual {p2, p1}, Lcom/android/launcher3/allapps/q0$a;->f(Landroid/graphics/Canvas;)V

    .line 118
    .line 119
    .line 120
    goto :goto_2

    .line 121
    :cond_5
    return-void
.end method
