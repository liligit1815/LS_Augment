.class public Lcom/android/launcher3/widget/J;
.super Lcom/android/launcher3/widget/i;
.source "CustomViewHolder.java"


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/i;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b0181

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Landroid/view/ViewGroup;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v0, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    const/4 v0, -0x1

    .line 38
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const v1, 0x7f0701f3

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 59
    .line 60
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/widget/C;Lm2/g;Lcom/android/launcher3/widget/v;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p3, p0, Lcom/android/launcher3/widget/C;->d:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    invoke-virtual {p3}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p3}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    const v1, 0x7f0e0089

    .line 16
    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v0, v1, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    check-cast p3, Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 24
    .line 25
    iget-object v0, p1, Lm2/g;->c:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lz1/Z4;

    .line 32
    .line 33
    iget-object v1, p1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 36
    .line 37
    iget p2, p2, Lcom/android/launcher3/widget/v;->b:I

    .line 38
    .line 39
    invoke-virtual {p3, p1, v0, p2}, Lcom/android/launcher3/widget/ComponentDetailSheet;->i1(Lm2/g;Lz1/Z4;I)V

    .line 40
    .line 41
    .line 42
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const/4 p2, 0x1

    .line 47
    iget-object p0, p0, Lcom/android/launcher3/widget/C;->j:Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 48
    .line 49
    invoke-virtual {p3, v0, p1, p2, p0}, Lcom/android/launcher3/widget/ComponentDetailSheet;->g1(Lz1/Z4;Ljava/lang/String;ZLcom/android/launcher3/widget/o;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method private d()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const v1, 0x7f0701f3

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object p0, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iget p0, p0, Lcom/android/launcher3/h0;->T0:I

    .line 33
    .line 34
    sub-int/2addr p0, v0

    .line 35
    div-int/lit8 p0, p0, 0x2

    .line 36
    .line 37
    return p0
.end method

.method private e(Landroid/content/Context;)I
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f0701ea

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    mul-int/lit8 v0, v0, 0x2

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const v2, 0x7f0701f2

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    sub-int/2addr v0, v1

    .line 26
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    const v3, 0x7f0701ef

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    iget-object v3, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 48
    .line 49
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    const v4, 0x7f0701f0

    .line 58
    .line 59
    .line 60
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    float-to-int v3, v3

    .line 65
    const/4 v4, 0x0

    .line 66
    invoke-static {p1, v4}, Lx1/O;->W(Landroid/content/Context;Z)I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    iget-boolean v5, v5, Lcom/android/launcher3/h0;->N0:Z

    .line 79
    .line 80
    if-nez v5, :cond_0

    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    const v6, 0x7f0c0023

    .line 87
    .line 88
    .line 89
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getInteger(I)I

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    if-ge v4, v5, :cond_0

    .line 94
    .line 95
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p1, v6}, Landroid/content/res/Resources;->getInteger(I)I

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 104
    .line 105
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    const v5, 0x7f0701ee

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    mul-int/2addr v0, v4

    .line 121
    sub-int v5, v1, v0

    .line 122
    .line 123
    mul-int/lit8 v6, v2, 0x2

    .line 124
    .line 125
    sub-int/2addr v5, v6

    .line 126
    add-int/lit8 v6, v4, -0x1

    .line 127
    .line 128
    mul-int/2addr p1, v6

    .line 129
    if-ge v5, p1, :cond_1

    .line 130
    .line 131
    iget-object p0, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 132
    .line 133
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    const p1, 0x7f0701f1

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    :cond_1
    mul-int/lit8 v2, v2, 0x2

    .line 149
    .line 150
    sub-int/2addr v1, v2

    .line 151
    mul-int/lit8 v3, v3, 0x2

    .line 152
    .line 153
    sub-int/2addr v1, v3

    .line 154
    sub-int/2addr v1, v0

    .line 155
    mul-int/lit8 v4, v4, 0x2

    .line 156
    .line 157
    add-int/lit8 v4, v4, -0x2

    .line 158
    .line 159
    div-int/2addr v1, v4

    .line 160
    return v1
.end method


# virtual methods
.method public b(Lcom/android/launcher3/widget/v;Lcom/android/launcher3/widget/C;Z)V
    .locals 12
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    iget-object p3, p1, Lcom/android/launcher3/widget/v;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    instance-of v3, v2, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    if-eqz v3, :cond_3

    .line 23
    .line 24
    iget-object v3, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 25
    .line 26
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-static {v3}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    iget-boolean v3, v3, Lcom/android/launcher3/h0;->G0:Z

    .line 39
    .line 40
    if-eqz v3, :cond_2

    .line 41
    .line 42
    iget-object v3, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 43
    .line 44
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    const v5, 0x7f0701ef

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    move-object v5, v2

    .line 60
    check-cast v5, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 61
    .line 62
    iput v3, v5, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 63
    .line 64
    iput v3, v5, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 65
    .line 66
    iget-object v6, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 67
    .line 68
    invoke-virtual {v6}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    const v7, 0x7f0701ea

    .line 77
    .line 78
    .line 79
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 80
    .line 81
    .line 82
    move-result v6

    .line 83
    mul-int/lit8 v6, v6, 0x2

    .line 84
    .line 85
    iget-object v7, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 86
    .line 87
    invoke-virtual {v7}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 92
    .line 93
    .line 94
    move-result-object v7

    .line 95
    const v8, 0x7f0701f2

    .line 96
    .line 97
    .line 98
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 99
    .line 100
    .line 101
    move-result v7

    .line 102
    sub-int/2addr v6, v7

    .line 103
    iget-object v7, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 104
    .line 105
    invoke-virtual {v7}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 106
    .line 107
    .line 108
    move-result-object v7

    .line 109
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 110
    .line 111
    .line 112
    move-result-object v7

    .line 113
    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 114
    .line 115
    .line 116
    move-result-object v7

    .line 117
    iget v7, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 118
    .line 119
    iget-object v8, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 120
    .line 121
    invoke-virtual {v8}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 122
    .line 123
    .line 124
    move-result-object v8

    .line 125
    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 126
    .line 127
    .line 128
    move-result-object v8

    .line 129
    const v9, 0x7f0701ee

    .line 130
    .line 131
    .line 132
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 133
    .line 134
    .line 135
    move-result v8

    .line 136
    iget-object v9, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 137
    .line 138
    invoke-virtual {v9}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 139
    .line 140
    .line 141
    move-result-object v9

    .line 142
    invoke-static {v9, v4}, Lx1/O;->W(Landroid/content/Context;Z)I

    .line 143
    .line 144
    .line 145
    move-result v9

    .line 146
    iget-object v10, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 147
    .line 148
    invoke-virtual {v10}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 149
    .line 150
    .line 151
    move-result-object v10

    .line 152
    invoke-static {v10}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 153
    .line 154
    .line 155
    move-result-object v10

    .line 156
    invoke-virtual {v10}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 157
    .line 158
    .line 159
    move-result-object v10

    .line 160
    iget-boolean v10, v10, Lcom/android/launcher3/h0;->N0:Z

    .line 161
    .line 162
    if-nez v10, :cond_0

    .line 163
    .line 164
    iget-object v10, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 165
    .line 166
    invoke-virtual {v10}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 167
    .line 168
    .line 169
    move-result-object v10

    .line 170
    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 171
    .line 172
    .line 173
    move-result-object v10

    .line 174
    const v11, 0x7f0c0023

    .line 175
    .line 176
    .line 177
    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getInteger(I)I

    .line 178
    .line 179
    .line 180
    move-result v10

    .line 181
    if-ge v9, v10, :cond_0

    .line 182
    .line 183
    iget-object v9, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 184
    .line 185
    invoke-virtual {v9}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 186
    .line 187
    .line 188
    move-result-object v9

    .line 189
    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 190
    .line 191
    .line 192
    move-result-object v9

    .line 193
    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getInteger(I)I

    .line 194
    .line 195
    .line 196
    move-result v9

    .line 197
    :cond_0
    mul-int/2addr v6, v9

    .line 198
    sub-int/2addr v7, v6

    .line 199
    mul-int/lit8 v3, v3, 0x2

    .line 200
    .line 201
    sub-int/2addr v7, v3

    .line 202
    add-int/lit8 v9, v9, -0x1

    .line 203
    .line 204
    mul-int/2addr v8, v9

    .line 205
    if-ge v7, v8, :cond_1

    .line 206
    .line 207
    iget-object v3, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 208
    .line 209
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 210
    .line 211
    .line 212
    move-result-object v3

    .line 213
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    const v6, 0x7f0701f1

    .line 218
    .line 219
    .line 220
    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 221
    .line 222
    .line 223
    move-result v3

    .line 224
    iput v3, v5, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 225
    .line 226
    iput v3, v5, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 227
    .line 228
    :cond_1
    iget-object v3, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 229
    .line 230
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 231
    .line 232
    .line 233
    move-result-object v3

    .line 234
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    const v6, 0x7f0701ed

    .line 239
    .line 240
    .line 241
    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 242
    .line 243
    .line 244
    move-result v3

    .line 245
    iput v3, v5, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 246
    .line 247
    goto :goto_0

    .line 248
    :cond_2
    move-object v3, v2

    .line 249
    check-cast v3, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 250
    .line 251
    invoke-direct {p0}, Lcom/android/launcher3/widget/J;->d()I

    .line 252
    .line 253
    .line 254
    move-result v5

    .line 255
    iput v5, v3, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 256
    .line 257
    :cond_3
    :goto_0
    iget-object v3, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 258
    .line 259
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 260
    .line 261
    .line 262
    if-le v0, v1, :cond_4

    .line 263
    .line 264
    move v1, v4

    .line 265
    :goto_1
    if-ge v1, v0, :cond_5

    .line 266
    .line 267
    iget-object v2, p2, Lcom/android/launcher3/widget/C;->a:Landroid/view/LayoutInflater;

    .line 268
    .line 269
    const v3, 0x7f0e0086

    .line 270
    .line 271
    .line 272
    iget-object v5, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 273
    .line 274
    invoke-virtual {v2, v3, v5, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 275
    .line 276
    .line 277
    move-result-object v2

    .line 278
    check-cast v2, Lcom/android/launcher3/widget/WidgetCellMfv;

    .line 279
    .line 280
    iget-object v3, p2, Lcom/android/launcher3/widget/C;->f:Landroid/view/View$OnLongClickListener;

    .line 281
    .line 282
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 283
    .line 284
    .line 285
    iget-object v3, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 286
    .line 287
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 288
    .line 289
    .line 290
    add-int/lit8 v1, v1, 0x1

    .line 291
    .line 292
    goto :goto_1

    .line 293
    :cond_4
    if-ge v0, v1, :cond_5

    .line 294
    .line 295
    :goto_2
    if-ge v0, v1, :cond_5

    .line 296
    .line 297
    iget-object v2, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 298
    .line 299
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 300
    .line 301
    .line 302
    move-result-object v2

    .line 303
    const/16 v3, 0x8

    .line 304
    .line 305
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 306
    .line 307
    .line 308
    add-int/lit8 v0, v0, 0x1

    .line 309
    .line 310
    goto :goto_2

    .line 311
    :cond_5
    move v0, v4

    .line 312
    :goto_3
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 313
    .line 314
    .line 315
    move-result v1

    .line 316
    if-ge v0, v1, :cond_e

    .line 317
    .line 318
    iget-object v1, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 319
    .line 320
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 321
    .line 322
    .line 323
    move-result-object v1

    .line 324
    check-cast v1, Lcom/android/launcher3/widget/WidgetCellMfv;

    .line 325
    .line 326
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 327
    .line 328
    .line 329
    move-result-object v2

    .line 330
    check-cast v2, Lm2/g;

    .line 331
    .line 332
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 333
    .line 334
    .line 335
    move-result-object v3

    .line 336
    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 337
    .line 338
    iget-object v5, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 339
    .line 340
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 341
    .line 342
    .line 343
    move-result-object v5

    .line 344
    invoke-static {v5}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 345
    .line 346
    .line 347
    move-result-object v5

    .line 348
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 349
    .line 350
    .line 351
    move-result-object v5

    .line 352
    iget-boolean v5, v5, Lcom/android/launcher3/h0;->G0:Z

    .line 353
    .line 354
    if-eqz v5, :cond_7

    .line 355
    .line 356
    iget-object v5, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 357
    .line 358
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 359
    .line 360
    .line 361
    move-result-object v5

    .line 362
    invoke-direct {p0, v5}, Lcom/android/launcher3/widget/J;->e(Landroid/content/Context;)I

    .line 363
    .line 364
    .line 365
    move-result v5

    .line 366
    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 367
    .line 368
    .line 369
    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 370
    .line 371
    .line 372
    const v5, 0x7f0701f0

    .line 373
    .line 374
    .line 375
    if-nez v0, :cond_6

    .line 376
    .line 377
    iget-object v6, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 378
    .line 379
    invoke-virtual {v6}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 380
    .line 381
    .line 382
    move-result-object v6

    .line 383
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 384
    .line 385
    .line 386
    move-result-object v6

    .line 387
    invoke-virtual {v6, v5}, Landroid/content/res/Resources;->getDimension(I)F

    .line 388
    .line 389
    .line 390
    move-result v5

    .line 391
    float-to-int v5, v5

    .line 392
    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 393
    .line 394
    .line 395
    goto :goto_4

    .line 396
    :cond_6
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 397
    .line 398
    .line 399
    move-result v6

    .line 400
    add-int/lit8 v6, v6, -0x1

    .line 401
    .line 402
    if-ne v0, v6, :cond_8

    .line 403
    .line 404
    iget-object v6, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 405
    .line 406
    invoke-virtual {v6}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 407
    .line 408
    .line 409
    move-result-object v6

    .line 410
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 411
    .line 412
    .line 413
    move-result-object v6

    .line 414
    invoke-virtual {v6, v5}, Landroid/content/res/Resources;->getDimension(I)F

    .line 415
    .line 416
    .line 417
    move-result v5

    .line 418
    float-to-int v5, v5

    .line 419
    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 420
    .line 421
    .line 422
    goto :goto_4

    .line 423
    :cond_7
    if-eqz v0, :cond_8

    .line 424
    .line 425
    iget-object v5, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 426
    .line 427
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 428
    .line 429
    .line 430
    move-result-object v5

    .line 431
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 432
    .line 433
    .line 434
    move-result-object v5

    .line 435
    const v6, 0x7f0702b7

    .line 436
    .line 437
    .line 438
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimension(I)F

    .line 439
    .line 440
    .line 441
    move-result v5

    .line 442
    float-to-int v5, v5

    .line 443
    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 444
    .line 445
    .line 446
    :cond_8
    :goto_4
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 447
    .line 448
    .line 449
    invoke-virtual {v2}, Lm2/g;->f()I

    .line 450
    .line 451
    .line 452
    move-result v3

    .line 453
    iget-object v5, v2, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 454
    .line 455
    iget-object v5, v5, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 456
    .line 457
    invoke-static {v5}, Lf1/d;->j(Ljava/lang/String;)Z

    .line 458
    .line 459
    .line 460
    move-result v5

    .line 461
    if-eqz v5, :cond_a

    .line 462
    .line 463
    instance-of v5, v2, Lm2/o;

    .line 464
    .line 465
    if-eqz v5, :cond_9

    .line 466
    .line 467
    move-object v5, v2

    .line 468
    check-cast v5, Lm2/o;

    .line 469
    .line 470
    invoke-virtual {v5}, Lm2/o;->t()Z

    .line 471
    .line 472
    .line 473
    move-result v5

    .line 474
    if-nez v5, :cond_a

    .line 475
    .line 476
    :cond_9
    iget-object v3, v2, Lm2/g;->c:Ljava/util/List;

    .line 477
    .line 478
    invoke-interface {v3}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 479
    .line 480
    .line 481
    move-result-object v3

    .line 482
    new-instance v5, Lcom/android/launcher3/widget/E;

    .line 483
    .line 484
    invoke-direct {v5}, Lcom/android/launcher3/widget/E;-><init>()V

    .line 485
    .line 486
    .line 487
    invoke-static {v5}, Lx1/O;->E(Ljava/util/function/Function;)Ljava/util/function/Predicate;

    .line 488
    .line 489
    .line 490
    move-result-object v5

    .line 491
    invoke-interface {v3, v5}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 492
    .line 493
    .line 494
    move-result-object v3

    .line 495
    invoke-interface {v3}, Ljava/util/stream/Stream;->count()J

    .line 496
    .line 497
    .line 498
    move-result-wide v5

    .line 499
    long-to-int v3, v5

    .line 500
    :cond_a
    invoke-virtual {v2}, Lm2/g;->e()Lz1/Z4;

    .line 501
    .line 502
    .line 503
    move-result-object v5

    .line 504
    iget-object v6, v2, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 505
    .line 506
    iget-object v6, v6, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 507
    .line 508
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 509
    .line 510
    .line 511
    move-result-object v6

    .line 512
    iget-object v7, p2, Lcom/android/launcher3/widget/C;->g:Landroid/graphics/drawable/Drawable;

    .line 513
    .line 514
    invoke-virtual {v1, v5, v6, v3, v7}, Lcom/android/launcher3/widget/WidgetCellMfv;->E(Lz1/Z4;Ljava/lang/String;ILandroid/graphics/drawable/Drawable;)V

    .line 515
    .line 516
    .line 517
    iget-object v5, v2, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 518
    .line 519
    iget-object v5, v5, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 520
    .line 521
    invoke-static {v5}, Lf1/d;->j(Ljava/lang/String;)Z

    .line 522
    .line 523
    .line 524
    move-result v5

    .line 525
    if-eqz v5, :cond_c

    .line 526
    .line 527
    instance-of v5, v2, Lm2/o;

    .line 528
    .line 529
    if-eqz v5, :cond_b

    .line 530
    .line 531
    move-object v5, v2

    .line 532
    check-cast v5, Lm2/o;

    .line 533
    .line 534
    invoke-virtual {v5}, Lm2/o;->t()Z

    .line 535
    .line 536
    .line 537
    move-result v5

    .line 538
    if-nez v5, :cond_c

    .line 539
    .line 540
    :cond_b
    iget-object v5, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 541
    .line 542
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 543
    .line 544
    .line 545
    move-result-object v5

    .line 546
    const v6, 0x7f080a4c

    .line 547
    .line 548
    .line 549
    invoke-static {v5, v6}, Lz/a;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 550
    .line 551
    .line 552
    move-result-object v5

    .line 553
    invoke-virtual {v1, v5}, Lcom/android/launcher3/widget/WidgetCellMfv;->C(Landroid/graphics/drawable/Drawable;)V

    .line 554
    .line 555
    .line 556
    const v5, 0x7f0b068d

    .line 557
    .line 558
    .line 559
    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 560
    .line 561
    .line 562
    move-result-object v5

    .line 563
    check-cast v5, Lcom/android/launcher3/widget/WidgetImageViewMfv;

    .line 564
    .line 565
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 566
    .line 567
    .line 568
    move-result-object v6

    .line 569
    const v7, 0x7f060068

    .line 570
    .line 571
    .line 572
    invoke-virtual {v6, v7}, Landroid/content/Context;->getColor(I)I

    .line 573
    .line 574
    .line 575
    move-result v6

    .line 576
    invoke-virtual {v5, v6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 577
    .line 578
    .line 579
    goto :goto_5

    .line 580
    :cond_c
    invoke-virtual {v1}, Lcom/android/launcher3/widget/WidgetCellMfv;->getWidgetItem()Lz1/Z4;

    .line 581
    .line 582
    .line 583
    move-result-object v5

    .line 584
    invoke-virtual {v1, v5}, Lcom/android/launcher3/widget/WidgetCellMfv;->g(Lz1/Z4;)V

    .line 585
    .line 586
    .line 587
    :goto_5
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 588
    .line 589
    .line 590
    move-result-object v3

    .line 591
    iget-object v5, v2, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 592
    .line 593
    iget-object v5, v5, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 594
    .line 595
    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 596
    .line 597
    .line 598
    move-result-object v5

    .line 599
    invoke-virtual {v1, v3, v5}, Lcom/android/launcher3/widget/WidgetCellMfv;->I(Ljava/lang/String;Ljava/lang/String;)V

    .line 600
    .line 601
    .line 602
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 603
    .line 604
    .line 605
    instance-of v3, v2, Lm2/o;

    .line 606
    .line 607
    if-eqz v3, :cond_d

    .line 608
    .line 609
    move-object v3, v2

    .line 610
    check-cast v3, Lm2/o;

    .line 611
    .line 612
    invoke-virtual {v3}, Lm2/o;->t()Z

    .line 613
    .line 614
    .line 615
    move-result v3

    .line 616
    if-eqz v3, :cond_d

    .line 617
    .line 618
    new-instance v3, Lcom/android/launcher3/widget/I;

    .line 619
    .line 620
    invoke-direct {v3, p2, v2, p1}, Lcom/android/launcher3/widget/I;-><init>(Lcom/android/launcher3/widget/C;Lm2/g;Lcom/android/launcher3/widget/v;)V

    .line 621
    .line 622
    .line 623
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 624
    .line 625
    .line 626
    goto :goto_6

    .line 627
    :cond_d
    iget-object v2, p2, Lcom/android/launcher3/widget/C;->e:Landroid/view/View$OnClickListener;

    .line 628
    .line 629
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 630
    .line 631
    .line 632
    :goto_6
    add-int/lit8 v0, v0, 0x1

    .line 633
    .line 634
    goto/16 :goto_3

    .line 635
    .line 636
    :cond_e
    return-void
.end method
