.class public Lcom/android/launcher3/widget/p;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "ComponentDetailAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/p$a;,
        Lcom/android/launcher3/widget/p$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/android/launcher3/widget/p$b;",
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
            "Lcom/android/launcher3/widget/WidgetCellMfv;",
            ">;"
        }
    .end annotation
.end field

.field private final d:Landroid/view/View$OnClickListener;

.field private final e:Landroid/view/View$OnLongClickListener;

.field private f:Z

.field private g:Landroid/content/Context;

.field private h:I


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
    iput-object v0, p0, Lcom/android/launcher3/widget/p;->b:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/widget/p;->c:Ljava/util/List;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 19
    .line 20
    iput-object p2, p0, Lcom/android/launcher3/widget/p;->a:Landroid/view/LayoutInflater;

    .line 21
    .line 22
    iput-object p3, p0, Lcom/android/launcher3/widget/p;->d:Landroid/view/View$OnClickListener;

    .line 23
    .line 24
    iput-object p4, p0, Lcom/android/launcher3/widget/p;->e:Landroid/view/View$OnLongClickListener;

    .line 25
    .line 26
    return-void
.end method

.method private j()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/p;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_3

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/p;->b:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x0

    .line 17
    move v2, v1

    .line 18
    :goto_0
    if-ge v2, v0, :cond_2

    .line 19
    .line 20
    iget-object v3, p0, Lcom/android/launcher3/widget/p;->b:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    move-object v5, v3

    .line 27
    check-cast v5, Lz1/Z4;

    .line 28
    .line 29
    iget-boolean v3, p0, Lcom/android/launcher3/widget/p;->f:Z

    .line 30
    .line 31
    const/4 v4, 0x0

    .line 32
    if-eqz v3, :cond_1

    .line 33
    .line 34
    iget-object v3, p0, Lcom/android/launcher3/widget/p;->a:Landroid/view/LayoutInflater;

    .line 35
    .line 36
    const v6, 0x7f0e0087

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3, v6, v4, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    check-cast v3, Lcom/android/launcher3/widget/WidgetCellMfv;

    .line 44
    .line 45
    :goto_1
    move-object v4, v3

    .line 46
    goto :goto_2

    .line 47
    :cond_1
    iget-object v3, p0, Lcom/android/launcher3/widget/p;->a:Landroid/view/LayoutInflater;

    .line 48
    .line 49
    const v6, 0x7f0e023c

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3, v6, v4, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    check-cast v3, Lcom/android/launcher3/widget/WidgetCellMfv;

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :goto_2
    iget-object v3, v5, Lz1/Z4;->g:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v3}, Lx1/i0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v6

    .line 65
    const/4 v9, 0x1

    .line 66
    iget-boolean v10, p0, Lcom/android/launcher3/widget/p;->f:Z

    .line 67
    .line 68
    const/4 v7, 0x0

    .line 69
    const/4 v8, 0x0

    .line 70
    invoke-virtual/range {v4 .. v10}, Lcom/android/launcher3/widget/WidgetCellMfv;->F(Lz1/Z4;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;ZZ)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v4}, Lcom/android/launcher3/widget/WidgetCellMfv;->getWidgetItem()Lz1/Z4;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v4, v3}, Lcom/android/launcher3/widget/WidgetCellMfv;->g(Lz1/Z4;)V

    .line 78
    .line 79
    .line 80
    iget-object v3, p0, Lcom/android/launcher3/widget/p;->c:Ljava/util/List;

    .line 81
    .line 82
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    add-int/lit8 v2, v2, 0x1

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_2
    :goto_3
    return-void
.end method


# virtual methods
.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/p;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/widget/p;->c:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public g(Landroid/content/Context;)I
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/p;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const v1, 0x7f0701e7

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const v1, 0x7f0701ea

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    mul-int/lit8 v0, v0, 0x2

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const v2, 0x7f0701f2

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    sub-int/2addr v0, v1

    .line 42
    :goto_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    const v3, 0x7f0701ef

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    iget-boolean p0, p0, Lcom/android/launcher3/widget/p;->f:Z

    .line 64
    .line 65
    invoke-static {p1, p0}, Lx1/O;->W(Landroid/content/Context;Z)I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    mul-int/lit8 v2, v2, 0x2

    .line 70
    .line 71
    sub-int/2addr v1, v2

    .line 72
    mul-int/2addr v0, p0

    .line 73
    sub-int/2addr v1, v0

    .line 74
    mul-int/lit8 p0, p0, 0x2

    .line 75
    .line 76
    div-int/2addr v1, p0

    .line 77
    return v1
.end method

.method public getItemCount()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/p;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    iget p0, p0, Lcom/android/launcher3/widget/p;->h:I

    .line 9
    .line 10
    int-to-float p0, p0

    .line 11
    div-float/2addr v0, p0

    .line 12
    float-to-double v0, v0

    .line 13
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    double-to-int p0, v0

    .line 18
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

.method public h(Lcom/android/launcher3/widget/p$b;I)V
    .locals 10

    .line 1
    iget-object p1, p1, Lcom/android/launcher3/widget/p$b;->a:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->G0:Z

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    const/4 v1, -0x1

    .line 24
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 25
    .line 26
    iget-object v1, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const v2, 0x7f0701ef

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 40
    .line 41
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const v2, 0x7f0701f3

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 60
    .line 61
    iget-object v1, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 62
    .line 63
    invoke-static {v1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    iget v1, v1, Lcom/android/launcher3/h0;->T0:I

    .line 72
    .line 73
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 74
    .line 75
    sub-int/2addr v1, v2

    .line 76
    div-int/lit8 v1, v1, 0x2

    .line 77
    .line 78
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 79
    .line 80
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 81
    .line 82
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/android/launcher3/widget/p;->b:Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    iget-object v1, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 95
    .line 96
    iget-boolean v2, p0, Lcom/android/launcher3/widget/p;->f:Z

    .line 97
    .line 98
    invoke-static {v1, v2}, Lx1/O;->W(Landroid/content/Context;Z)I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    const/4 v2, 0x0

    .line 103
    move v3, v2

    .line 104
    :goto_1
    iget v4, p0, Lcom/android/launcher3/widget/p;->h:I

    .line 105
    .line 106
    if-ge v3, v4, :cond_9

    .line 107
    .line 108
    mul-int/2addr v4, p2

    .line 109
    add-int/2addr v4, v3

    .line 110
    if-ge v4, v0, :cond_7

    .line 111
    .line 112
    iget-object v5, p0, Lcom/android/launcher3/widget/p;->c:Ljava/util/List;

    .line 113
    .line 114
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    .line 115
    .line 116
    .line 117
    move-result v5

    .line 118
    if-eqz v5, :cond_1

    .line 119
    .line 120
    goto/16 :goto_7

    .line 121
    .line 122
    :cond_1
    iget-object v5, p0, Lcom/android/launcher3/widget/p;->c:Ljava/util/List;

    .line 123
    .line 124
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v4

    .line 128
    check-cast v4, Lcom/android/launcher3/widget/WidgetCellMfv;

    .line 129
    .line 130
    iget-object v5, p0, Lcom/android/launcher3/widget/p;->d:Landroid/view/View$OnClickListener;

    .line 131
    .line 132
    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 133
    .line 134
    .line 135
    iget-object v5, p0, Lcom/android/launcher3/widget/p;->e:Landroid/view/View$OnLongClickListener;

    .line 136
    .line 137
    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v4, v2}, Lcom/android/launcher3/widget/WidgetCell;->setAnimatePreview(Z)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 144
    .line 145
    .line 146
    move-result-object v5

    .line 147
    if-eqz v5, :cond_2

    .line 148
    .line 149
    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 150
    .line 151
    .line 152
    move-result-object v5

    .line 153
    instance-of v5, v5, Landroid/view/ViewGroup;

    .line 154
    .line 155
    if-eqz v5, :cond_2

    .line 156
    .line 157
    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 158
    .line 159
    .line 160
    move-result-object v5

    .line 161
    check-cast v5, Landroid/view/ViewGroup;

    .line 162
    .line 163
    invoke-virtual {v5, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 164
    .line 165
    .line 166
    :cond_2
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 170
    .line 171
    .line 172
    move-result-object v5

    .line 173
    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 174
    .line 175
    iget-object v6, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 176
    .line 177
    invoke-static {v6}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 178
    .line 179
    .line 180
    move-result-object v6

    .line 181
    invoke-virtual {v6}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 182
    .line 183
    .line 184
    move-result-object v6

    .line 185
    iget-boolean v6, v6, Lcom/android/launcher3/h0;->G0:Z

    .line 186
    .line 187
    if-eqz v6, :cond_4

    .line 188
    .line 189
    iget-object v6, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 190
    .line 191
    invoke-virtual {p0, v6}, Lcom/android/launcher3/widget/p;->g(Landroid/content/Context;)I

    .line 192
    .line 193
    .line 194
    move-result v6

    .line 195
    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 199
    .line 200
    .line 201
    iget-object v6, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 202
    .line 203
    invoke-static {v6}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 204
    .line 205
    .line 206
    move-result-object v6

    .line 207
    invoke-virtual {v6}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 208
    .line 209
    .line 210
    move-result-object v6

    .line 211
    iget-boolean v6, v6, Lcom/android/launcher3/h0;->N0:Z

    .line 212
    .line 213
    if-eqz v6, :cond_6

    .line 214
    .line 215
    iget-boolean v6, p0, Lcom/android/launcher3/widget/p;->f:Z

    .line 216
    .line 217
    if-eqz v6, :cond_6

    .line 218
    .line 219
    const/4 v6, 0x1

    .line 220
    if-le v1, v6, :cond_6

    .line 221
    .line 222
    iget-object v6, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 223
    .line 224
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 225
    .line 226
    .line 227
    move-result-object v6

    .line 228
    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 229
    .line 230
    .line 231
    move-result-object v6

    .line 232
    iget v6, v6, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 233
    .line 234
    iget-object v7, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 235
    .line 236
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 237
    .line 238
    .line 239
    move-result-object v7

    .line 240
    const v8, 0x7f0701f0

    .line 241
    .line 242
    .line 243
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 244
    .line 245
    .line 246
    move-result v7

    .line 247
    mul-int/lit8 v7, v7, 0x2

    .line 248
    .line 249
    sub-int/2addr v6, v7

    .line 250
    iget-object v7, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 251
    .line 252
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 253
    .line 254
    .line 255
    move-result-object v7

    .line 256
    const v9, 0x7f0701e7

    .line 257
    .line 258
    .line 259
    invoke-virtual {v7, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 260
    .line 261
    .line 262
    move-result v7

    .line 263
    mul-int/2addr v7, v1

    .line 264
    sub-int/2addr v6, v7

    .line 265
    add-int/lit8 v7, v1, -0x1

    .line 266
    .line 267
    div-int/2addr v6, v7

    .line 268
    if-nez v3, :cond_3

    .line 269
    .line 270
    iget-object v9, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 271
    .line 272
    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 273
    .line 274
    .line 275
    move-result-object v9

    .line 276
    invoke-virtual {v9, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 277
    .line 278
    .line 279
    move-result v9

    .line 280
    invoke-virtual {v5, v9}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 281
    .line 282
    .line 283
    goto :goto_2

    .line 284
    :cond_3
    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 285
    .line 286
    .line 287
    :goto_2
    invoke-virtual {v5, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 288
    .line 289
    .line 290
    if-gez v6, :cond_6

    .line 291
    .line 292
    iget-object v9, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 293
    .line 294
    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 295
    .line 296
    .line 297
    move-result-object v9

    .line 298
    invoke-virtual {v9, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 299
    .line 300
    .line 301
    move-result v8

    .line 302
    mul-int/lit8 v8, v8, 0x2

    .line 303
    .line 304
    mul-int/2addr v6, v7

    .line 305
    add-int/2addr v8, v6

    .line 306
    add-int/lit8 v6, v1, 0x1

    .line 307
    .line 308
    div-int/2addr v8, v6

    .line 309
    invoke-virtual {v5, v8}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 310
    .line 311
    .line 312
    goto :goto_5

    .line 313
    :cond_4
    if-eqz v3, :cond_6

    .line 314
    .line 315
    iget-boolean v6, p0, Lcom/android/launcher3/widget/p;->f:Z

    .line 316
    .line 317
    if-eqz v6, :cond_5

    .line 318
    .line 319
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 320
    .line 321
    .line 322
    move-result-object v6

    .line 323
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 324
    .line 325
    .line 326
    move-result-object v6

    .line 327
    const v7, 0x7f0702b9

    .line 328
    .line 329
    .line 330
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimension(I)F

    .line 331
    .line 332
    .line 333
    move-result v6

    .line 334
    :goto_3
    float-to-int v6, v6

    .line 335
    goto :goto_4

    .line 336
    :cond_5
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 337
    .line 338
    .line 339
    move-result-object v6

    .line 340
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 341
    .line 342
    .line 343
    move-result-object v6

    .line 344
    const v7, 0x7f0702b7

    .line 345
    .line 346
    .line 347
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimension(I)F

    .line 348
    .line 349
    .line 350
    move-result v6

    .line 351
    goto :goto_3

    .line 352
    :goto_4
    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 353
    .line 354
    :cond_6
    :goto_5
    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 355
    .line 356
    .line 357
    goto :goto_6

    .line 358
    :cond_7
    if-lt v4, v0, :cond_8

    .line 359
    .line 360
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 361
    .line 362
    .line 363
    move-result v4

    .line 364
    if-ge v3, v4, :cond_8

    .line 365
    .line 366
    sub-int/2addr v4, v3

    .line 367
    invoke-virtual {p1, v3, v4}, Landroid/view/ViewGroup;->removeViews(II)V

    .line 368
    .line 369
    .line 370
    :cond_8
    :goto_6
    add-int/lit8 v3, v3, 0x1

    .line 371
    .line 372
    goto/16 :goto_1

    .line 373
    .line 374
    :cond_9
    :goto_7
    return-void
.end method

.method public i(Landroid/view/ViewGroup;I)Lcom/android/launcher3/widget/p$b;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/p;->a:Landroid/view/LayoutInflater;

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
    new-instance p1, Lcom/android/launcher3/widget/p$b;

    .line 14
    .line 15
    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/p$b;-><init>(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    return-object p1
.end method

.method public k(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/p;->f()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/widget/p$a;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/android/launcher3/widget/p$a;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/widget/p;->b:Ljava/util/List;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    iput-boolean v1, p0, Lcom/android/launcher3/widget/p;->f:Z

    .line 13
    .line 14
    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Lcom/android/launcher3/widget/p;->j()V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 27
    .line 28
    iget-boolean v0, p0, Lcom/android/launcher3/widget/p;->f:Z

    .line 29
    .line 30
    invoke-static {p1, v0}, Lx1/O;->W(Landroid/content/Context;Z)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, p0, Lcom/android/launcher3/widget/p;->h:I

    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_0
    iget-boolean p1, p0, Lcom/android/launcher3/widget/p;->f:Z

    .line 38
    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 42
    .line 43
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 52
    .line 53
    if-eqz p1, :cond_1

    .line 54
    .line 55
    iget-object p1, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const v0, 0x7f0c0020

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    goto :goto_0

    .line 69
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    const v0, 0x7f0c001f

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    :goto_0
    iput p1, p0, Lcom/android/launcher3/widget/p;->h:I

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 86
    .line 87
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 96
    .line 97
    if-eqz p1, :cond_3

    .line 98
    .line 99
    iget-object p1, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 100
    .line 101
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    const v0, 0x7f0c0022

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    goto :goto_1

    .line 113
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 114
    .line 115
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    const v0, 0x7f0c0021

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    :goto_1
    iput p1, p0, Lcom/android/launcher3/widget/p;->h:I

    .line 127
    .line 128
    :goto_2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public l()Z
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/p;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/widget/p;->b:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x0

    .line 14
    move v3, v2

    .line 15
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    const/4 v5, 0x1

    .line 20
    if-eqz v4, :cond_4

    .line 21
    .line 22
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    check-cast v4, Lz1/Z4;

    .line 27
    .line 28
    iget-object v4, v4, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 29
    .line 30
    if-eqz v4, :cond_0

    .line 31
    .line 32
    iget v6, v4, Landroid/appwidget/AppWidgetProviderInfo;->resizeMode:I

    .line 33
    .line 34
    if-eqz v6, :cond_0

    .line 35
    .line 36
    and-int/lit8 v7, v6, 0x2

    .line 37
    .line 38
    if-eqz v7, :cond_1

    .line 39
    .line 40
    iget v7, v4, Lcom/android/launcher3/widget/U;->j:I

    .line 41
    .line 42
    iget v8, v0, Lcom/android/launcher3/F1;->G0:I

    .line 43
    .line 44
    if-ge v7, v8, :cond_1

    .line 45
    .line 46
    iget v8, v4, Lcom/android/launcher3/widget/U;->l:I

    .line 47
    .line 48
    if-le v8, v5, :cond_1

    .line 49
    .line 50
    if-ge v7, v8, :cond_1

    .line 51
    .line 52
    move v7, v5

    .line 53
    goto :goto_1

    .line 54
    :cond_1
    move v7, v2

    .line 55
    :goto_1
    and-int/lit8 v6, v6, 0x1

    .line 56
    .line 57
    if-eqz v6, :cond_2

    .line 58
    .line 59
    iget v6, v4, Lcom/android/launcher3/widget/U;->i:I

    .line 60
    .line 61
    iget v8, v0, Lcom/android/launcher3/F1;->G0:I

    .line 62
    .line 63
    if-ge v6, v8, :cond_2

    .line 64
    .line 65
    iget v4, v4, Lcom/android/launcher3/widget/U;->k:I

    .line 66
    .line 67
    if-le v4, v5, :cond_2

    .line 68
    .line 69
    if-ge v6, v4, :cond_2

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_2
    move v5, v2

    .line 73
    :goto_2
    if-nez v7, :cond_3

    .line 74
    .line 75
    if-eqz v5, :cond_0

    .line 76
    .line 77
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/widget/p;->b:Ljava/util/List;

    .line 81
    .line 82
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-ne v3, p0, :cond_5

    .line 87
    .line 88
    return v5

    .line 89
    :cond_5
    return v2
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/widget/p$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/p;->h(Lcom/android/launcher3/widget/p$b;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/p;->i(Landroid/view/ViewGroup;I)Lcom/android/launcher3/widget/p$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
