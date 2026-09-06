.class public Lcom/android/launcher3/folderbatch/FolderBatch;
.super Lcom/android/launcher3/a;
.source "FolderBatch.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private g:Landroid/view/ViewPropertyAnimator;

.field private h:Z

.field private i:Landroid/graphics/Rect;

.field private j:I

.field private k:Landroid/widget/LinearLayout;

.field private l:I

.field private m:I

.field private n:I

.field private o:Ljava/lang/String;

.field private p:Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;

.field private q:Landroid/widget/FrameLayout;

.field private r:Landroid/widget/TextView;

.field private s:Lcom/android/launcher3/folderbatch/d;

.field private t:Lcom/android/launcher3/folder/Folder;

.field private u:Lcom/android/launcher3/C2;

.field private v:Landroid/widget/TextView;

.field private w:Landroid/widget/TextView;

.field private x:Z

.field private final y:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/folderbatch/FolderBatch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->h:Z

    .line 4
    new-instance p3, Landroid/graphics/Rect;

    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->i:Landroid/graphics/Rect;

    .line 5
    iput-boolean p2, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->x:Z

    .line 6
    new-instance p2, Lcom/android/launcher3/folderbatch/FolderBatch$a;

    invoke-direct {p2, p0}, Lcom/android/launcher3/folderbatch/FolderBatch$a;-><init>(Lcom/android/launcher3/folderbatch/FolderBatch;)V

    iput-object p2, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->y:Ljava/lang/Runnable;

    .line 7
    check-cast p1, Lcom/android/launcher3/C2;

    iput-object p1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/folderbatch/FolderBatch;->a0()V

    .line 9
    new-instance p1, Lcom/android/launcher3/folderbatch/d;

    iget-object p2, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    invoke-direct {p1, p2, p0}, Lcom/android/launcher3/folderbatch/d;-><init>(Lcom/android/launcher3/C2;Landroid/view/View$OnClickListener;)V

    iput-object p1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->s:Lcom/android/launcher3/folderbatch/d;

    return-void
.end method

.method public static synthetic N(Lcom/android/launcher3/folderbatch/FolderBatch;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/folderbatch/FolderBatch;->e0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O(Ljava/util/List;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    instance-of v0, p2, Lcom/android/launcher3/BubbleTextView;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    .line 16
    .line 17
    invoke-virtual {p2}, Landroid/widget/TextView;->invalidate()V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public static synthetic Q(Lcom/android/launcher3/folderbatch/FolderBatch;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/folderbatch/FolderBatch;->d0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic R(Lcom/android/launcher3/folderbatch/FolderBatch;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->t:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic S(Lcom/android/launcher3/folderbatch/FolderBatch;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method private U()V
    .locals 2

    .line 1
    const-string v0, "FolderBatch"

    .line 2
    .line 3
    const-string v1, "btnCancelClick"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/folderbatch/FolderBatch;->X()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-direct {p0, v0}, Lcom/android/launcher3/folderbatch/FolderBatch;->Y(Z)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private V()V
    .locals 2

    .line 1
    const-string v0, "FolderBatch"

    .line 2
    .line 3
    const-string v1, "btnOkClick"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/folderbatch/FolderBatch;->getCheckedItemCount()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    invoke-direct {p0, v0}, Lcom/android/launcher3/folderbatch/FolderBatch;->Y(Z)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/android/launcher3/folderbatch/FolderBatch;->g0()V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Lcom/android/launcher3/folderbatch/FolderBatch;->X()V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method private X()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->s:Lcom/android/launcher3/folderbatch/d;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folderbatch/d;->f()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/android/launcher3/model/data/I;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    iput-boolean v2, v1, Lcom/android/launcher3/model/data/y;->isShowCheckbox:Z

    .line 25
    .line 26
    iput-boolean v2, v1, Lcom/android/launcher3/model/data/y;->isChecked:Z

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->s:Lcom/android/launcher3/folderbatch/d;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/android/launcher3/folderbatch/d;->f()Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folderbatch/FolderBatch;->f0(Ljava/util/List;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private Y(Z)Z
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "exit (mFolder != null)= "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->t:Lcom/android/launcher3/folder/Folder;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    const/4 v3, 0x0

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    move v1, v2

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v1, v3

    .line 20
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, " isShowed= "

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-boolean v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->x:Z

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "FolderBatch"

    .line 38
    .line 39
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    iget-boolean v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->x:Z

    .line 43
    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    return v3

    .line 47
    :cond_1
    iput-boolean v3, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->x:Z

    .line 48
    .line 49
    invoke-virtual {p0, v3, p1}, Lcom/android/launcher3/folderbatch/FolderBatch;->T(ZZ)V

    .line 50
    .line 51
    .line 52
    iput-boolean v3, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 53
    .line 54
    return v2
.end method

.method public static Z(Lcom/android/launcher3/C2;)Lcom/android/launcher3/folderbatch/FolderBatch;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const p0, 0x7f0e00df

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->T0()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const p0, 0x7f0e00de

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const p0, 0x7f0e00dd

    .line 30
    .line 31
    .line 32
    :goto_0
    const/4 v1, 0x0

    .line 33
    invoke-virtual {v0, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Lcom/android/launcher3/folderbatch/FolderBatch;

    .line 38
    .line 39
    return-object p0
.end method

.method private a0()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f1401a5

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->o:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget v0, v0, Lcom/android/launcher3/h0;->T0:I

    .line 21
    .line 22
    iget-object v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget v1, v1, Lcom/android/launcher3/h0;->U0:I

    .line 29
    .line 30
    int-to-float v2, v0

    .line 31
    const v3, 0x3d360b61

    .line 32
    .line 33
    .line 34
    mul-float/2addr v3, v2

    .line 35
    float-to-int v3, v3

    .line 36
    iput v3, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->n:I

    .line 37
    .line 38
    mul-int/lit8 v3, v3, 0x2

    .line 39
    .line 40
    sub-int v3, v0, v3

    .line 41
    .line 42
    iput v3, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->l:I

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    const v4, 0x7f070359

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    iput v3, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->j:I

    .line 56
    .line 57
    iget-object v3, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 58
    .line 59
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v3}, Lcom/android/launcher3/h0;->T0()Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    const/4 v4, 0x0

    .line 68
    if-eqz v3, :cond_0

    .line 69
    .line 70
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->i:Landroid/graphics/Rect;

    .line 71
    .line 72
    const/high16 v3, 0x3c800000    # 0.015625f

    .line 73
    .line 74
    mul-float/2addr v3, v2

    .line 75
    float-to-int v3, v3

    .line 76
    iput v3, v0, Landroid/graphics/Rect;->left:I

    .line 77
    .line 78
    iput v3, v0, Landroid/graphics/Rect;->right:I

    .line 79
    .line 80
    iput v4, v0, Landroid/graphics/Rect;->top:I

    .line 81
    .line 82
    iput v4, v0, Landroid/graphics/Rect;->bottom:I

    .line 83
    .line 84
    const v0, 0x3e19999a    # 0.15f

    .line 85
    .line 86
    .line 87
    mul-float/2addr v0, v2

    .line 88
    const/high16 v4, 0x40000000    # 2.0f

    .line 89
    .line 90
    div-float/2addr v0, v4

    .line 91
    float-to-int v0, v0

    .line 92
    iput v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->n:I

    .line 93
    .line 94
    int-to-float v0, v1

    .line 95
    const v1, 0x3dcccccd    # 0.1f

    .line 96
    .line 97
    .line 98
    mul-float/2addr v1, v0

    .line 99
    float-to-int v1, v1

    .line 100
    iput v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->j:I

    .line 101
    .line 102
    const v1, 0x3f0be2be

    .line 103
    .line 104
    .line 105
    mul-float/2addr v2, v1

    .line 106
    float-to-int v1, v2

    .line 107
    sub-int/2addr v1, v3

    .line 108
    sub-int/2addr v1, v3

    .line 109
    iput v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->l:I

    .line 110
    .line 111
    const v1, 0x3f366666    # 0.7125f

    .line 112
    .line 113
    .line 114
    mul-float/2addr v0, v1

    .line 115
    float-to-int v0, v0

    .line 116
    iput v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->m:I

    .line 117
    .line 118
    return-void

    .line 119
    :cond_0
    int-to-float v1, v1

    .line 120
    const v3, 0x3f306666

    .line 121
    .line 122
    .line 123
    mul-float/2addr v3, v1

    .line 124
    float-to-int v3, v3

    .line 125
    iput v3, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->m:I

    .line 126
    .line 127
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    if-eqz v3, :cond_2

    .line 132
    .line 133
    iget-object v3, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 134
    .line 135
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    iget-boolean v3, v3, Lcom/android/launcher3/h0;->N0:Z

    .line 140
    .line 141
    const/4 v5, 0x1

    .line 142
    if-eqz v3, :cond_1

    .line 143
    .line 144
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    const v4, 0x7f0a0001

    .line 149
    .line 150
    .line 151
    invoke-virtual {v3, v4, v5, v5}, Landroid/content/res/Resources;->getFraction(III)F

    .line 152
    .line 153
    .line 154
    move-result v3

    .line 155
    mul-float/2addr v3, v1

    .line 156
    float-to-int v1, v3

    .line 157
    iput v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->m:I

    .line 158
    .line 159
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    const v3, 0x7f0a0003

    .line 164
    .line 165
    .line 166
    invoke-virtual {v1, v3, v5, v5}, Landroid/content/res/Resources;->getFraction(III)F

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    mul-float/2addr v1, v2

    .line 171
    float-to-int v1, v1

    .line 172
    iput v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->n:I

    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    const/high16 v3, 0x7f0a0000

    .line 180
    .line 181
    invoke-virtual {v2, v3, v5, v5}, Landroid/content/res/Resources;->getFraction(III)F

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    mul-float/2addr v2, v1

    .line 186
    float-to-int v1, v2

    .line 187
    iput v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->m:I

    .line 188
    .line 189
    iput v4, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->n:I

    .line 190
    .line 191
    :goto_0
    iget v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->n:I

    .line 192
    .line 193
    mul-int/lit8 v1, v1, 0x2

    .line 194
    .line 195
    sub-int/2addr v0, v1

    .line 196
    iput v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->l:I

    .line 197
    .line 198
    :cond_2
    return-void
.end method

.method private b0(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1, p0, v0}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    float-to-int p0, p0

    .line 20
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    float-to-int p1, p1

    .line 25
    invoke-virtual {v0, p0, p1}, Landroid/graphics/Rect;->contains(II)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method private synthetic d0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/folderbatch/FolderBatch;->V()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic e0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/folderbatch/FolderBatch;->U()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private g0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->t:Lcom/android/launcher3/folder/Folder;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/folder/Folder;->getInfo()Lcom/android/launcher3/model/data/p;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget v1, v1, Lcom/android/launcher3/model/data/y;->id:I

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/launcher3/folderbatch/FolderBatch;->getAfterData()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/folderbatch/g;->h(Landroid/content/Context;ILjava/util/List;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private getAfterData()Ljava/util/List;
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
    iget-object p0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->s:Lcom/android/launcher3/folderbatch/d;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/folderbatch/d;->f()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method private getCheckedItemCount()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->s:Lcom/android/launcher3/folderbatch/d;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/folderbatch/d;->f()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v0, 0x0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/android/launcher3/model/data/I;

    .line 23
    .line 24
    iget-boolean v1, v1, Lcom/android/launcher3/model/data/y;->isChecked:Z

    .line 25
    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    add-int/lit8 v0, v0, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return v0
.end method


# virtual methods
.method T(ZZ)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->h:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_3

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->h:Z

    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->g:Landroid/view/ViewPropertyAnimator;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-object p1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->g:Landroid/view/ViewPropertyAnimator;

    .line 16
    .line 17
    :cond_0
    if-nez p2, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->y:Ljava/lang/Runnable;

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    iget-boolean p1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->h:Z

    .line 26
    .line 27
    if-eqz p1, :cond_2

    .line 28
    .line 29
    const/high16 p1, 0x3f800000    # 1.0f

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    const/4 p1, 0x0

    .line 33
    :goto_0
    const/4 p2, 0x0

    .line 34
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->animate()Landroid/view/ViewPropertyAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-virtual {p2, p1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance p2, Landroid/view/animation/AccelerateInterpolator;

    .line 46
    .line 47
    invoke-direct {p2}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    const-wide/16 v0, 0xaf

    .line 55
    .line 56
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-object p2, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->y:Ljava/lang/Runnable;

    .line 61
    .line 62
    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iput-object p1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->g:Landroid/view/ViewPropertyAnimator;

    .line 67
    .line 68
    :cond_3
    return-void
.end method

.method public W()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 26
    .line 27
    iget v3, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->l:I

    .line 28
    .line 29
    iget-object v4, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 30
    .line 31
    invoke-virtual {v4}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual {v4}, Lcom/android/launcher3/h0;->T0()Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-eqz v4, :cond_0

    .line 40
    .line 41
    iget-object v4, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->k:Landroid/widget/LinearLayout;

    .line 42
    .line 43
    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    add-int/2addr v3, v4

    .line 48
    iget v4, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->m:I

    .line 49
    .line 50
    sub-int/2addr v1, v3

    .line 51
    div-int/lit8 v1, v1, 0x2

    .line 52
    .line 53
    iput v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->n:I

    .line 54
    .line 55
    sub-int v1, v2, v4

    .line 56
    .line 57
    div-int/lit8 v1, v1, 0x2

    .line 58
    .line 59
    iput v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->j:I

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    move v4, v2

    .line 63
    :goto_0
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_2

    .line 68
    .line 69
    const v1, 0x7f0b027b

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 81
    .line 82
    iget-object v5, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 83
    .line 84
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    iget-boolean v5, v5, Lcom/android/launcher3/h0;->N0:Z

    .line 89
    .line 90
    if-eqz v5, :cond_1

    .line 91
    .line 92
    const/high16 v5, 0x3df00000    # 0.1171875f

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_1
    const/high16 v5, 0x3e080000    # 0.1328125f

    .line 96
    .line 97
    :goto_1
    int-to-float v2, v2

    .line 98
    mul-float/2addr v5, v2

    .line 99
    float-to-int v2, v5

    .line 100
    iput v2, v4, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 101
    .line 102
    invoke-virtual {v1, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 103
    .line 104
    .line 105
    const/4 v1, 0x0

    .line 106
    iput v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->j:I

    .line 107
    .line 108
    iget-object v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 109
    .line 110
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    iget v1, v1, Lcom/android/launcher3/h0;->U0:I

    .line 115
    .line 116
    iget v2, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->j:I

    .line 117
    .line 118
    sub-int v4, v1, v2

    .line 119
    .line 120
    :cond_2
    iget v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->n:I

    .line 121
    .line 122
    iput v1, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 123
    .line 124
    iget v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->j:I

    .line 125
    .line 126
    iput v1, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 127
    .line 128
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 129
    .line 130
    iget-object v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 131
    .line 132
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->P0:Z

    .line 137
    .line 138
    if-eqz v1, :cond_3

    .line 139
    .line 140
    move v1, v4

    .line 141
    goto :goto_2

    .line 142
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 143
    .line 144
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    iget-object v1, v1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 149
    .line 150
    iget v1, v1, Lcom/android/launcher3/r4;->R:I

    .line 151
    .line 152
    sub-int v1, v4, v1

    .line 153
    .line 154
    :goto_2
    iget-object v2, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 155
    .line 156
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    iget-object v2, v2, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 161
    .line 162
    iget v2, v2, Lcom/android/launcher3/r4;->Q:I

    .line 163
    .line 164
    sub-int/2addr v1, v2

    .line 165
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 166
    .line 167
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    if-eqz v1, :cond_4

    .line 172
    .line 173
    iget-object p0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 174
    .line 175
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    iget-object p0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 180
    .line 181
    iget p0, p0, Lcom/android/launcher3/r4;->R:I

    .line 182
    .line 183
    sub-int/2addr v4, p0

    .line 184
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 185
    .line 186
    :cond_4
    return-void
.end method

.method public c0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->x:Z

    .line 2
    .line 3
    return p0
.end method

.method public f0(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/I;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Lcom/android/launcher3/folderbatch/a;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Lcom/android/launcher3/folderbatch/a;-><init>(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method protected getRecyclerContentWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public h0(Ljava/util/List;Lcom/android/launcher3/folder/Folder;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/I;",
            ">;",
            "Lcom/android/launcher3/folder/Folder;",
            ")V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->x:Z

    .line 2
    .line 3
    const-string v1, "FolderBatch"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string p2, "show return isShowed= "

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    iget-boolean p0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->x:Z

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->Q()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 43
    .line 44
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->g0:Z

    .line 49
    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->v()V

    .line 59
    .line 60
    .line 61
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    if-nez v2, :cond_2

    .line 72
    .line 73
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 74
    .line 75
    .line 76
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/folderbatch/FolderBatch;->W()V

    .line 77
    .line 78
    .line 79
    if-eqz p1, :cond_5

    .line 80
    .line 81
    if-eqz p2, :cond_5

    .line 82
    .line 83
    const/4 v0, 0x1

    .line 84
    iput-boolean v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->x:Z

    .line 85
    .line 86
    new-instance v2, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 89
    .line 90
    .line 91
    const-string v3, "show workspaceItemInfoList.size= "

    .line 92
    .line 93
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    iput-object p2, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->t:Lcom/android/launcher3/folder/Folder;

    .line 111
    .line 112
    iget-object v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->s:Lcom/android/launcher3/folderbatch/d;

    .line 113
    .line 114
    invoke-virtual {v1, p1}, Lcom/android/launcher3/folderbatch/d;->m(Ljava/util/List;)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->p:Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;

    .line 118
    .line 119
    const/4 v1, 0x0

    .line 120
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->r:Landroid/widget/TextView;

    .line 124
    .line 125
    iget-object v2, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->o:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {p2}, Lcom/android/launcher3/folder/Folder;->getInfo()Lcom/android/launcher3/model/data/p;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    iget-object p2, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 132
    .line 133
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    invoke-static {v2, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 142
    .line 143
    .line 144
    iget-object p1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->t:Lcom/android/launcher3/folder/Folder;

    .line 145
    .line 146
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 147
    .line 148
    const/16 p2, 0x8

    .line 149
    .line 150
    invoke-virtual {p1, p2}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    if-eqz p1, :cond_3

    .line 155
    .line 156
    iget-object p1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->r:Landroid/widget/TextView;

    .line 157
    .line 158
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    const v3, 0x7f1401f4

    .line 163
    .line 164
    .line 165
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 170
    .line 171
    .line 172
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 173
    .line 174
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    iget-object v2, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 179
    .line 180
    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    invoke-static {v2}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 185
    .line 186
    .line 187
    move-result v2

    .line 188
    const v3, 0x7f040781

    .line 189
    .line 190
    .line 191
    invoke-static {p1, v3, v2}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    iget-object v2, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->r:Landroid/widget/TextView;

    .line 196
    .line 197
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 198
    .line 199
    .line 200
    iget-object p1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->r:Landroid/widget/TextView;

    .line 201
    .line 202
    iget-object v2, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 203
    .line 204
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getForeColor()I

    .line 205
    .line 206
    .line 207
    move-result v2

    .line 208
    const/4 v3, -0x1

    .line 209
    if-ne v3, v2, :cond_4

    .line 210
    .line 211
    move v1, v0

    .line 212
    :cond_4
    invoke-static {p1, v1}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    .line 213
    .line 214
    .line 215
    iget-object p1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->t:Lcom/android/launcher3/folder/Folder;

    .line 216
    .line 217
    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {p0, v0, v0}, Lcom/android/launcher3/folderbatch/FolderBatch;->T(ZZ)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->bringToFront()V

    .line 224
    .line 225
    .line 226
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 227
    .line 228
    :cond_5
    return-void
.end method

.method protected handleClose(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/folderbatch/FolderBatch;->X()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    invoke-direct {p0, p1}, Lcom/android/launcher3/folderbatch/FolderBatch;->Y(Z)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    const/high16 p0, 0x1000000

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    instance-of p0, p1, Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    instance-of p0, p0, Lcom/android/launcher3/model/data/I;

    .line 11
    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/android/launcher3/model/data/I;

    .line 20
    .line 21
    iget-boolean v0, p0, Lcom/android/launcher3/model/data/y;->isChecked:Z

    .line 22
    .line 23
    xor-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/android/launcher3/model/data/y;->isChecked:Z

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getRecentProxy()Lcom/android/launcher3/u4;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v2, Landroid/graphics/PointF;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    invoke-direct {v2, v3, v4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v2}, Lcom/android/launcher3/u4;->e(Landroid/graphics/PointF;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    return v1

    .line 34
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/folderbatch/FolderBatch;->b0(Landroid/view/MotionEvent;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_1
    return v1
.end method

.method protected onFinishInflate()V
    .locals 8

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const v0, 0x7f0b0279

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Landroid/widget/LinearLayout;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->k:Landroid/widget/LinearLayout;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 34
    .line 35
    iget v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->m:I

    .line 36
    .line 37
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string v1, "onFinishInflate--mLandRightArea is null--orientation: "

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const-string v1, "FolderBatch"

    .line 68
    .line 69
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    :cond_1
    :goto_0
    const v0, 0x7f0b0278

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Landroid/widget/FrameLayout;

    .line 80
    .line 81
    iput-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->q:Landroid/widget/FrameLayout;

    .line 82
    .line 83
    const v0, 0x7f0b0273

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;

    .line 91
    .line 92
    iput-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->p:Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;

    .line 93
    .line 94
    iget-object v1, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->s:Lcom/android/launcher3/folderbatch/d;

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 97
    .line 98
    .line 99
    invoke-static {}, Lx1/O;->k1()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    const/4 v1, 0x1

    .line 104
    if-eqz v0, :cond_2

    .line 105
    .line 106
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->p:Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;

    .line 107
    .line 108
    new-instance v2, Lcom/android/launcher3/folderbatch/FocusStaggeredGridLayoutManager;

    .line 109
    .line 110
    iget-object v3, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->s:Lcom/android/launcher3/folderbatch/d;

    .line 111
    .line 112
    invoke-virtual {v3}, Lcom/android/launcher3/folderbatch/d;->g()I

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    iget-object v4, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->p:Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;

    .line 117
    .line 118
    invoke-direct {v2, v3, v1, v4}, Lcom/android/launcher3/folderbatch/FocusStaggeredGridLayoutManager;-><init>(IILandroidx/recyclerview/widget/RecyclerView;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v2}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 122
    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->p:Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;

    .line 126
    .line 127
    new-instance v2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 128
    .line 129
    iget-object v3, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->s:Lcom/android/launcher3/folderbatch/d;

    .line 130
    .line 131
    invoke-virtual {v3}, Lcom/android/launcher3/folderbatch/d;->g()I

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    invoke-direct {v2, v3, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;-><init>(II)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, v2}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 139
    .line 140
    .line 141
    :goto_1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-eqz v0, :cond_3

    .line 146
    .line 147
    new-instance v0, Lv1/b;

    .line 148
    .line 149
    new-instance v2, Lcom/android/launcher3/keyboard/b;

    .line 150
    .line 151
    iget-object v3, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->p:Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;

    .line 152
    .line 153
    invoke-direct {v2, v3}, Lcom/android/launcher3/keyboard/b;-><init>(Landroid/view/View;)V

    .line 154
    .line 155
    .line 156
    invoke-direct {v0, v2}, Lv1/b;-><init>(Lv1/a;)V

    .line 157
    .line 158
    .line 159
    iget-object v2, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->p:Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;

    .line 160
    .line 161
    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v0}, Lv1/b;->a()Landroid/view/View$OnFocusChangeListener;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    iget-object v2, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->s:Lcom/android/launcher3/folderbatch/d;

    .line 169
    .line 170
    invoke-virtual {v2, v0}, Lcom/android/launcher3/folderbatch/d;->setIconFocusListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 171
    .line 172
    .line 173
    :cond_3
    const v0, 0x7f0b027a

    .line 174
    .line 175
    .line 176
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    check-cast v0, Landroid/widget/TextView;

    .line 181
    .line 182
    iput-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->r:Landroid/widget/TextView;

    .line 183
    .line 184
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    const/4 v2, 0x0

    .line 193
    if-eqz v0, :cond_4

    .line 194
    .line 195
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->r:Landroid/widget/TextView;

    .line 196
    .line 197
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    const v4, 0x7f070344

    .line 202
    .line 203
    .line 204
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 205
    .line 206
    .line 207
    move-result v3

    .line 208
    invoke-virtual {v0, v2, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 209
    .line 210
    .line 211
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->p:Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;

    .line 212
    .line 213
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 218
    .line 219
    iget v3, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->m:I

    .line 220
    .line 221
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 222
    .line 223
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    const v3, 0x7f0b0277

    .line 228
    .line 229
    .line 230
    if-eqz v0, :cond_8

    .line 231
    .line 232
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    iget-object v4, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 237
    .line 238
    invoke-virtual {v4}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 239
    .line 240
    .line 241
    move-result-object v4

    .line 242
    iget-boolean v4, v4, Lcom/android/launcher3/h0;->N0:Z

    .line 243
    .line 244
    if-eqz v4, :cond_5

    .line 245
    .line 246
    const v4, 0x7f0c007a

    .line 247
    .line 248
    .line 249
    goto :goto_2

    .line 250
    :cond_5
    const v4, 0x7f0c0079

    .line 251
    .line 252
    .line 253
    :goto_2
    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getInteger(I)I

    .line 254
    .line 255
    .line 256
    move-result v0

    .line 257
    int-to-float v0, v0

    .line 258
    invoke-static {v0}, Lcom/android/launcher3/N5;->T(F)I

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 263
    .line 264
    .line 265
    move-result-object v4

    .line 266
    iget-object v5, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 267
    .line 268
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 269
    .line 270
    .line 271
    move-result-object v5

    .line 272
    iget-boolean v5, v5, Lcom/android/launcher3/h0;->N0:Z

    .line 273
    .line 274
    if-eqz v5, :cond_6

    .line 275
    .line 276
    const v5, 0x7f0c0076

    .line 277
    .line 278
    .line 279
    goto :goto_3

    .line 280
    :cond_6
    const v5, 0x7f0c0075

    .line 281
    .line 282
    .line 283
    :goto_3
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getInteger(I)I

    .line 284
    .line 285
    .line 286
    move-result v4

    .line 287
    int-to-float v4, v4

    .line 288
    invoke-static {v4}, Lcom/android/launcher3/N5;->T(F)I

    .line 289
    .line 290
    .line 291
    move-result v4

    .line 292
    iget-object v5, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->r:Landroid/widget/TextView;

    .line 293
    .line 294
    const-string v6, "sans-serif-medium"

    .line 295
    .line 296
    invoke-static {v6, v2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 297
    .line 298
    .line 299
    move-result-object v6

    .line 300
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 301
    .line 302
    .line 303
    invoke-virtual {p0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 304
    .line 305
    .line 306
    move-result-object v5

    .line 307
    check-cast v5, Landroid/widget/Button;

    .line 308
    .line 309
    if-eqz v5, :cond_9

    .line 310
    .line 311
    invoke-virtual {v5}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 312
    .line 313
    .line 314
    move-result-object v6

    .line 315
    instance-of v6, v6, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 316
    .line 317
    if-eqz v6, :cond_9

    .line 318
    .line 319
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 320
    .line 321
    .line 322
    move-result-object v6

    .line 323
    iget-object v7, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->u:Lcom/android/launcher3/C2;

    .line 324
    .line 325
    invoke-virtual {v7}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 326
    .line 327
    .line 328
    move-result-object v7

    .line 329
    iget-boolean v7, v7, Lcom/android/launcher3/h0;->N0:Z

    .line 330
    .line 331
    if-eqz v7, :cond_7

    .line 332
    .line 333
    const v7, 0x7f0c006e

    .line 334
    .line 335
    .line 336
    goto :goto_4

    .line 337
    :cond_7
    const v7, 0x7f0c006d

    .line 338
    .line 339
    .line 340
    :goto_4
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getInteger(I)I

    .line 341
    .line 342
    .line 343
    move-result v6

    .line 344
    int-to-float v6, v6

    .line 345
    invoke-static {v6}, Lcom/android/launcher3/N5;->T(F)I

    .line 346
    .line 347
    .line 348
    move-result v6

    .line 349
    invoke-virtual {v5}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 350
    .line 351
    .line 352
    move-result-object v5

    .line 353
    check-cast v5, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 354
    .line 355
    invoke-virtual {v5, v6}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 356
    .line 357
    .line 358
    goto :goto_5

    .line 359
    :cond_8
    move v0, v2

    .line 360
    move v4, v0

    .line 361
    :cond_9
    :goto_5
    iget-object v5, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->q:Landroid/widget/FrameLayout;

    .line 362
    .line 363
    invoke-virtual {v5, v2, v0, v2, v4}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 364
    .line 365
    .line 366
    invoke-virtual {p0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 367
    .line 368
    .line 369
    move-result-object v0

    .line 370
    check-cast v0, Landroid/widget/TextView;

    .line 371
    .line 372
    iput-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->v:Landroid/widget/TextView;

    .line 373
    .line 374
    new-instance v3, Lcom/android/launcher3/folderbatch/b;

    .line 375
    .line 376
    invoke-direct {v3, p0}, Lcom/android/launcher3/folderbatch/b;-><init>(Lcom/android/launcher3/folderbatch/FolderBatch;)V

    .line 377
    .line 378
    .line 379
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 380
    .line 381
    .line 382
    const v0, 0x7f0b0275

    .line 383
    .line 384
    .line 385
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 386
    .line 387
    .line 388
    move-result-object v0

    .line 389
    check-cast v0, Landroid/widget/TextView;

    .line 390
    .line 391
    iput-object v0, p0, Lcom/android/launcher3/folderbatch/FolderBatch;->w:Landroid/widget/TextView;

    .line 392
    .line 393
    new-instance v3, Lcom/android/launcher3/folderbatch/c;

    .line 394
    .line 395
    invoke-direct {v3, p0}, Lcom/android/launcher3/folderbatch/c;-><init>(Lcom/android/launcher3/folderbatch/FolderBatch;)V

    .line 396
    .line 397
    .line 398
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 399
    .line 400
    .line 401
    const/4 v0, 0x0

    .line 402
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 403
    .line 404
    .line 405
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 406
    .line 407
    .line 408
    move-result-object v0

    .line 409
    check-cast v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 410
    .line 411
    if-nez v0, :cond_a

    .line 412
    .line 413
    new-instance v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 414
    .line 415
    invoke-direct {v0, v2, v2}, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;-><init>(II)V

    .line 416
    .line 417
    .line 418
    iput-boolean v1, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->d:Z

    .line 419
    .line 420
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 421
    .line 422
    .line 423
    :cond_a
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
