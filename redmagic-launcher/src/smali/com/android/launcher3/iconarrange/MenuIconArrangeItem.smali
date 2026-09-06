.class public Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;
.super Landroid/widget/FrameLayout;
.source "MenuIconArrangeItem.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "AppCompatCustomView"
    }
.end annotation


# instance fields
.field private g:Ljava/lang/String;

.field private h:Lcom/android/launcher3/C2;

.field private i:I

.field public j:I

.field public k:I

.field private l:I

.field private m:I

.field private n:I

.field private o:I

.field private p:I

.field private q:I

.field private r:I

.field private s:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    const-string p2, "MenuIconArrangeItem"

    iput-object p2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->g:Ljava/lang/String;

    .line 4
    check-cast p1, Lcom/android/launcher3/C2;

    iput-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->a()V

    return-void
.end method

.method private b()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    .line 16
    .line 17
    const v0, 0x7f0b03aa

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    instance-of v0, p0, Ljava/lang/Boolean;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    check-cast p0, Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return p0
.end method


# virtual methods
.method public a()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 8
    .line 9
    iget v0, v0, Lcom/android/launcher3/F1;->H0:I

    .line 10
    .line 11
    iput v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->j:I

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 20
    .line 21
    iget v0, v0, Lcom/android/launcher3/F1;->G0:I

    .line 22
    .line 23
    iput v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->k:I

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/android/launcher3/X3;->u()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Lcom/android/launcher3/X3;->t()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->j:I

    .line 46
    .line 47
    iget-object v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 48
    .line 49
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    iget v3, v3, Lcom/android/launcher3/X3;->x:I

    .line 54
    .line 55
    mul-int/2addr v2, v3

    .line 56
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->k:I

    .line 57
    .line 58
    iget-object v4, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 59
    .line 60
    invoke-virtual {v4}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    iget v4, v4, Lcom/android/launcher3/X3;->y:I

    .line 65
    .line 66
    mul-int/2addr v3, v4

    .line 67
    iget-object v4, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 68
    .line 69
    invoke-virtual {v4}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    const v5, 0x7f0704ab

    .line 74
    .line 75
    .line 76
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    mul-int/lit8 v4, v4, 0x2

    .line 81
    .line 82
    sub-int v5, v0, v4

    .line 83
    .line 84
    int-to-float v5, v5

    .line 85
    int-to-float v2, v2

    .line 86
    div-float/2addr v5, v2

    .line 87
    sub-int v4, v1, v4

    .line 88
    .line 89
    int-to-float v4, v4

    .line 90
    int-to-float v3, v3

    .line 91
    div-float/2addr v4, v3

    .line 92
    cmpg-float v6, v5, v4

    .line 93
    .line 94
    if-gez v6, :cond_0

    .line 95
    .line 96
    iput v5, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_0
    iput v4, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 100
    .line 101
    :goto_0
    iget v4, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 102
    .line 103
    mul-float/2addr v2, v4

    .line 104
    float-to-int v2, v2

    .line 105
    sub-int v2, v0, v2

    .line 106
    .line 107
    div-int/lit8 v2, v2, 0x2

    .line 108
    .line 109
    iput v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->l:I

    .line 110
    .line 111
    mul-float/2addr v4, v3

    .line 112
    float-to-int v3, v4

    .line 113
    sub-int v3, v1, v3

    .line 114
    .line 115
    div-int/lit8 v3, v3, 0x2

    .line 116
    .line 117
    iput v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->m:I

    .line 118
    .line 119
    mul-int/lit8 v2, v2, 0x2

    .line 120
    .line 121
    sub-int/2addr v0, v2

    .line 122
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->j:I

    .line 123
    .line 124
    div-int/2addr v0, v2

    .line 125
    iput v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->n:I

    .line 126
    .line 127
    mul-int/lit8 v3, v3, 0x2

    .line 128
    .line 129
    sub-int/2addr v1, v3

    .line 130
    iget v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->k:I

    .line 131
    .line 132
    div-int/2addr v1, v0

    .line 133
    iput v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->o:I

    .line 134
    .line 135
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 136
    .line 137
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    iget v0, v0, Lcom/android/launcher3/h0;->B1:I

    .line 142
    .line 143
    iput v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->p:I

    .line 144
    .line 145
    iget v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->n:I

    .line 146
    .line 147
    int-to-float v0, v0

    .line 148
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 149
    .line 150
    mul-float/2addr v0, v2

    .line 151
    float-to-int v0, v0

    .line 152
    sub-int/2addr v1, v0

    .line 153
    div-int/lit8 v1, v1, 0x2

    .line 154
    .line 155
    iput v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->q:I

    .line 156
    .line 157
    const/4 v0, 0x0

    .line 158
    iput v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->r:I

    .line 159
    .line 160
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->i:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    int-to-long v0, v0

    .line 24
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->l:I

    .line 25
    .line 26
    int-to-float v2, v2

    .line 27
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->m:I

    .line 28
    .line 29
    int-to-float v3, v3

    .line 30
    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2}, Lcom/android/launcher3/D3;->f0()Lz1/y0;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iget-object v2, v2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 44
    .line 45
    invoke-virtual {v2}, Lcom/android/launcher3/util/A0;->m()Lcom/android/launcher3/util/A0;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v2}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-eqz v3, :cond_13

    .line 58
    .line 59
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 64
    .line 65
    iget v4, v3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 66
    .line 67
    int-to-long v5, v4

    .line 68
    cmp-long v5, v5, v0

    .line 69
    .line 70
    if-nez v5, :cond_1

    .line 71
    .line 72
    iget v5, v3, Lcom/android/launcher3/model/data/y;->container:I

    .line 73
    .line 74
    const/16 v6, -0x65

    .line 75
    .line 76
    if-eq v5, v6, :cond_1

    .line 77
    .line 78
    if-lez v5, :cond_2

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    iget-object v5, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 82
    .line 83
    const/16 v6, -0x64

    .line 84
    .line 85
    invoke-virtual {v5, v6, v4}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    if-nez v4, :cond_3

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_3
    iget v5, v3, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 93
    .line 94
    iget v6, v3, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 95
    .line 96
    invoke-virtual {v4, v5, v6}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 101
    .line 102
    .line 103
    iget v5, v3, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 104
    .line 105
    iget v6, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->n:I

    .line 106
    .line 107
    mul-int/2addr v5, v6

    .line 108
    iget v6, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->q:I

    .line 109
    .line 110
    add-int/2addr v5, v6

    .line 111
    int-to-float v5, v5

    .line 112
    iget v6, v3, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 113
    .line 114
    iget v7, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->o:I

    .line 115
    .line 116
    mul-int/2addr v6, v7

    .line 117
    iget v7, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->r:I

    .line 118
    .line 119
    add-int/2addr v6, v7

    .line 120
    int-to-float v6, v6

    .line 121
    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 122
    .line 123
    .line 124
    const/4 v5, 0x4

    .line 125
    const/4 v6, 0x0

    .line 126
    if-eqz v4, :cond_11

    .line 127
    .line 128
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    .line 129
    .line 130
    .line 131
    move-result v7

    .line 132
    if-ne v7, v5, :cond_4

    .line 133
    .line 134
    goto/16 :goto_5

    .line 135
    .line 136
    :cond_4
    iget-object v7, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 137
    .line 138
    invoke-virtual {v7}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 139
    .line 140
    .line 141
    move-result-object v7

    .line 142
    instance-of v8, v4, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 143
    .line 144
    const/4 v9, 0x1

    .line 145
    if-eqz v8, :cond_7

    .line 146
    .line 147
    check-cast v4, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 148
    .line 149
    iget-object v3, v4, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 150
    .line 151
    if-eqz v3, :cond_6

    .line 152
    .line 153
    iget v5, v3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 154
    .line 155
    if-gt v5, v9, :cond_5

    .line 156
    .line 157
    iget v3, v3, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 158
    .line 159
    if-le v3, v9, :cond_6

    .line 160
    .line 161
    :cond_5
    new-instance v3, Landroid/graphics/Rect;

    .line 162
    .line 163
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 164
    .line 165
    .line 166
    move-result v5

    .line 167
    iget v8, v7, Lcom/android/launcher3/X3;->r0:I

    .line 168
    .line 169
    mul-int/lit8 v8, v8, 0x2

    .line 170
    .line 171
    sub-int/2addr v5, v8

    .line 172
    iget v8, v7, Lcom/android/launcher3/X3;->q0:I

    .line 173
    .line 174
    mul-int/lit8 v8, v8, 0x2

    .line 175
    .line 176
    sub-int/2addr v5, v8

    .line 177
    iget v8, v7, Lcom/android/launcher3/X3;->r:I

    .line 178
    .line 179
    mul-int/lit8 v8, v8, 0x2

    .line 180
    .line 181
    add-int/2addr v5, v8

    .line 182
    int-to-float v5, v5

    .line 183
    iget v8, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 184
    .line 185
    mul-float/2addr v5, v8

    .line 186
    float-to-int v5, v5

    .line 187
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 188
    .line 189
    .line 190
    move-result v8

    .line 191
    iget v9, v7, Lcom/android/launcher3/X3;->s0:I

    .line 192
    .line 193
    sub-int/2addr v8, v9

    .line 194
    iget v9, v7, Lcom/android/launcher3/X3;->t0:I

    .line 195
    .line 196
    sub-int/2addr v8, v9

    .line 197
    iget v9, v7, Lcom/android/launcher3/X3;->r:I

    .line 198
    .line 199
    mul-int/lit8 v9, v9, 0x2

    .line 200
    .line 201
    add-int/2addr v8, v9

    .line 202
    int-to-float v8, v8

    .line 203
    iget v9, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 204
    .line 205
    mul-float/2addr v8, v9

    .line 206
    float-to-int v8, v8

    .line 207
    invoke-direct {v3, v6, v6, v5, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 211
    .line 212
    .line 213
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 214
    .line 215
    invoke-virtual {p1, v3, v3}, Landroid/graphics/Canvas;->scale(FF)V

    .line 216
    .line 217
    .line 218
    iget v3, v7, Lcom/android/launcher3/X3;->r0:I

    .line 219
    .line 220
    neg-int v3, v3

    .line 221
    iget v5, v7, Lcom/android/launcher3/X3;->q0:I

    .line 222
    .line 223
    sub-int/2addr v3, v5

    .line 224
    iget v5, v7, Lcom/android/launcher3/X3;->r:I

    .line 225
    .line 226
    add-int/2addr v3, v5

    .line 227
    int-to-float v3, v3

    .line 228
    iget v6, v7, Lcom/android/launcher3/X3;->s0:I

    .line 229
    .line 230
    neg-int v6, v6

    .line 231
    add-int/2addr v6, v5

    .line 232
    int-to-float v5, v6

    .line 233
    invoke-virtual {p1, v3, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 234
    .line 235
    .line 236
    goto :goto_1

    .line 237
    :cond_6
    new-instance v3, Landroid/graphics/Rect;

    .line 238
    .line 239
    iget v5, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->p:I

    .line 240
    .line 241
    int-to-float v8, v5

    .line 242
    iget v9, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 243
    .line 244
    mul-float/2addr v8, v9

    .line 245
    float-to-int v8, v8

    .line 246
    int-to-float v5, v5

    .line 247
    mul-float/2addr v5, v9

    .line 248
    float-to-int v5, v5

    .line 249
    invoke-direct {v3, v6, v6, v8, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 253
    .line 254
    .line 255
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 256
    .line 257
    invoke-virtual {p1, v3, v3}, Landroid/graphics/Canvas;->scale(FF)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 261
    .line 262
    .line 263
    move-result v3

    .line 264
    iget-object v5, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 265
    .line 266
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 267
    .line 268
    .line 269
    move-result-object v5

    .line 270
    iget v5, v5, Lcom/android/launcher3/h0;->B1:I

    .line 271
    .line 272
    sub-int/2addr v3, v5

    .line 273
    int-to-float v3, v3

    .line 274
    const/high16 v5, 0x40000000    # 2.0f

    .line 275
    .line 276
    div-float/2addr v3, v5

    .line 277
    neg-float v3, v3

    .line 278
    iget v5, v7, Lcom/android/launcher3/X3;->s0:I

    .line 279
    .line 280
    neg-int v5, v5

    .line 281
    iget v6, v7, Lcom/android/launcher3/X3;->r:I

    .line 282
    .line 283
    add-int/2addr v5, v6

    .line 284
    int-to-float v5, v5

    .line 285
    invoke-virtual {p1, v3, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 286
    .line 287
    .line 288
    :goto_1
    invoke-virtual {v4, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 289
    .line 290
    .line 291
    goto/16 :goto_4

    .line 292
    .line 293
    :cond_7
    instance-of v7, v4, Lcom/android/launcher3/folder/FolderIcon;

    .line 294
    .line 295
    if-eqz v7, :cond_9

    .line 296
    .line 297
    check-cast v4, Lcom/android/launcher3/folder/FolderIcon;

    .line 298
    .line 299
    new-instance v3, Landroid/graphics/Rect;

    .line 300
    .line 301
    iget v5, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->p:I

    .line 302
    .line 303
    int-to-float v7, v5

    .line 304
    iget v8, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 305
    .line 306
    mul-float/2addr v7, v8

    .line 307
    iget v10, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->r:I

    .line 308
    .line 309
    int-to-float v10, v10

    .line 310
    add-float/2addr v7, v10

    .line 311
    float-to-int v7, v7

    .line 312
    int-to-float v5, v5

    .line 313
    mul-float/2addr v5, v8

    .line 314
    float-to-int v5, v5

    .line 315
    invoke-direct {v3, v6, v6, v7, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 319
    .line 320
    .line 321
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 322
    .line 323
    invoke-virtual {p1, v3, v3}, Landroid/graphics/Canvas;->scale(FF)V

    .line 324
    .line 325
    .line 326
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 327
    .line 328
    .line 329
    move-result v3

    .line 330
    iget-object v5, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 331
    .line 332
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 333
    .line 334
    .line 335
    move-result-object v5

    .line 336
    iget v5, v5, Lcom/android/launcher3/h0;->B1:I

    .line 337
    .line 338
    sub-int/2addr v3, v5

    .line 339
    div-int/lit8 v3, v3, 0x2

    .line 340
    .line 341
    neg-int v3, v3

    .line 342
    int-to-float v3, v3

    .line 343
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 344
    .line 345
    .line 346
    move-result v5

    .line 347
    neg-int v5, v5

    .line 348
    int-to-float v5, v5

    .line 349
    invoke-virtual {p1, v3, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 350
    .line 351
    .line 352
    invoke-static {}, Lm1/a;->a()Z

    .line 353
    .line 354
    .line 355
    move-result v3

    .line 356
    if-eqz v3, :cond_8

    .line 357
    .line 358
    invoke-virtual {v4, v6}, Lcom/android/launcher3/folder/FolderIcon;->setNeedShowClipBoard(Z)V

    .line 359
    .line 360
    .line 361
    invoke-virtual {v4, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 362
    .line 363
    .line 364
    invoke-virtual {v4, v9}, Lcom/android/launcher3/folder/FolderIcon;->setNeedShowClipBoard(Z)V

    .line 365
    .line 366
    .line 367
    goto/16 :goto_4

    .line 368
    .line 369
    :cond_8
    invoke-virtual {v4, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 370
    .line 371
    .line 372
    goto/16 :goto_4

    .line 373
    .line 374
    :cond_9
    instance-of v7, v4, Lcom/android/launcher3/widget/T;

    .line 375
    .line 376
    if-eqz v7, :cond_f

    .line 377
    .line 378
    iget-object v7, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 379
    .line 380
    invoke-virtual {v7}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 381
    .line 382
    .line 383
    move-result-object v7

    .line 384
    iget-object v7, v7, Lcom/android/launcher3/X3;->z0:Landroid/graphics/PointF;

    .line 385
    .line 386
    iget v7, v7, Landroid/graphics/PointF;->x:F

    .line 387
    .line 388
    iget-object v8, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 389
    .line 390
    invoke-virtual {v8}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 391
    .line 392
    .line 393
    move-result-object v8

    .line 394
    invoke-virtual {v8}, Lcom/android/launcher3/h0;->T0()Z

    .line 395
    .line 396
    .line 397
    move-result v8

    .line 398
    if-eqz v8, :cond_a

    .line 399
    .line 400
    iget v8, v3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 401
    .line 402
    iget v9, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->n:I

    .line 403
    .line 404
    mul-int/2addr v8, v9

    .line 405
    int-to-float v8, v8

    .line 406
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 407
    .line 408
    .line 409
    move-result v9

    .line 410
    int-to-float v9, v9

    .line 411
    iget v10, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 412
    .line 413
    mul-float/2addr v9, v10

    .line 414
    iget-object v10, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 415
    .line 416
    invoke-virtual {v10}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 417
    .line 418
    .line 419
    move-result-object v10

    .line 420
    iget v10, v10, Lcom/android/launcher3/X3;->O:F

    .line 421
    .line 422
    mul-float/2addr v9, v10

    .line 423
    mul-float/2addr v9, v7

    .line 424
    sub-float/2addr v8, v9

    .line 425
    float-to-int v8, v8

    .line 426
    div-int/lit8 v8, v8, 0x2

    .line 427
    .line 428
    goto :goto_2

    .line 429
    :cond_a
    iget v8, v3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 430
    .line 431
    iget v9, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->n:I

    .line 432
    .line 433
    mul-int/2addr v8, v9

    .line 434
    int-to-float v8, v8

    .line 435
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 436
    .line 437
    .line 438
    move-result v9

    .line 439
    int-to-float v9, v9

    .line 440
    iget v10, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 441
    .line 442
    mul-float/2addr v9, v10

    .line 443
    sub-float/2addr v8, v9

    .line 444
    float-to-int v8, v8

    .line 445
    div-int/lit8 v8, v8, 0x2

    .line 446
    .line 447
    :goto_2
    iget v9, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->q:I

    .line 448
    .line 449
    neg-int v9, v9

    .line 450
    add-int/2addr v9, v8

    .line 451
    int-to-float v8, v9

    .line 452
    const/4 v9, 0x0

    .line 453
    invoke-virtual {p1, v8, v9}, Landroid/graphics/Canvas;->translate(FF)V

    .line 454
    .line 455
    .line 456
    iget v3, v3, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 457
    .line 458
    if-eq v3, v5, :cond_b

    .line 459
    .line 460
    const/4 v5, 0x5

    .line 461
    if-ne v3, v5, :cond_10

    .line 462
    .line 463
    :cond_b
    move-object v3, v4

    .line 464
    check-cast v3, Lcom/android/launcher3/widget/T;

    .line 465
    .line 466
    invoke-virtual {v3}, Lcom/android/launcher3/widget/h;->u()Z

    .line 467
    .line 468
    .line 469
    move-result v3

    .line 470
    if-eqz v3, :cond_c

    .line 471
    .line 472
    iget-object v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 473
    .line 474
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 475
    .line 476
    .line 477
    move-result-object v3

    .line 478
    iget v3, v3, Lcom/android/launcher3/X3;->n0:I

    .line 479
    .line 480
    neg-int v3, v3

    .line 481
    int-to-float v3, v3

    .line 482
    iget v5, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 483
    .line 484
    mul-float/2addr v3, v5

    .line 485
    invoke-virtual {p1, v9, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 486
    .line 487
    .line 488
    new-instance v3, Landroid/graphics/Rect;

    .line 489
    .line 490
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 491
    .line 492
    .line 493
    move-result v5

    .line 494
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    .line 495
    .line 496
    .line 497
    move-result v8

    .line 498
    int-to-float v8, v8

    .line 499
    iget v9, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 500
    .line 501
    mul-float/2addr v8, v9

    .line 502
    iget-object v9, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 503
    .line 504
    invoke-virtual {v9}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 505
    .line 506
    .line 507
    move-result-object v9

    .line 508
    iget v9, v9, Lcom/android/launcher3/X3;->o0:I

    .line 509
    .line 510
    int-to-float v9, v9

    .line 511
    iget v10, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 512
    .line 513
    mul-float/2addr v9, v10

    .line 514
    sub-float/2addr v8, v9

    .line 515
    float-to-int v8, v8

    .line 516
    invoke-direct {v3, v6, v6, v5, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 517
    .line 518
    .line 519
    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 520
    .line 521
    .line 522
    :cond_c
    invoke-static {}, Lm1/a;->a()Z

    .line 523
    .line 524
    .line 525
    move-result v3

    .line 526
    if-eqz v3, :cond_d

    .line 527
    .line 528
    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 529
    .line 530
    .line 531
    move-result-object v3

    .line 532
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 533
    .line 534
    if-eqz v3, :cond_d

    .line 535
    .line 536
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 537
    .line 538
    .line 539
    move-result-object v5

    .line 540
    if-eqz v5, :cond_d

    .line 541
    .line 542
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 543
    .line 544
    .line 545
    move-result-object v3

    .line 546
    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 547
    .line 548
    .line 549
    move-result-object v3

    .line 550
    const-string v5, "zte.com.cn.alarmclock"

    .line 551
    .line 552
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 553
    .line 554
    .line 555
    move-result v3

    .line 556
    if-eqz v3, :cond_d

    .line 557
    .line 558
    new-instance v3, Landroid/graphics/Rect;

    .line 559
    .line 560
    invoke-virtual {v4}, Landroid/view/View;->getPaddingLeft()I

    .line 561
    .line 562
    .line 563
    move-result v5

    .line 564
    int-to-float v5, v5

    .line 565
    iget v6, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 566
    .line 567
    mul-float/2addr v5, v6

    .line 568
    float-to-int v5, v5

    .line 569
    invoke-virtual {v4}, Landroid/view/View;->getPaddingTop()I

    .line 570
    .line 571
    .line 572
    move-result v6

    .line 573
    int-to-float v6, v6

    .line 574
    iget v8, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 575
    .line 576
    mul-float/2addr v6, v8

    .line 577
    float-to-int v6, v6

    .line 578
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    .line 579
    .line 580
    .line 581
    move-result v8

    .line 582
    invoke-virtual {v4}, Landroid/view/View;->getPaddingRight()I

    .line 583
    .line 584
    .line 585
    move-result v9

    .line 586
    sub-int/2addr v8, v9

    .line 587
    int-to-float v8, v8

    .line 588
    iget v9, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 589
    .line 590
    mul-float/2addr v8, v9

    .line 591
    float-to-int v8, v8

    .line 592
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    .line 593
    .line 594
    .line 595
    move-result v9

    .line 596
    invoke-virtual {v4}, Landroid/view/View;->getPaddingBottom()I

    .line 597
    .line 598
    .line 599
    move-result v10

    .line 600
    sub-int/2addr v9, v10

    .line 601
    int-to-float v9, v9

    .line 602
    iget v10, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 603
    .line 604
    mul-float/2addr v9, v10

    .line 605
    float-to-int v9, v9

    .line 606
    invoke-direct {v3, v5, v6, v8, v9}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 607
    .line 608
    .line 609
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 610
    .line 611
    .line 612
    move-result-object v5

    .line 613
    const v6, 0x7f0704b8

    .line 614
    .line 615
    .line 616
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 617
    .line 618
    .line 619
    move-result v5

    .line 620
    int-to-float v5, v5

    .line 621
    new-instance v6, Landroid/graphics/Path;

    .line 622
    .line 623
    invoke-direct {v6}, Landroid/graphics/Path;-><init>()V

    .line 624
    .line 625
    .line 626
    new-instance v8, Landroid/graphics/RectF;

    .line 627
    .line 628
    invoke-direct {v8, v3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 629
    .line 630
    .line 631
    sget-object v3, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 632
    .line 633
    invoke-virtual {v6, v8, v5, v5, v3}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 634
    .line 635
    .line 636
    invoke-virtual {p1, v6}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 637
    .line 638
    .line 639
    :cond_d
    iget-object v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 640
    .line 641
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 642
    .line 643
    .line 644
    move-result-object v3

    .line 645
    invoke-virtual {v3}, Lcom/android/launcher3/h0;->T0()Z

    .line 646
    .line 647
    .line 648
    move-result v3

    .line 649
    if-eqz v3, :cond_e

    .line 650
    .line 651
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 652
    .line 653
    iget-object v5, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 654
    .line 655
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 656
    .line 657
    .line 658
    move-result-object v5

    .line 659
    iget v5, v5, Lcom/android/launcher3/X3;->O:F

    .line 660
    .line 661
    mul-float/2addr v3, v5

    .line 662
    mul-float/2addr v3, v7

    .line 663
    iget v5, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 664
    .line 665
    iget-object v6, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 666
    .line 667
    invoke-virtual {v6}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 668
    .line 669
    .line 670
    move-result-object v6

    .line 671
    iget v6, v6, Lcom/android/launcher3/X3;->O:F

    .line 672
    .line 673
    mul-float/2addr v5, v6

    .line 674
    mul-float/2addr v5, v7

    .line 675
    invoke-virtual {p1, v3, v5}, Landroid/graphics/Canvas;->scale(FF)V

    .line 676
    .line 677
    .line 678
    goto :goto_3

    .line 679
    :cond_e
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 680
    .line 681
    invoke-virtual {p1, v3, v3}, Landroid/graphics/Canvas;->scale(FF)V

    .line 682
    .line 683
    .line 684
    :goto_3
    invoke-virtual {v4, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 685
    .line 686
    .line 687
    goto :goto_4

    .line 688
    :cond_f
    instance-of v3, v4, Lcom/android/launcher3/BubbleTextView;

    .line 689
    .line 690
    if-eqz v3, :cond_10

    .line 691
    .line 692
    new-instance v3, Landroid/graphics/Rect;

    .line 693
    .line 694
    iget v5, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->p:I

    .line 695
    .line 696
    int-to-float v7, v5

    .line 697
    iget v8, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 698
    .line 699
    mul-float/2addr v7, v8

    .line 700
    float-to-int v7, v7

    .line 701
    int-to-float v5, v5

    .line 702
    mul-float/2addr v5, v8

    .line 703
    float-to-int v5, v5

    .line 704
    invoke-direct {v3, v6, v6, v7, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 705
    .line 706
    .line 707
    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 708
    .line 709
    .line 710
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 711
    .line 712
    invoke-virtual {p1, v3, v3}, Landroid/graphics/Canvas;->scale(FF)V

    .line 713
    .line 714
    .line 715
    check-cast v4, Lcom/android/launcher3/BubbleTextView;

    .line 716
    .line 717
    invoke-virtual {v4, p1}, Lcom/android/launcher3/BubbleTextView;->W(Landroid/graphics/Canvas;)V

    .line 718
    .line 719
    .line 720
    :cond_10
    :goto_4
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 721
    .line 722
    .line 723
    goto/16 :goto_0

    .line 724
    .line 725
    :cond_11
    :goto_5
    instance-of v3, v4, Lcom/android/launcher3/folder/FolderIcon;

    .line 726
    .line 727
    if-eqz v3, :cond_12

    .line 728
    .line 729
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    .line 730
    .line 731
    .line 732
    move-result v3

    .line 733
    if-ne v3, v5, :cond_12

    .line 734
    .line 735
    check-cast v4, Lcom/android/launcher3/folder/FolderIcon;

    .line 736
    .line 737
    invoke-virtual {v4}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 738
    .line 739
    .line 740
    move-result-object v3

    .line 741
    invoke-virtual {v3}, Lcom/android/launcher3/a;->isOpen()Z

    .line 742
    .line 743
    .line 744
    move-result v3

    .line 745
    if-eqz v3, :cond_12

    .line 746
    .line 747
    new-instance v3, Landroid/graphics/Rect;

    .line 748
    .line 749
    iget v5, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->p:I

    .line 750
    .line 751
    int-to-float v7, v5

    .line 752
    iget v8, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 753
    .line 754
    mul-float/2addr v7, v8

    .line 755
    float-to-int v7, v7

    .line 756
    int-to-float v5, v5

    .line 757
    mul-float/2addr v5, v8

    .line 758
    float-to-int v5, v5

    .line 759
    invoke-direct {v3, v6, v6, v7, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 760
    .line 761
    .line 762
    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 763
    .line 764
    .line 765
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 766
    .line 767
    .line 768
    move-result v3

    .line 769
    iget-object v5, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->h:Lcom/android/launcher3/C2;

    .line 770
    .line 771
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 772
    .line 773
    .line 774
    move-result-object v5

    .line 775
    iget v5, v5, Lcom/android/launcher3/h0;->B1:I

    .line 776
    .line 777
    sub-int/2addr v3, v5

    .line 778
    div-int/lit8 v3, v3, 0x2

    .line 779
    .line 780
    neg-int v3, v3

    .line 781
    int-to-float v3, v3

    .line 782
    iget v5, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 783
    .line 784
    mul-float/2addr v3, v5

    .line 785
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 786
    .line 787
    .line 788
    move-result v5

    .line 789
    neg-int v5, v5

    .line 790
    int-to-float v5, v5

    .line 791
    iget v6, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 792
    .line 793
    mul-float/2addr v5, v6

    .line 794
    invoke-virtual {p1, v3, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 795
    .line 796
    .line 797
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->s:F

    .line 798
    .line 799
    invoke-virtual {p1, v3, v3}, Landroid/graphics/Canvas;->scale(FF)V

    .line 800
    .line 801
    .line 802
    invoke-virtual {v4, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 803
    .line 804
    .line 805
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 806
    .line 807
    .line 808
    goto/16 :goto_0

    .line 809
    .line 810
    :cond_12
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 811
    .line 812
    .line 813
    goto/16 :goto_0

    .line 814
    .line 815
    :cond_13
    iget v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->l:I

    .line 816
    .line 817
    neg-int v0, v0

    .line 818
    int-to-float v0, v0

    .line 819
    iget p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->m:I

    .line 820
    .line 821
    neg-int p0, p0

    .line 822
    int-to-float p0, p0

    .line 823
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 824
    .line 825
    .line 826
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->a()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected setPosition(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->i:I

    .line 2
    .line 3
    return-void
.end method
