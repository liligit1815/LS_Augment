.class public Lcom/android/launcher3/folderbatch/d;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "FolderBatchAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/android/launcher3/folderbatch/h;",
        ">;"
    }
.end annotation


# instance fields
.field private a:Lcom/android/launcher3/C2;

.field private b:Landroid/view/LayoutInflater;

.field private c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/I;",
            ">;"
        }
    .end annotation
.end field

.field private d:Landroid/view/View$OnClickListener;

.field private e:I

.field private f:I

.field private g:I

.field private h:I

.field private i:I

.field private j:I

.field private k:I

.field protected l:Landroid/view/View$OnFocusChangeListener;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;Landroid/view/View$OnClickListener;)V
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
    iput-object v0, p0, Lcom/android/launcher3/folderbatch/d;->c:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/android/launcher3/folderbatch/d;->b:Landroid/view/LayoutInflater;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/android/launcher3/folderbatch/d;->a:Lcom/android/launcher3/C2;

    .line 18
    .line 19
    iput-object p2, p0, Lcom/android/launcher3/folderbatch/d;->d:Landroid/view/View$OnClickListener;

    .line 20
    .line 21
    invoke-direct {p0}, Lcom/android/launcher3/folderbatch/d;->j()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private h(I)Lcom/android/launcher3/model/data/I;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folderbatch/d;->c:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/launcher3/model/data/I;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method private i(Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/d;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/X3;->j()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p1, p2}, Lcom/android/launcher3/BubbleTextView;->y(Lcom/android/launcher3/model/data/I;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/folderbatch/d;->d:Landroid/view/View$OnClickListener;

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/folderbatch/d;->a:Lcom/android/launcher3/C2;

    .line 20
    .line 21
    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v2, p0, Lcom/android/launcher3/folderbatch/d;->a:Lcom/android/launcher3/C2;

    .line 26
    .line 27
    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {v2}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    const v3, 0x7f040781

    .line 36
    .line 37
    .line 38
    invoke-static {v1, v3, v2}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {p1, v1}, Lcom/android/launcher3/BubbleTextView;->setTextColor(I)V

    .line 43
    .line 44
    .line 45
    iget v1, p0, Lcom/android/launcher3/folderbatch/d;->g:I

    .line 46
    .line 47
    int-to-float v1, v1

    .line 48
    mul-float/2addr v1, v0

    .line 49
    float-to-int v1, v1

    .line 50
    invoke-virtual {p1}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    int-to-float v3, v3

    .line 59
    mul-float/2addr v3, v0

    .line 60
    float-to-int v3, v3

    .line 61
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    int-to-float v2, v2

    .line 66
    mul-float/2addr v2, v0

    .line 67
    float-to-int v2, v2

    .line 68
    iget v4, p0, Lcom/android/launcher3/folderbatch/d;->i:I

    .line 69
    .line 70
    add-int/2addr v2, v4

    .line 71
    if-ne v3, v2, :cond_0

    .line 72
    .line 73
    iget v2, p0, Lcom/android/launcher3/folderbatch/d;->h:I

    .line 74
    .line 75
    sub-int/2addr v1, v2

    .line 76
    int-to-float v1, v1

    .line 77
    mul-float/2addr v1, v0

    .line 78
    float-to-int v1, v1

    .line 79
    :cond_0
    iget-boolean p2, p2, Lcom/android/launcher3/model/data/y;->isNewApp:Z

    .line 80
    .line 81
    const/4 v0, 0x0

    .line 82
    if-eqz p2, :cond_2

    .line 83
    .line 84
    invoke-virtual {p1}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->s()Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    if-eqz v2, :cond_1

    .line 97
    .line 98
    const v2, 0x7f070928

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_1
    const v2, 0x7f070927

    .line 103
    .line 104
    .line 105
    :goto_0
    invoke-virtual {p2, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    float-to-int p2, p2

    .line 110
    invoke-virtual {p1}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    const v3, 0x7f070929

    .line 115
    .line 116
    .line 117
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    float-to-int v2, v2

    .line 122
    add-int/2addr p2, v2

    .line 123
    goto :goto_1

    .line 124
    :cond_2
    move p2, v0

    .line 125
    :goto_1
    invoke-virtual {p1, p2, v1, p2, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    check-cast p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    .line 133
    .line 134
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 135
    .line 136
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 137
    .line 138
    iget p2, p0, Lcom/android/launcher3/folderbatch/d;->e:I

    .line 139
    .line 140
    iput p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 141
    .line 142
    iget p2, p0, Lcom/android/launcher3/folderbatch/d;->f:I

    .line 143
    .line 144
    iput p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 145
    .line 146
    invoke-virtual {p0}, Lcom/android/launcher3/folderbatch/d;->g()I

    .line 147
    .line 148
    .line 149
    move-result p2

    .line 150
    div-int p2, p3, p2

    .line 151
    .line 152
    if-nez p2, :cond_3

    .line 153
    .line 154
    iget p0, p0, Lcom/android/launcher3/folderbatch/d;->j:I

    .line 155
    .line 156
    iput p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 157
    .line 158
    iget p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 159
    .line 160
    add-int/2addr p2, p0

    .line 161
    iput p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 162
    .line 163
    return-void

    .line 164
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher3/folderbatch/d;->g()I

    .line 165
    .line 166
    .line 167
    move-result p2

    .line 168
    div-int/2addr p3, p2

    .line 169
    invoke-virtual {p0}, Lcom/android/launcher3/folderbatch/d;->getItemCount()I

    .line 170
    .line 171
    .line 172
    move-result p2

    .line 173
    add-int/lit8 p2, p2, -0x1

    .line 174
    .line 175
    invoke-virtual {p0}, Lcom/android/launcher3/folderbatch/d;->g()I

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    div-int/2addr p2, v0

    .line 180
    if-ne p3, p2, :cond_4

    .line 181
    .line 182
    iget p0, p0, Lcom/android/launcher3/folderbatch/d;->k:I

    .line 183
    .line 184
    iput p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 185
    .line 186
    iget p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 187
    .line 188
    add-int/2addr p2, p0

    .line 189
    iput p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 190
    .line 191
    :cond_4
    return-void
.end method

.method private j()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/d;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, v0, Lcom/android/launcher3/X3;->y:I

    .line 8
    .line 9
    iput v1, p0, Lcom/android/launcher3/folderbatch/d;->e:I

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/folderbatch/d;->d:Landroid/view/View$OnClickListener;

    .line 12
    .line 13
    check-cast v1, Lcom/android/launcher3/folderbatch/FolderBatch;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/android/launcher3/folderbatch/FolderBatch;->getRecyclerContentWidth()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/folderbatch/d;->g()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    div-int/2addr v1, v2

    .line 24
    iput v1, p0, Lcom/android/launcher3/folderbatch/d;->f:I

    .line 25
    .line 26
    iget-object v1, p0, Lcom/android/launcher3/folderbatch/d;->a:Lcom/android/launcher3/C2;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_2

    .line 37
    .line 38
    iget-boolean v2, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 39
    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    const v2, 0x7f0c0070

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    const v2, 0x7f0c006f

    .line 47
    .line 48
    .line 49
    :goto_0
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    int-to-float v2, v2

    .line 54
    invoke-static {v2}, Lcom/android/launcher3/N5;->T(F)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    iput v2, p0, Lcom/android/launcher3/folderbatch/d;->e:I

    .line 59
    .line 60
    iget-boolean v2, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 61
    .line 62
    if-eqz v2, :cond_1

    .line 63
    .line 64
    const v2, 0x7f0a0003

    .line 65
    .line 66
    .line 67
    const/4 v3, 0x1

    .line 68
    invoke-virtual {v1, v2, v3, v3}, Landroid/content/res/Resources;->getFraction(III)F

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    iget v3, v0, Lcom/android/launcher3/h0;->T0:I

    .line 73
    .line 74
    int-to-float v4, v3

    .line 75
    mul-float/2addr v2, v4

    .line 76
    float-to-int v2, v2

    .line 77
    mul-int/lit8 v2, v2, 0x2

    .line 78
    .line 79
    sub-int/2addr v3, v2

    .line 80
    div-int/lit8 v3, v3, 0x6

    .line 81
    .line 82
    iput v3, p0, Lcom/android/launcher3/folderbatch/d;->f:I

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_1
    iget v2, v0, Lcom/android/launcher3/h0;->T0:I

    .line 86
    .line 87
    div-int/lit8 v2, v2, 0x6

    .line 88
    .line 89
    iput v2, p0, Lcom/android/launcher3/folderbatch/d;->f:I

    .line 90
    .line 91
    :cond_2
    :goto_1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->s()Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-eqz v2, :cond_4

    .line 100
    .line 101
    iget-object v2, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 102
    .line 103
    iget-boolean v2, v2, Lcom/android/launcher3/r4;->M:Z

    .line 104
    .line 105
    if-eqz v2, :cond_3

    .line 106
    .line 107
    const v2, 0x7f07033a

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    iput v2, p0, Lcom/android/launcher3/folderbatch/d;->e:I

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_3
    const v2, 0x7f070339

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    iput v2, p0, Lcom/android/launcher3/folderbatch/d;->e:I

    .line 125
    .line 126
    :cond_4
    :goto_2
    iget-boolean v2, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 127
    .line 128
    if-eqz v2, :cond_5

    .line 129
    .line 130
    const v2, 0x7f070186

    .line 131
    .line 132
    .line 133
    :goto_3
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    goto :goto_4

    .line 138
    :cond_5
    const v2, 0x7f070184

    .line 139
    .line 140
    .line 141
    goto :goto_3

    .line 142
    :goto_4
    iput v2, p0, Lcom/android/launcher3/folderbatch/d;->g:I

    .line 143
    .line 144
    const v2, 0x7f070ab4

    .line 145
    .line 146
    .line 147
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 148
    .line 149
    .line 150
    move-result v2

    .line 151
    iput v2, p0, Lcom/android/launcher3/folderbatch/d;->h:I

    .line 152
    .line 153
    const v2, 0x7f070ab3

    .line 154
    .line 155
    .line 156
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    mul-int/lit8 v2, v2, 0x2

    .line 161
    .line 162
    iget v3, p0, Lcom/android/launcher3/folderbatch/d;->h:I

    .line 163
    .line 164
    sub-int/2addr v2, v3

    .line 165
    iput v2, p0, Lcom/android/launcher3/folderbatch/d;->i:I

    .line 166
    .line 167
    if-gez v2, :cond_6

    .line 168
    .line 169
    const/4 v2, 0x0

    .line 170
    iput v2, p0, Lcom/android/launcher3/folderbatch/d;->i:I

    .line 171
    .line 172
    :cond_6
    const v2, 0x7f07033e

    .line 173
    .line 174
    .line 175
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    iput v2, p0, Lcom/android/launcher3/folderbatch/d;->j:I

    .line 180
    .line 181
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    if-eqz v0, :cond_7

    .line 186
    .line 187
    const v0, 0x7f070340

    .line 188
    .line 189
    .line 190
    :goto_5
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    goto :goto_6

    .line 195
    :cond_7
    const v0, 0x7f07033f

    .line 196
    .line 197
    .line 198
    goto :goto_5

    .line 199
    :goto_6
    iput v0, p0, Lcom/android/launcher3/folderbatch/d;->k:I

    .line 200
    .line 201
    return-void
.end method


# virtual methods
.method protected f()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/I;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folderbatch/d;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()I
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x6

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x4

    .line 10
    return p0
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folderbatch/d;->c:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public k(Lcom/android/launcher3/folderbatch/h;I)V
    .locals 1

    .line 1
    invoke-direct {p0, p2}, Lcom/android/launcher3/folderbatch/d;->h(I)Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/folderbatch/h;->a()Lcom/android/launcher3/BubbleTextView;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-direct {p0, p1, v0, p2}, Lcom/android/launcher3/folderbatch/d;->i(Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public l(Landroid/view/ViewGroup;I)Lcom/android/launcher3/folderbatch/h;
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/android/launcher3/folderbatch/d;->b:Landroid/view/LayoutInflater;

    .line 2
    .line 3
    const v0, 0x7f0e0075

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    .line 12
    .line 13
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/folderbatch/d;->l:Landroid/view/View$OnFocusChangeListener;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-static {}, Lx1/O;->k1()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    instance-of p0, p1, Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;

    .line 33
    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    check-cast p1, Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;

    .line 37
    .line 38
    iget-object p0, p1, Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;->T:Lcom/android/launcher3/keyboard/b;

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    new-instance p0, Lcom/android/launcher3/folderbatch/h;

    .line 44
    .line 45
    invoke-direct {p0, p2}, Lcom/android/launcher3/folderbatch/h;-><init>(Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    return-object p0
.end method

.method protected m(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/I;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/android/launcher3/folderbatch/d;->c:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/folderbatch/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/folderbatch/d;->k(Lcom/android/launcher3/folderbatch/h;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/folderbatch/d;->l(Landroid/view/ViewGroup;I)Lcom/android/launcher3/folderbatch/h;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public setIconFocusListener(Landroid/view/View$OnFocusChangeListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folderbatch/d;->l:Landroid/view/View$OnFocusChangeListener;

    .line 2
    .line 3
    return-void
.end method
