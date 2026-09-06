.class public Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;
.super Lcom/android/launcher3/views/BaseDragLayer;
.source "SecondaryDragLayer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/views/BaseDragLayer<",
        "Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;",
        ">;"
    }
.end annotation


# instance fields
.field private g:Landroid/view/View;

.field private h:Lcom/android/launcher3/allapps/r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/allapps/r<",
            "Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;",
            ">;"
        }
    .end annotation
.end field

.field private i:Landroid/widget/GridView;

.field private j:LJ1/m;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/views/BaseDragLayer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->recreateControllers()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method static synthetic c(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic d(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic e(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic f(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic g(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic h(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public getPinnedAppsAdapter()LJ1/m;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->j:LJ1/m;

    .line 2
    .line 3
    return-object p0
.end method

.method i(Landroid/view/View;)Z
    .locals 7

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 8
    .line 9
    check-cast v0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->d0(Landroid/content/Context;)Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->clearFocus()V

    .line 18
    .line 19
    .line 20
    return v1

    .line 21
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/android/launcher3/util/r2;->h(Lcom/android/launcher3/model/data/y;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_2

    .line 32
    .line 33
    return v1

    .line 34
    :cond_2
    iget-object v2, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 35
    .line 36
    check-cast v2, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 37
    .line 38
    invoke-virtual {v2}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->getPopupDataProvider()Lcom/android/launcher3/popup/n;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    if-nez v2, :cond_3

    .line 43
    .line 44
    return v1

    .line 45
    :cond_3
    new-instance v3, Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .line 49
    .line 50
    sget-object v4, Lcom/android/launcher3/popup/P;->APP_INFO:Lcom/android/launcher3/popup/P$i;

    .line 51
    .line 52
    iget-object v5, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 53
    .line 54
    check-cast v5, Lcom/android/launcher3/views/k;

    .line 55
    .line 56
    invoke-interface {v4, v5, v0, p1}, Lcom/android/launcher3/popup/P$i;->a(Lcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    sget-object v4, Lf1/a;->a:Lf1/a$a;

    .line 64
    .line 65
    invoke-virtual {v4}, Lf1/a$a;->c()Z

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    if-eqz v5, :cond_4

    .line 70
    .line 71
    iget-object v5, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 72
    .line 73
    check-cast v5, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 74
    .line 75
    invoke-virtual {v5}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->h0()Z

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    if-nez v5, :cond_5

    .line 80
    .line 81
    :cond_4
    iget-object v5, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->j:LJ1/m;

    .line 82
    .line 83
    invoke-virtual {v5, v0, p1}, LJ1/m;->n(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    :cond_5
    invoke-virtual {v2, v0}, Lcom/android/launcher3/popup/n;->j(Lcom/android/launcher3/model/data/y;)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    iget-object v2, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 95
    .line 96
    check-cast v2, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 97
    .line 98
    invoke-virtual {v2}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    iget-object v5, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 103
    .line 104
    check-cast v5, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 105
    .line 106
    invoke-virtual {v5}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    const v6, 0x7f0e0194

    .line 111
    .line 112
    .line 113
    invoke-virtual {v2, v6, v5, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    check-cast v2, Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 118
    .line 119
    move-object v5, p1

    .line 120
    check-cast v5, Lcom/android/launcher3/BubbleTextView;

    .line 121
    .line 122
    invoke-virtual {v2, v5, v0, v3}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->i0(Landroid/view/View;ILjava/util/List;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->requestFocus()Z

    .line 126
    .line 127
    .line 128
    invoke-virtual {v4}, Lf1/a$a;->c()Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    const/4 v3, 0x1

    .line 133
    if-eqz v0, :cond_8

    .line 134
    .line 135
    iget-object v0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 136
    .line 137
    check-cast v0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 138
    .line 139
    invoke-virtual {v0}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->h0()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-nez v0, :cond_6

    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_6
    new-instance v0, Lcom/android/launcher3/dragndrop/p;

    .line 147
    .line 148
    invoke-direct {v0}, Lcom/android/launcher3/dragndrop/p;-><init>()V

    .line 149
    .line 150
    .line 151
    iget-object v4, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 152
    .line 153
    check-cast v4, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 154
    .line 155
    invoke-virtual {v4}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 156
    .line 157
    .line 158
    move-result-object v4

    .line 159
    iget v5, v4, Lcom/android/launcher3/h0;->J2:I

    .line 160
    .line 161
    int-to-float v5, v5

    .line 162
    iget v4, v4, Lcom/android/launcher3/h0;->B1:I

    .line 163
    .line 164
    int-to-float v4, v4

    .line 165
    div-float/2addr v5, v4

    .line 166
    iput v5, v0, Lcom/android/launcher3/dragndrop/p;->f:F

    .line 167
    .line 168
    invoke-virtual {v2, v1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->a0(Z)Lcom/android/launcher3/dragndrop/p$a;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    iput-object v1, v0, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 173
    .line 174
    if-nez v1, :cond_7

    .line 175
    .line 176
    new-instance v1, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$a;

    .line 177
    .line 178
    invoke-direct {v1, p0, p1, v0}, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$a;-><init>(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;Landroid/view/View;Lcom/android/launcher3/dragndrop/p;)V

    .line 179
    .line 180
    .line 181
    iput-object v1, v0, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 182
    .line 183
    :cond_7
    iget-object p0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 184
    .line 185
    move-object v1, p0

    .line 186
    check-cast v1, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 187
    .line 188
    check-cast p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 189
    .line 190
    invoke-virtual {p0}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    invoke-virtual {v1, p1, p0, v0}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->f0(Landroid/view/View;Lcom/android/launcher3/m0;Lcom/android/launcher3/dragndrop/p;)V

    .line 195
    .line 196
    .line 197
    :cond_8
    :goto_0
    return v3
.end method

.method protected onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->j:LJ1/m;

    .line 5
    .line 6
    invoke-virtual {p0}, LJ1/m;->o()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->j:LJ1/m;

    .line 5
    .line 6
    invoke-virtual {p0}, LJ1/m;->k()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b00b6

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->g:Landroid/view/View;

    .line 12
    .line 13
    const v0, 0x7f0b00e7

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/android/launcher3/allapps/r;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->h:Lcom/android/launcher3/allapps/r;

    .line 23
    .line 24
    const v0, 0x7f0b06b7

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Landroid/widget/GridView;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->i:Landroid/widget/GridView;

    .line 34
    .line 35
    new-instance v0, LJ1/m;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 38
    .line 39
    check-cast v1, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->h:Lcom/android/launcher3/allapps/r;

    .line 42
    .line 43
    invoke-virtual {v2}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    new-instance v3, Lcom/android/launcher3/secondarydisplay/a;

    .line 48
    .line 49
    invoke-direct {v3, p0}, Lcom/android/launcher3/secondarydisplay/a;-><init>(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;)V

    .line 50
    .line 51
    .line 52
    invoke-direct {v0, v1, v2, v3}, LJ1/m;-><init>(Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;Lcom/android/launcher3/allapps/D;Landroid/view/View$OnLongClickListener;)V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->j:LJ1/m;

    .line 56
    .line 57
    iget-object v1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->i:Landroid/widget/GridView;

    .line 58
    .line 59
    invoke-virtual {v1, v0}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->i:Landroid/widget/GridView;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 65
    .line 66
    check-cast p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    iget-object p0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 73
    .line 74
    iget p0, p0, Lcom/android/launcher3/F1;->H0:I

    .line 75
    .line 76
    invoke-virtual {v0, p0}, Landroid/widget/GridView;->setNumColumns(I)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method protected onMeasure(II)V
    .locals 13

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, v0, v1}, Landroid/widget/FrameLayout;->setMeasuredDimension(II)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 13
    .line 14
    check-cast v2, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 15
    .line 16
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    const/4 v4, 0x0

    .line 25
    :goto_0
    if-ge v4, v3, :cond_3

    .line 26
    .line 27
    invoke-virtual {p0, v4}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    iget-object v5, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->h:Lcom/android/launcher3/allapps/r;

    .line 32
    .line 33
    const/high16 v7, 0x40000000    # 2.0f

    .line 34
    .line 35
    if-ne v6, v5, :cond_0

    .line 36
    .line 37
    iget v5, v2, Lcom/android/launcher3/h0;->m1:I

    .line 38
    .line 39
    mul-int/lit8 v5, v5, 0x2

    .line 40
    .line 41
    iget-object v6, v2, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    .line 42
    .line 43
    iget v8, v6, Landroid/graphics/Rect;->left:I

    .line 44
    .line 45
    add-int/2addr v5, v8

    .line 46
    iget v8, v6, Landroid/graphics/Rect;->right:I

    .line 47
    .line 48
    add-int/2addr v5, v8

    .line 49
    iget v8, v6, Landroid/graphics/Rect;->top:I

    .line 50
    .line 51
    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    .line 52
    .line 53
    add-int/2addr v8, v6

    .line 54
    iget v6, v2, Lcom/android/launcher3/h0;->I2:I

    .line 55
    .line 56
    iget v9, v2, Lcom/android/launcher3/h0;->M2:I

    .line 57
    .line 58
    mul-int/2addr v6, v9

    .line 59
    add-int/2addr v6, v5

    .line 60
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    sub-int v5, v0, v5

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingRight()I

    .line 67
    .line 68
    .line 69
    move-result v9

    .line 70
    sub-int/2addr v5, v9

    .line 71
    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    iget v6, v2, Lcom/android/launcher3/h0;->H2:I

    .line 76
    .line 77
    iget v9, v2, Lcom/android/launcher3/h0;->M2:I

    .line 78
    .line 79
    mul-int/2addr v6, v9

    .line 80
    add-int/2addr v6, v8

    .line 81
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 82
    .line 83
    .line 84
    move-result v8

    .line 85
    sub-int v8, v1, v8

    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingBottom()I

    .line 88
    .line 89
    .line 90
    move-result v9

    .line 91
    sub-int/2addr v8, v9

    .line 92
    invoke-static {v8, v6}, Ljava/lang/Math;->min(II)I

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    iget-object v8, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->h:Lcom/android/launcher3/allapps/r;

    .line 97
    .line 98
    invoke-static {v5, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    invoke-static {v6, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 103
    .line 104
    .line 105
    move-result v6

    .line 106
    invoke-virtual {v8, v5, v6}, Landroid/widget/RelativeLayout;->measure(II)V

    .line 107
    .line 108
    .line 109
    :goto_1
    move-object v5, p0

    .line 110
    move v7, p1

    .line 111
    move v9, p2

    .line 112
    goto :goto_2

    .line 113
    :cond_0
    iget-object v5, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->g:Landroid/view/View;

    .line 114
    .line 115
    if-ne v6, v5, :cond_1

    .line 116
    .line 117
    iget v5, v2, Lcom/android/launcher3/h0;->B1:I

    .line 118
    .line 119
    invoke-static {v5, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    iget-object v6, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->g:Landroid/view/View;

    .line 124
    .line 125
    invoke-virtual {v6, v5, v5}, Landroid/view/View;->measure(II)V

    .line 126
    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_1
    iget-object v8, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->i:Landroid/widget/GridView;

    .line 130
    .line 131
    if-ne v6, v8, :cond_2

    .line 132
    .line 133
    iget v5, v2, Lcom/android/launcher3/h0;->B1:I

    .line 134
    .line 135
    iget v6, v2, Lcom/android/launcher3/h0;->r1:I

    .line 136
    .line 137
    add-int v12, v5, v6

    .line 138
    .line 139
    const/4 v10, 0x0

    .line 140
    move-object v7, p0

    .line 141
    move v9, p1

    .line 142
    move v11, p2

    .line 143
    invoke-virtual/range {v7 .. v12}, Landroid/widget/FrameLayout;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 144
    .line 145
    .line 146
    move-object v5, v7

    .line 147
    move v7, v9

    .line 148
    move v9, v11

    .line 149
    goto :goto_2

    .line 150
    :cond_2
    move-object v5, p0

    .line 151
    move v7, p1

    .line 152
    move v9, p2

    .line 153
    const/4 v8, 0x0

    .line 154
    const/4 v10, 0x0

    .line 155
    invoke-virtual/range {v5 .. v10}, Landroid/widget/FrameLayout;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 156
    .line 157
    .line 158
    :goto_2
    add-int/lit8 v4, v4, 0x1

    .line 159
    .line 160
    move-object p0, v5

    .line 161
    move p1, v7

    .line 162
    move p2, v9

    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :cond_3
    return-void
.end method

.method public recreateControllers()V
    .locals 4

    .line 1
    new-instance v0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$b;-><init>(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;LJ1/s;)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 8
    .line 9
    check-cast v1, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x2

    .line 16
    new-array v2, v2, [Lcom/android/launcher3/util/G2;

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    aput-object v0, v2, v3

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    aput-object v1, v2, v0

    .line 23
    .line 24
    iput-object v2, p0, Lcom/android/launcher3/views/BaseDragLayer;->mControllers:[Lcom/android/launcher3/util/G2;

    .line 25
    .line 26
    return-void
.end method
