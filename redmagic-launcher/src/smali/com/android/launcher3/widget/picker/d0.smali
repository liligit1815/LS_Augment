.class public final Lcom/android/launcher3/widget/picker/d0;
.super Ljava/lang/Object;
.source "WidgetsListTableViewHolderBinder.java"

# interfaces
.implements LG1/e;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LG1/e<",
        "Lm2/h;",
        "Lcom/android/launcher3/widget/picker/e0;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Landroid/view/LayoutInflater;

.field private final b:Landroid/view/View$OnClickListener;

.field private final c:Landroid/content/Context;

.field private final d:Lcom/android/launcher3/views/k;

.field private final e:I

.field private final f:Landroid/view/View$OnLongClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/LayoutInflater;Landroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/android/launcher3/widget/picker/d0;->a:Landroid/view/LayoutInflater;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/d0;->c:Landroid/content/Context;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    check-cast p2, Lcom/android/launcher3/views/k;

    .line 13
    .line 14
    iput-object p2, p0, Lcom/android/launcher3/widget/picker/d0;->d:Lcom/android/launcher3/views/k;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const p2, 0x7f070c5b

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iput p1, p0, Lcom/android/launcher3/widget/picker/d0;->e:I

    .line 28
    .line 29
    iput-object p3, p0, Lcom/android/launcher3/widget/picker/d0;->b:Landroid/view/View$OnClickListener;

    .line 30
    .line 31
    iput-object p4, p0, Lcom/android/launcher3/widget/picker/d0;->f:Landroid/view/View$OnLongClickListener;

    .line 32
    .line 33
    return-void
.end method

.method private d(Lcom/android/launcher3/widget/b1;Ljava/util/List;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/widget/b1;",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/widget/TableRow;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eq p0, v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    move p0, v1

    .line 14
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-ge p0, v0, :cond_3

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Landroid/widget/TableRow;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/android/launcher3/widget/WidgetCell;

    .line 25
    .line 26
    invoke-interface {p2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lz1/Z4;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/android/launcher3/widget/WidgetCell;->getWidgetItem()Lz1/Z4;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    if-eqz v3, :cond_2

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/android/launcher3/widget/WidgetCell;->getWidgetItem()Lz1/Z4;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/E;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    add-int/lit8 p0, p0, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    :goto_1
    return v1

    .line 53
    :cond_3
    const/4 p0, 0x1

    .line 54
    return p0
.end method

.method private g(Landroid/widget/TableLayout;Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/TableLayout;",
            "Ljava/util/List<",
            "Ljava/util/ArrayList<",
            "Lz1/Z4;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    :goto_0
    invoke-virtual {p1}, Landroid/widget/TableLayout;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/16 v2, 0x8

    .line 10
    .line 11
    if-ge v0, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/widget/TableLayout;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    add-int/lit8 v0, v0, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    move v1, v0

    .line 25
    :goto_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-ge v1, v3, :cond_4

    .line 30
    .line 31
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Ljava/util/List;

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/widget/TableLayout;->getChildCount()I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    if-ge v1, v4, :cond_1

    .line 42
    .line 43
    invoke-virtual {p1, v1}, Landroid/widget/TableLayout;->getChildAt(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    check-cast v4, Lcom/android/launcher3/widget/b1;

    .line 48
    .line 49
    goto :goto_2

    .line 50
    :cond_1
    new-instance v4, Lcom/android/launcher3/widget/b1;

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/widget/TableLayout;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    invoke-direct {v4, v5}, Lcom/android/launcher3/widget/b1;-><init>(Landroid/content/Context;)V

    .line 57
    .line 58
    .line 59
    const/16 v5, 0x30

    .line 60
    .line 61
    invoke-virtual {v4, v5}, Landroid/widget/TableRow;->setGravity(I)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, v4}, Landroid/widget/TableLayout;->addView(Landroid/view/View;)V

    .line 65
    .line 66
    .line 67
    :goto_2
    invoke-direct {p0, v4, v3}, Lcom/android/launcher3/widget/picker/d0;->d(Lcom/android/launcher3/widget/b1;Ljava/util/List;)Z

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    if-nez v5, :cond_3

    .line 72
    .line 73
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    sget v6, Lcom/android/launcher3/widget/picker/c0;->a:I

    .line 78
    .line 79
    invoke-virtual {v4, v5, v6}, Lcom/android/launcher3/widget/b1;->d(II)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v4}, Landroid/widget/TableRow;->getChildCount()I

    .line 83
    .line 84
    .line 85
    move-result v5

    .line 86
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 87
    .line 88
    .line 89
    move-result v6

    .line 90
    if-le v5, v6, :cond_2

    .line 91
    .line 92
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    :goto_3
    invoke-virtual {v4}, Landroid/widget/TableRow;->getChildCount()I

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    if-ge v3, v5, :cond_3

    .line 101
    .line 102
    invoke-virtual {v4, v3}, Landroid/widget/TableRow;->getChildAt(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    invoke-virtual {v5, v2}, Landroid/view/View;->setVisibility(I)V

    .line 107
    .line 108
    .line 109
    add-int/lit8 v3, v3, 0x1

    .line 110
    .line 111
    goto :goto_3

    .line 112
    :cond_2
    invoke-virtual {v4}, Landroid/widget/TableRow;->getChildCount()I

    .line 113
    .line 114
    .line 115
    move-result v5

    .line 116
    :goto_4
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 117
    .line 118
    .line 119
    move-result v6

    .line 120
    if-ge v5, v6, :cond_3

    .line 121
    .line 122
    iget-object v6, p0, Lcom/android/launcher3/widget/picker/d0;->a:Landroid/view/LayoutInflater;

    .line 123
    .line 124
    const v7, 0x7f0e025d

    .line 125
    .line 126
    .line 127
    invoke-virtual {v6, v7, v4, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object v6

    .line 131
    check-cast v6, Lcom/android/launcher3/widget/WidgetCell;

    .line 132
    .line 133
    iget-object v7, p0, Lcom/android/launcher3/widget/picker/d0;->b:Landroid/view/View$OnClickListener;

    .line 134
    .line 135
    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v6, v4}, Lcom/android/launcher3/widget/WidgetCell;->e(Lcom/android/launcher3/widget/WidgetCell$c;)V

    .line 139
    .line 140
    .line 141
    const v7, 0x7f0b068e

    .line 142
    .line 143
    .line 144
    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 145
    .line 146
    .line 147
    move-result-object v7

    .line 148
    iget-object v8, p0, Lcom/android/launcher3/widget/picker/d0;->b:Landroid/view/View$OnClickListener;

    .line 149
    .line 150
    invoke-virtual {v7, v8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 151
    .line 152
    .line 153
    iget-object v8, p0, Lcom/android/launcher3/widget/picker/d0;->f:Landroid/view/View$OnLongClickListener;

    .line 154
    .line 155
    invoke-virtual {v7, v8}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v6, v0}, Lcom/android/launcher3/widget/WidgetCell;->setAnimatePreview(Z)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v4, v6}, Landroid/widget/TableRow;->addView(Landroid/view/View;)V

    .line 162
    .line 163
    .line 164
    add-int/lit8 v5, v5, 0x1

    .line 165
    .line 166
    goto :goto_4

    .line 167
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 168
    .line 169
    goto/16 :goto_1

    .line 170
    .line 171
    :cond_4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/widget/picker/e0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/picker/d0;->h(Lcom/android/launcher3/widget/picker/e0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic b(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/picker/d0;->f(Landroid/view/ViewGroup;)Lcom/android/launcher3/widget/picker/e0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic c(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Ljava/lang/Object;ILjava/util/List;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/widget/picker/e0;

    .line 2
    .line 3
    check-cast p2, Lm2/h;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/launcher3/widget/picker/d0;->e(Lcom/android/launcher3/widget/picker/e0;Lm2/h;ILjava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e(Lcom/android/launcher3/widget/picker/e0;Lm2/h;ILjava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/widget/picker/e0;",
            "Lm2/h;",
            "I",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    :goto_0
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroid/util/Pair;

    .line 16
    .line 17
    iget-object v1, p1, Lcom/android/launcher3/widget/picker/e0;->b:Ljava/util/Map;

    .line 18
    .line 19
    iget-object v2, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v2, Lz1/Z4;

    .line 22
    .line 23
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v0, Landroid/graphics/Bitmap;

    .line 26
    .line 27
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object p1, p1, Lcom/android/launcher3/widget/picker/e0;->a:Lcom/android/launcher3/widget/picker/WidgetsListTableView;

    .line 32
    .line 33
    and-int/lit8 p4, p3, 0x1

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    const/4 v1, 0x0

    .line 37
    if-eqz p4, :cond_1

    .line 38
    .line 39
    move p4, v0

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    move p4, v1

    .line 42
    :goto_1
    and-int/lit8 p3, p3, 0x2

    .line 43
    .line 44
    if-eqz p3, :cond_2

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_2
    move v0, v1

    .line 48
    :goto_2
    invoke-static {p4, v0}, Lcom/android/launcher3/widget/picker/U;->c(ZZ)Lcom/android/launcher3/widget/picker/U;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    invoke-virtual {p1, p3}, Lcom/android/launcher3/widget/picker/WidgetsListTableView;->setListDrawableState(Lcom/android/launcher3/widget/picker/U;)V

    .line 53
    .line 54
    .line 55
    iget-object p3, p2, Lm2/g;->c:Ljava/util/List;

    .line 56
    .line 57
    iget-object p4, p0, Lcom/android/launcher3/widget/picker/d0;->c:Landroid/content/Context;

    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/d0;->d:Lcom/android/launcher3/views/k;

    .line 60
    .line 61
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p2}, Lm2/h;->n()I

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    iget v2, p0, Lcom/android/launcher3/widget/picker/d0;->e:I

    .line 70
    .line 71
    invoke-static {p3, p4, v0, p2, v2}, Lr2/i;->f(Ljava/util/List;Landroid/content/Context;Lcom/android/launcher3/h0;II)Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/picker/d0;->g(Landroid/widget/TableLayout;Ljava/util/List;)V

    .line 76
    .line 77
    .line 78
    move p3, v1

    .line 79
    :goto_3
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 80
    .line 81
    .line 82
    move-result p4

    .line 83
    if-ge p3, p4, :cond_5

    .line 84
    .line 85
    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p4

    .line 89
    check-cast p4, Ljava/util/List;

    .line 90
    .line 91
    invoke-virtual {p1, p3}, Landroid/widget/TableLayout;->getChildAt(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    check-cast v0, Lcom/android/launcher3/widget/b1;

    .line 96
    .line 97
    invoke-direct {p0, v0, p4}, Lcom/android/launcher3/widget/picker/d0;->d(Lcom/android/launcher3/widget/b1;Ljava/util/List;)Z

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    if-eqz v2, :cond_3

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Landroid/widget/TableRow;->setVisibility(I)V

    .line 104
    .line 105
    .line 106
    move v2, v1

    .line 107
    :goto_4
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    if-ge v2, v3, :cond_4

    .line 112
    .line 113
    invoke-virtual {v0, v2}, Landroid/widget/TableRow;->getChildAt(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    check-cast v3, Lcom/android/launcher3/widget/WidgetCell;

    .line 118
    .line 119
    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 120
    .line 121
    .line 122
    add-int/lit8 v2, v2, 0x1

    .line 123
    .line 124
    goto :goto_4

    .line 125
    :cond_3
    move v2, v1

    .line 126
    :goto_5
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    if-ge v2, v3, :cond_4

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Landroid/widget/TableRow;->setVisibility(I)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0, v2}, Landroid/widget/TableRow;->getChildAt(I)Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    check-cast v3, Lcom/android/launcher3/widget/WidgetCell;

    .line 140
    .line 141
    invoke-virtual {v3}, Lcom/android/launcher3/widget/WidgetCell;->j()V

    .line 142
    .line 143
    .line 144
    invoke-interface {p4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v4

    .line 148
    check-cast v4, Lz1/Z4;

    .line 149
    .line 150
    invoke-virtual {v3, v0}, Lcom/android/launcher3/widget/WidgetCell;->e(Lcom/android/launcher3/widget/WidgetCell$c;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v3, v4}, Lcom/android/launcher3/widget/WidgetCell;->g(Lz1/Z4;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 160
    .line 161
    .line 162
    add-int/lit8 v2, v2, 0x1

    .line 163
    .line 164
    goto :goto_5

    .line 165
    :cond_4
    add-int/lit8 p3, p3, 0x1

    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_5
    return-void
.end method

.method public f(Landroid/view/ViewGroup;)Lcom/android/launcher3/widget/picker/e0;
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/picker/e0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/d0;->a:Landroid/view/LayoutInflater;

    .line 4
    .line 5
    const v1, 0x7f0e0272

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {p0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/picker/e0;-><init>(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public h(Lcom/android/launcher3/widget/picker/e0;)V
    .locals 6

    .line 1
    iget-object p0, p1, Lcom/android/launcher3/widget/picker/e0;->a:Lcom/android/launcher3/widget/picker/WidgetsListTableView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/TableLayout;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    iget-object v0, p1, Lcom/android/launcher3/widget/picker/e0;->b:Ljava/util/Map;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    move v1, v0

    .line 14
    :goto_0
    if-ge v1, p0, :cond_1

    .line 15
    .line 16
    iget-object v2, p1, Lcom/android/launcher3/widget/picker/e0;->a:Lcom/android/launcher3/widget/picker/WidgetsListTableView;

    .line 17
    .line 18
    invoke-virtual {v2, v1}, Landroid/widget/TableLayout;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/android/launcher3/widget/b1;

    .line 23
    .line 24
    invoke-virtual {v2}, Landroid/widget/TableRow;->getChildCount()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    move v4, v0

    .line 29
    :goto_1
    if-ge v4, v3, :cond_0

    .line 30
    .line 31
    invoke-virtual {v2, v4}, Landroid/widget/TableRow;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    check-cast v5, Lcom/android/launcher3/widget/WidgetCell;

    .line 36
    .line 37
    invoke-virtual {v5}, Lcom/android/launcher3/widget/WidgetCell;->j()V

    .line 38
    .line 39
    .line 40
    add-int/lit8 v4, v4, 0x1

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    return-void
.end method
