.class Lcom/android/launcher3/widget/F;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "CustomTransformAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/F$a;,
        Lcom/android/launcher3/widget/F$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/android/launcher3/widget/F$b;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Landroid/view/LayoutInflater;

.field private b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;"
        }
    .end annotation
.end field

.field private c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;"
        }
    .end annotation
.end field

.field private final d:Landroid/view/View$OnClickListener;

.field private final e:Landroid/view/View$OnLongClickListener;

.field protected f:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/LayoutInflater;Landroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/widget/F;->b:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/widget/F;->c:Ljava/util/List;

    .line 17
    .line 18
    iput-object p2, p0, Lcom/android/launcher3/widget/F;->a:Landroid/view/LayoutInflater;

    .line 19
    .line 20
    iput-object p3, p0, Lcom/android/launcher3/widget/F;->d:Landroid/view/View$OnClickListener;

    .line 21
    .line 22
    iput-object p4, p0, Lcom/android/launcher3/widget/F;->e:Landroid/view/View$OnLongClickListener;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    const p3, 0x7f0701f5

    .line 29
    .line 30
    .line 31
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    const p4, 0x7f0809e0

    .line 40
    .line 41
    .line 42
    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    iput-object p3, p0, Lcom/android/launcher3/widget/F;->f:Landroid/graphics/drawable/Drawable;

    .line 47
    .line 48
    const p4, 0x7f06026c

    .line 49
    .line 50
    .line 51
    invoke-static {p1, p4}, Lz/a;->c(Landroid/content/Context;I)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-virtual {p3, p1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/android/launcher3/widget/F;->f:Landroid/graphics/drawable/Drawable;

    .line 59
    .line 60
    const/4 p1, 0x0

    .line 61
    invoke-virtual {p0, p1, p1, p2, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public static synthetic f(Lz1/Z4;Lz1/Z4;)Z
    .locals 0

    .line 1
    iget-object p1, p1, Lz1/Z4;->g:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/Z4;->g:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method


# virtual methods
.method public g(Lcom/android/launcher3/widget/F$b;I)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v1, v1, Lcom/android/launcher3/widget/F$b;->a:Landroid/view/ViewGroup;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    instance-of v3, v2, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 12
    .line 13
    const/4 v4, 0x2

    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    const v5, 0x7f0701f3

    .line 25
    .line 26
    .line 27
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    move-object v5, v2

    .line 32
    check-cast v5, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    invoke-static {v6}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 39
    .line 40
    .line 41
    move-result-object v6

    .line 42
    invoke-virtual {v6}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    iget v6, v6, Lcom/android/launcher3/h0;->T0:I

    .line 47
    .line 48
    sub-int/2addr v6, v3

    .line 49
    div-int/2addr v6, v4

    .line 50
    iput v6, v5, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 51
    .line 52
    :cond_0
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    .line 54
    .line 55
    iget-object v2, v0, Lcom/android/launcher3/widget/F;->b:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    const/4 v3, 0x0

    .line 62
    move v5, v3

    .line 63
    :goto_0
    if-ge v5, v4, :cond_4

    .line 64
    .line 65
    mul-int/lit8 v6, p2, 0x2

    .line 66
    .line 67
    add-int/2addr v6, v5

    .line 68
    if-ge v6, v2, :cond_2

    .line 69
    .line 70
    iget-object v7, v0, Lcom/android/launcher3/widget/F;->b:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v7, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    move-object v8, v6

    .line 77
    check-cast v8, Lz1/Z4;

    .line 78
    .line 79
    iget-object v6, v0, Lcom/android/launcher3/widget/F;->a:Landroid/view/LayoutInflater;

    .line 80
    .line 81
    const v7, 0x7f0e0086

    .line 82
    .line 83
    .line 84
    invoke-virtual {v6, v7, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    move-object v7, v6

    .line 89
    check-cast v7, Lcom/android/launcher3/widget/WidgetCellMfv;

    .line 90
    .line 91
    iget-object v6, v0, Lcom/android/launcher3/widget/F;->d:Landroid/view/View$OnClickListener;

    .line 92
    .line 93
    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 94
    .line 95
    .line 96
    iget-object v6, v0, Lcom/android/launcher3/widget/F;->e:Landroid/view/View$OnLongClickListener;

    .line 97
    .line 98
    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 99
    .line 100
    .line 101
    const/4 v6, 0x1

    .line 102
    if-ne v5, v6, :cond_1

    .line 103
    .line 104
    invoke-virtual {v7}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 105
    .line 106
    .line 107
    move-result-object v6

    .line 108
    check-cast v6, Landroid/widget/LinearLayout$LayoutParams;

    .line 109
    .line 110
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 111
    .line 112
    .line 113
    move-result-object v9

    .line 114
    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 115
    .line 116
    .line 117
    move-result-object v9

    .line 118
    const v10, 0x7f0702b7

    .line 119
    .line 120
    .line 121
    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDimension(I)F

    .line 122
    .line 123
    .line 124
    move-result v9

    .line 125
    float-to-int v9, v9

    .line 126
    iput v9, v6, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 127
    .line 128
    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 129
    .line 130
    .line 131
    :cond_1
    iget-object v6, v0, Lcom/android/launcher3/widget/F;->c:Ljava/util/List;

    .line 132
    .line 133
    invoke-interface {v6}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 134
    .line 135
    .line 136
    move-result-object v6

    .line 137
    new-instance v9, Lcom/android/launcher3/widget/D;

    .line 138
    .line 139
    invoke-direct {v9, v8}, Lcom/android/launcher3/widget/D;-><init>(Lz1/Z4;)V

    .line 140
    .line 141
    .line 142
    invoke-interface {v6, v9}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 143
    .line 144
    .line 145
    move-result-object v6

    .line 146
    invoke-interface {v6}, Ljava/util/stream/Stream;->count()J

    .line 147
    .line 148
    .line 149
    move-result-wide v14

    .line 150
    iget-object v6, v8, Lz1/Z4;->g:Ljava/lang/String;

    .line 151
    .line 152
    invoke-static {v6}, Lx1/i0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v9

    .line 156
    invoke-static {v14, v15}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v10

    .line 160
    iget-object v11, v0, Lcom/android/launcher3/widget/F;->f:Landroid/graphics/drawable/Drawable;

    .line 161
    .line 162
    const/4 v12, 0x0

    .line 163
    const/4 v13, 0x1

    .line 164
    invoke-virtual/range {v7 .. v13}, Lcom/android/launcher3/widget/WidgetCellMfv;->F(Lz1/Z4;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;ZZ)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v7, v8}, Lcom/android/launcher3/widget/WidgetCellMfv;->g(Lz1/Z4;)V

    .line 168
    .line 169
    .line 170
    invoke-static {v14, v15}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v6

    .line 174
    iget-object v8, v8, Lz1/Z4;->g:Ljava/lang/String;

    .line 175
    .line 176
    invoke-static {v8}, Lx1/i0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v8

    .line 180
    invoke-virtual {v7, v6, v8}, Lcom/android/launcher3/widget/WidgetCellMfv;->I(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 184
    .line 185
    .line 186
    goto :goto_1

    .line 187
    :cond_2
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 188
    .line 189
    .line 190
    move-result v6

    .line 191
    if-ge v5, v6, :cond_3

    .line 192
    .line 193
    sub-int/2addr v6, v5

    .line 194
    invoke-virtual {v1, v5, v6}, Landroid/view/ViewGroup;->removeViews(II)V

    .line 195
    .line 196
    .line 197
    :cond_3
    :goto_1
    add-int/lit8 v5, v5, 0x1

    .line 198
    .line 199
    goto/16 :goto_0

    .line 200
    .line 201
    :cond_4
    return-void
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/F;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    return p1
.end method

.method public h(Landroid/view/ViewGroup;I)Lcom/android/launcher3/widget/F$b;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/F;->a:Landroid/view/LayoutInflater;

    .line 2
    .line 3
    const p2, 0x7f0e0088

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/view/ViewGroup;

    .line 12
    .line 13
    new-instance p1, Lcom/android/launcher3/widget/F$b;

    .line 14
    .line 15
    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/F$b;-><init>(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    return-object p1
.end method

.method public i(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/F;->c:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Lcom/android/launcher3/widget/F$a;

    .line 4
    .line 5
    invoke-direct {v0}, Lcom/android/launcher3/widget/F$a;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1, v0}, Ljava/util/List;->sort(Ljava/util/Comparator;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Lcom/android/launcher3/widget/E;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/android/launcher3/widget/E;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Lx1/O;->E(Ljava/util/function/Function;)Ljava/util/function/Predicate;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Ljava/util/List;

    .line 37
    .line 38
    iput-object p1, p0, Lcom/android/launcher3/widget/F;->b:Ljava/util/List;

    .line 39
    .line 40
    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/widget/F$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/F;->g(Lcom/android/launcher3/widget/F$b;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/F;->h(Landroid/view/ViewGroup;I)Lcom/android/launcher3/widget/F$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
