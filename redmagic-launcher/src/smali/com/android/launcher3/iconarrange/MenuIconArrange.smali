.class public Lcom/android/launcher3/iconarrange/MenuIconArrange;
.super Landroid/widget/FrameLayout;
.source "MenuIconArrange.java"

# interfaces
.implements Lcom/android/launcher3/n0;
.implements Lcom/android/launcher3/menu/c$a;


# instance fields
.field private A:Z

.field private B:I

.field private C:I

.field private D:I

.field private E:I

.field private F:F

.field private G:I

.field private H:I

.field private I:I

.field private J:I

.field private K:Z

.field private L:Landroid/widget/OverScroller;

.field private M:I

.field private g:I

.field private h:Landroid/os/Handler;

.field protected final i:Z

.field private j:Landroid/content/Context;

.field private k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field private l:Landroidx/recyclerview/widget/RecyclerView;

.field private m:Lcom/android/launcher3/C2;

.field private n:Lcom/android/launcher3/iconarrange/l;

.field private o:Landroidx/recyclerview/widget/LinearLayoutManager;

.field private p:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/iconarrange/b;",
            ">;"
        }
    .end annotation
.end field

.field private q:I

.field public r:I

.field public s:I

.field private t:I

.field private u:I

.field private v:I

.field private w:I

.field private x:I

.field private y:I

.field private z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->k:Ljava/util/List;

    .line 4
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->p:Ljava/util/ArrayList;

    const/4 p2, 0x0

    .line 5
    iput-boolean p2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->A:Z

    .line 6
    iput p2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->E:I

    .line 7
    iput-boolean p2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->K:Z

    const/4 p2, -0x1

    .line 8
    iput p2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->M:I

    .line 9
    iput-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->j:Landroid/content/Context;

    .line 10
    move-object p2, p1

    check-cast p2, Lcom/android/launcher3/C2;

    iput-object p2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 11
    new-instance p2, Landroid/os/Handler;

    invoke-direct {p2}, Landroid/os/Handler;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->h:Landroid/os/Handler;

    .line 12
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-static {p2}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    move-result p2

    iput-boolean p2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->i:Z

    .line 13
    new-instance p2, Landroid/view/animation/PathInterpolator;

    const/high16 p3, 0x3f000000    # 0.5f

    const v0, 0x3f59999a    # 0.85f

    const v1, 0x3dcccccd    # 0.1f

    const v2, 0x3e4ccccd    # 0.2f

    invoke-direct {p2, v1, v2, p3, v0}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 14
    new-instance p3, Landroid/widget/OverScroller;

    invoke-direct {p3, p1, p2}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object p3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->L:Landroid/widget/OverScroller;

    .line 15
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0704ac

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->q:I

    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->H()V

    return-void
.end method

.method private A(IILcom/android/launcher3/util/t0;I)I
    .locals 3

    .line 1
    const/16 v0, -0xc9

    .line 2
    .line 3
    if-ne p4, v0, :cond_0

    .line 4
    .line 5
    iget p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->r:I

    .line 6
    .line 7
    iget p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->s:I

    .line 8
    .line 9
    mul-int/2addr p1, p0

    .line 10
    return p1

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    const/16 v0, -0x64

    .line 14
    .line 15
    invoke-virtual {p0, v0, p4}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 p4, 0x0

    .line 20
    if-eqz p0, :cond_4

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getOccupied()Lcom/android/launcher3/util/t0;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, p3}, Lcom/android/launcher3/util/t0;->b(Lcom/android/launcher3/util/t0;)V

    .line 27
    .line 28
    .line 29
    move p0, p4

    .line 30
    move v0, p0

    .line 31
    :goto_0
    if-ge p0, p1, :cond_3

    .line 32
    .line 33
    move v1, p4

    .line 34
    :goto_1
    if-ge v1, p2, :cond_2

    .line 35
    .line 36
    iget-object v2, p3, Lcom/android/launcher3/util/t0;->c:[[Z

    .line 37
    .line 38
    aget-object v2, v2, p0

    .line 39
    .line 40
    aget-boolean v2, v2, v1

    .line 41
    .line 42
    if-nez v2, :cond_1

    .line 43
    .line 44
    add-int/lit8 v0, v0, 0x1

    .line 45
    .line 46
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    add-int/lit8 p0, p0, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_3
    return v0

    .line 53
    :cond_4
    return p4
.end method

.method private B(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/CellLayout;I)[I
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1, p2, v0}, Lcom/android/launcher3/views/BaseDragLayer;->getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Lcom/android/launcher3/q4;->a0()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-object v1, p1, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_0

    .line 38
    .line 39
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFolderPageView()Lcom/android/launcher3/folder/FolderPagedView;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v1, v2, v0}, Lcom/android/launcher3/views/BaseDragLayer;->getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFolderPageView()Lcom/android/launcher3/folder/FolderPagedView;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    int-to-float v1, v1

    .line 61
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getContentWrapper()Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v2}, Landroid/view/View;->getScaleX()F

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    mul-float/2addr v1, v2

    .line 70
    float-to-int v1, v1

    .line 71
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getFolderPageView()Lcom/android/launcher3/folder/FolderPagedView;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    int-to-float v2, v2

    .line 80
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getContentWrapper()Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1}, Landroid/view/View;->getScaleY()F

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    mul-float/2addr v2, p1

    .line 89
    float-to-int p1, v2

    .line 90
    invoke-virtual {v0, v1, p1}, Landroid/graphics/Rect;->offset(II)V

    .line 91
    .line 92
    .line 93
    :cond_0
    invoke-virtual {p2}, Lcom/android/launcher3/CellLayout;->V()Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    invoke-virtual {p2}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    invoke-virtual {p2}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    invoke-virtual {p2}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    invoke-virtual {p2}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    mul-int/2addr p2, v3

    .line 114
    rem-int/2addr p3, p2

    .line 115
    rem-int p2, p3, v3

    .line 116
    .line 117
    div-int/2addr p3, v3

    .line 118
    if-eqz p1, :cond_1

    .line 119
    .line 120
    sub-int/2addr v3, p2

    .line 121
    add-int/lit8 p2, v3, -0x1

    .line 122
    .line 123
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 124
    .line 125
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    iget p1, p0, Lcom/android/launcher3/h0;->B1:I

    .line 130
    .line 131
    mul-int/2addr p2, v1

    .line 132
    sub-int/2addr v1, p1

    .line 133
    div-int/lit8 v1, v1, 0x2

    .line 134
    .line 135
    add-int/2addr p2, v1

    .line 136
    int-to-float p1, p2

    .line 137
    const/high16 p2, 0x3f400000    # 0.75f

    .line 138
    .line 139
    mul-float/2addr p1, p2

    .line 140
    mul-int/2addr p3, v2

    .line 141
    iget p0, p0, Lcom/android/launcher3/X3;->s:I

    .line 142
    .line 143
    add-int/2addr p3, p0

    .line 144
    int-to-float p0, p3

    .line 145
    mul-float/2addr p0, p2

    .line 146
    iget p2, v0, Landroid/graphics/Rect;->left:I

    .line 147
    .line 148
    float-to-int p1, p1

    .line 149
    add-int/2addr p2, p1

    .line 150
    iget p1, v0, Landroid/graphics/Rect;->top:I

    .line 151
    .line 152
    float-to-int p0, p0

    .line 153
    add-int/2addr p1, p0

    .line 154
    filled-new-array {p2, p1}, [I

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    return-object p0
.end method

.method private C(Lcom/android/launcher3/n0$a;)V
    .locals 7

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->v(Lcom/android/launcher3/n0$a;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->M:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eq v0, v1, :cond_2

    .line 9
    .line 10
    if-ltz v0, :cond_2

    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->o:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->s()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    iget-object v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 19
    .line 20
    sub-int v4, v0, v1

    .line 21
    .line 22
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    if-eqz v3, :cond_0

    .line 27
    .line 28
    iget-object v4, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 29
    .line 30
    const v5, 0x7f04049a

    .line 31
    .line 32
    .line 33
    invoke-static {v4}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    invoke-static {v4, v5, v6}, Lcom/android/launcher3/util/F2;->f(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v3, v4}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->M:I

    .line 45
    .line 46
    const/4 v4, -0x1

    .line 47
    if-eq v3, v4, :cond_1

    .line 48
    .line 49
    iget-object v4, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 50
    .line 51
    sub-int/2addr v3, v1

    .line 52
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    iput v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->M:I

    .line 62
    .line 63
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_3

    .line 74
    .line 75
    iget v0, p1, Lcom/android/launcher3/n0$a;->b:I

    .line 76
    .line 77
    iget-object v1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 78
    .line 79
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getHeight()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    div-int/lit8 v1, v1, 0x2

    .line 84
    .line 85
    iget-object v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 86
    .line 87
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    iget v3, v3, Lcom/android/launcher3/h0;->U0:I

    .line 92
    .line 93
    iget-object v4, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 94
    .line 95
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getHeight()I

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    div-int/lit8 v4, v4, 0x2

    .line 100
    .line 101
    :goto_0
    sub-int/2addr v3, v4

    .line 102
    goto :goto_1

    .line 103
    :cond_3
    iget v0, p1, Lcom/android/launcher3/n0$a;->a:I

    .line 104
    .line 105
    iget-object v1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 106
    .line 107
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getWidth()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    div-int/lit8 v1, v1, 0x2

    .line 112
    .line 113
    iget-object v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 114
    .line 115
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    iget v3, v3, Lcom/android/launcher3/h0;->T0:I

    .line 120
    .line 121
    iget-object v4, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 122
    .line 123
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getWidth()I

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    div-int/lit8 v4, v4, 0x2

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :goto_1
    if-lt v0, v1, :cond_4

    .line 131
    .line 132
    if-gt v0, v3, :cond_4

    .line 133
    .line 134
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->h:Landroid/os/Handler;

    .line 135
    .line 136
    invoke-virtual {p1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    const/4 p1, 0x0

    .line 140
    iput-boolean p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->A:Z

    .line 141
    .line 142
    return-void

    .line 143
    :cond_4
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->L:Landroid/widget/OverScroller;

    .line 144
    .line 145
    invoke-virtual {v2}, Landroid/widget/OverScroller;->isFinished()Z

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    if-eqz v2, :cond_6

    .line 150
    .line 151
    iget-boolean v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->A:Z

    .line 152
    .line 153
    if-nez v2, :cond_6

    .line 154
    .line 155
    if-ge v0, v1, :cond_5

    .line 156
    .line 157
    invoke-direct {p0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->S()V

    .line 158
    .line 159
    .line 160
    goto :goto_2

    .line 161
    :cond_5
    invoke-direct {p0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->T()V

    .line 162
    .line 163
    .line 164
    :goto_2
    const/4 v0, 0x1

    .line 165
    iput-boolean v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->A:Z

    .line 166
    .line 167
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->h:Landroid/os/Handler;

    .line 168
    .line 169
    new-instance v1, Lcom/android/launcher3/iconarrange/MenuIconArrange$b;

    .line 170
    .line 171
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange$b;-><init>(Lcom/android/launcher3/iconarrange/MenuIconArrange;Lcom/android/launcher3/n0$a;)V

    .line 172
    .line 173
    .line 174
    const-wide/16 p0, 0x15e

    .line 175
    .line 176
    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 177
    .line 178
    .line 179
    :cond_6
    return-void
.end method

.method private E(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    add-int/2addr v1, v2

    .line 14
    sub-int/2addr v0, v1

    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    add-int/2addr v2, p1

    .line 28
    sub-int/2addr v1, v2

    .line 29
    iget p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->r:I

    .line 30
    .line 31
    div-int/2addr v0, p1

    .line 32
    iput v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->I:I

    .line 33
    .line 34
    iget p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->s:I

    .line 35
    .line 36
    div-int/2addr v1, p1

    .line 37
    iput v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->J:I

    .line 38
    .line 39
    return-void
.end method

.method private L()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->x:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    sget v1, Lcom/android/launcher3/folder/i0;->m:F

    .line 5
    .line 6
    mul-float/2addr v0, v1

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget v1, v1, Lcom/android/launcher3/X3;->O:F

    .line 14
    .line 15
    mul-float/2addr v0, v1

    .line 16
    float-to-int v0, v0

    .line 17
    iput v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->B:I

    .line 18
    .line 19
    iget v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->x:I

    .line 20
    .line 21
    int-to-float v0, v0

    .line 22
    sget v1, Lcom/android/launcher3/folder/i0;->n:F

    .line 23
    .line 24
    mul-float/2addr v0, v1

    .line 25
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget v1, v1, Lcom/android/launcher3/X3;->O:F

    .line 32
    .line 33
    mul-float/2addr v0, v1

    .line 34
    float-to-int v0, v0

    .line 35
    iput v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->C:I

    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/android/launcher3/F1;->K0:[I

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    aget v0, v0, v1

    .line 49
    .line 50
    iget v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->x:I

    .line 51
    .line 52
    int-to-float v1, v1

    .line 53
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 54
    .line 55
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    iget v2, v2, Lcom/android/launcher3/X3;->O:F

    .line 60
    .line 61
    mul-float/2addr v1, v2

    .line 62
    float-to-int v1, v1

    .line 63
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->B:I

    .line 64
    .line 65
    mul-int/2addr v2, v0

    .line 66
    add-int/lit8 v0, v0, -0x1

    .line 67
    .line 68
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->C:I

    .line 69
    .line 70
    mul-int/2addr v0, v3

    .line 71
    add-int/2addr v2, v0

    .line 72
    sub-int/2addr v1, v2

    .line 73
    div-int/lit8 v1, v1, 0x2

    .line 74
    .line 75
    iput v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->D:I

    .line 76
    .line 77
    return-void
.end method

.method private synthetic N(Lcom/android/launcher3/n0$a;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 7
    .line 8
    instance-of v2, v1, Lcom/android/launcher3/model/data/p;

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    check-cast v1, Lcom/android/launcher3/model/data/p;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/p;->E()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v2, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 29
    .line 30
    iget v2, v2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 31
    .line 32
    const/16 v3, -0x64

    .line 33
    .line 34
    invoke-virtual {v1, v0, v3, v2}, Lz1/J3;->U(Ljava/util/ArrayList;II)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 38
    .line 39
    instance-of p1, p1, Lcom/android/launcher3/model/data/p;

    .line 40
    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    invoke-direct {p0, v0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->Y(Ljava/util/List;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 48
    .line 49
    const/4 v1, 0x0

    .line 50
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/C2;->L(Ljava/util/List;Z)V

    .line 51
    .line 52
    .line 53
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->Q()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method private S()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lcom/android/launcher3/X3;->t()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    neg-int v1, v1

    .line 28
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->q:I

    .line 29
    .line 30
    :goto_0
    mul-int/lit8 v2, v2, 0x2

    .line 31
    .line 32
    sub-int/2addr v1, v2

    .line 33
    move v3, v0

    .line 34
    move v5, v1

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Lcom/android/launcher3/X3;->u()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    neg-int v1, v1

    .line 51
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->q:I

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->j:Landroid/content/Context;

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 65
    .line 66
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    int-to-float v1, v1

    .line 71
    const/high16 v2, 0x43960000    # 300.0f

    .line 72
    .line 73
    mul-float/2addr v1, v2

    .line 74
    const/high16 v2, 0x42ac0000    # 86.0f

    .line 75
    .line 76
    mul-float/2addr v0, v2

    .line 77
    div-float/2addr v1, v0

    .line 78
    float-to-int v7, v1

    .line 79
    iput v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->g:I

    .line 80
    .line 81
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->L:Landroid/widget/OverScroller;

    .line 82
    .line 83
    const/4 v4, 0x0

    .line 84
    const/4 v6, 0x0

    .line 85
    invoke-virtual/range {v2 .. v7}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method private T()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lcom/android/launcher3/X3;->t()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->q:I

    .line 28
    .line 29
    :goto_0
    mul-int/lit8 v2, v2, 0x2

    .line 30
    .line 31
    add-int/2addr v1, v2

    .line 32
    move v3, v0

    .line 33
    move v5, v1

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Lcom/android/launcher3/X3;->u()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->q:I

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->j:Landroid/content/Context;

    .line 53
    .line 54
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 63
    .line 64
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    int-to-float v1, v1

    .line 69
    const/high16 v2, 0x43960000    # 300.0f

    .line 70
    .line 71
    mul-float/2addr v1, v2

    .line 72
    const/high16 v2, 0x42ac0000    # 86.0f

    .line 73
    .line 74
    mul-float/2addr v0, v2

    .line 75
    div-float/2addr v1, v0

    .line 76
    float-to-int v7, v1

    .line 77
    iput v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->g:I

    .line 78
    .line 79
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->L:Landroid/widget/OverScroller;

    .line 80
    .line 81
    const/4 v4, 0x0

    .line 82
    const/4 v6, 0x0

    .line 83
    invoke-virtual/range {v2 .. v7}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method private W(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/iconarrange/b;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->p:Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-ge p0, v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/android/launcher3/iconarrange/b;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/iconarrange/b;->a()Lcom/android/launcher3/iconarrange/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/iconarrange/c;->c()V

    .line 21
    .line 22
    .line 23
    add-int/lit8 p0, p0, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method private X(I)V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ge p1, v0, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const v1, 0x7f14025b

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const v1, 0x7f14025a

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private Y(Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    :goto_0
    if-ge v2, v1, :cond_2

    .line 13
    .line 14
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 19
    .line 20
    iget-object v4, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 21
    .line 22
    invoke-virtual {v4}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    iget-boolean v4, v4, Lcom/android/launcher3/X3;->B0:Z

    .line 27
    .line 28
    if-eqz v4, :cond_0

    .line 29
    .line 30
    const v4, 0x7f0e0246

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    const v4, 0x7f0e00e0

    .line 35
    .line 36
    .line 37
    :goto_1
    iget-object v5, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->getValidateCurrentPage()I

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    invoke-virtual {v0, v6}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v6

    .line 47
    check-cast v6, Landroid/view/ViewGroup;

    .line 48
    .line 49
    move-object v7, v3

    .line 50
    check-cast v7, Lcom/android/launcher3/model/data/p;

    .line 51
    .line 52
    invoke-static {v4, v5, v6, v7}, Lcom/android/launcher3/folder/FolderIcon;->K(ILandroid/content/Context;Landroid/view/ViewGroup;Lcom/android/launcher3/model/data/p;)Lcom/android/launcher3/folder/FolderIcon;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    new-instance v5, Lk1/b;

    .line 57
    .line 58
    invoke-direct {v5}, Lk1/b;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v7}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 62
    .line 63
    .line 64
    move-result-object v6

    .line 65
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 70
    .line 71
    .line 72
    move-result v7

    .line 73
    if-eqz v7, :cond_1

    .line 74
    .line 75
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v7

    .line 79
    check-cast v7, Lcom/android/launcher3/model/data/y;

    .line 80
    .line 81
    iget-object v8, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 82
    .line 83
    invoke-virtual {v8, v7}, Lcom/android/launcher3/C2;->getDotInfoForItem(Lcom/android/launcher3/model/data/y;)Lk1/a;

    .line 84
    .line 85
    .line 86
    move-result-object v7

    .line 87
    invoke-virtual {v5, v8, v7}, Lk1/b;->i(Landroid/content/Context;Lk1/a;)V

    .line 88
    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_1
    invoke-virtual {v4, v5}, Lcom/android/launcher3/folder/FolderIcon;->setDotInfo(Lk1/b;)V

    .line 92
    .line 93
    .line 94
    invoke-interface {v0, v4, v3}, Lcom/android/launcher3/M6;->j(Landroid/view/View;Lcom/android/launcher3/model/data/y;)V

    .line 95
    .line 96
    .line 97
    add-int/lit8 v2, v2, 0x1

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_2
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    instance-of p0, p1, Lcom/android/launcher3/widget/T;

    .line 6
    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 10
    .line 11
    .line 12
    :cond_1
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public static synthetic d(Lcom/android/launcher3/iconarrange/MenuIconArrange;Lcom/android/launcher3/n0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->N(Lcom/android/launcher3/n0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic e(Lcom/android/launcher3/iconarrange/MenuIconArrange;)Lcom/android/launcher3/C2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/iconarrange/MenuIconArrange;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->A:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic h(Lcom/android/launcher3/iconarrange/MenuIconArrange;Lcom/android/launcher3/n0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->C(Lcom/android/launcher3/n0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private v(Lcom/android/launcher3/n0$a;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->w(Lcom/android/launcher3/n0$a;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private w(Lcom/android/launcher3/n0$a;)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->o:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->v()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->o:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->s()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    sub-int v2, v0, v1

    .line 14
    .line 15
    new-instance v3, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v4, "getDropPagedIndexInPreviewRegion lastVisibleItemPosition:"

    .line 21
    .line 22
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v4, " firstVisibleItemPosition:"

    .line 29
    .line 30
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v4, " visibleCount:"

    .line 37
    .line 38
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    const-string v4, "MenuIconArrange"

    .line 49
    .line 50
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    iget-object v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->o:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 54
    .line 55
    invoke-virtual {v3, v2}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    const/4 v3, -0x1

    .line 60
    if-eq v0, v3, :cond_5

    .line 61
    .line 62
    if-eq v1, v3, :cond_5

    .line 63
    .line 64
    if-nez v2, :cond_0

    .line 65
    .line 66
    goto/16 :goto_1

    .line 67
    .line 68
    :cond_0
    const/4 v0, 0x2

    .line 69
    new-array v1, v0, [I

    .line 70
    .line 71
    invoke-virtual {v2, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 72
    .line 73
    .line 74
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 75
    .line 76
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {v2}, Lcom/android/launcher3/h0;->T0()Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    const/4 v3, 0x0

    .line 85
    if-eqz v2, :cond_1

    .line 86
    .line 87
    const/4 v2, 0x1

    .line 88
    aget v1, v1, v2

    .line 89
    .line 90
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 91
    .line 92
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v2}, Lcom/android/launcher3/X3;->t()I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    add-int/2addr v1, v2

    .line 101
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->q:I

    .line 102
    .line 103
    add-int/2addr v1, v2

    .line 104
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 105
    .line 106
    invoke-virtual {p1}, Lcom/android/launcher3/dragndrop/v;->getLastTouchY()I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    sub-int/2addr v1, p1

    .line 111
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 112
    .line 113
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p1}, Lcom/android/launcher3/X3;->t()I

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->q:I

    .line 122
    .line 123
    mul-int/2addr v2, v0

    .line 124
    add-int/2addr p1, v2

    .line 125
    div-int/2addr v1, p1

    .line 126
    goto :goto_0

    .line 127
    :cond_1
    iget-boolean v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->i:Z

    .line 128
    .line 129
    if-eqz v2, :cond_2

    .line 130
    .line 131
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 132
    .line 133
    invoke-virtual {p1}, Lcom/android/launcher3/dragndrop/v;->getLastTouchX()I

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    aget v1, v1, v3

    .line 138
    .line 139
    sub-int/2addr p1, v1

    .line 140
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 141
    .line 142
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-virtual {v1}, Lcom/android/launcher3/X3;->u()I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->q:I

    .line 151
    .line 152
    mul-int/2addr v2, v0

    .line 153
    add-int/2addr v1, v2

    .line 154
    div-int v1, p1, v1

    .line 155
    .line 156
    goto :goto_0

    .line 157
    :cond_2
    aget v1, v1, v3

    .line 158
    .line 159
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 160
    .line 161
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    invoke-virtual {v2}, Lcom/android/launcher3/X3;->u()I

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    add-int/2addr v1, v2

    .line 170
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->q:I

    .line 171
    .line 172
    add-int/2addr v1, v2

    .line 173
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 174
    .line 175
    invoke-virtual {p1}, Lcom/android/launcher3/dragndrop/v;->getLastTouchX()I

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    sub-int/2addr v1, p1

    .line 180
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 181
    .line 182
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-virtual {p1}, Lcom/android/launcher3/X3;->u()I

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->q:I

    .line 191
    .line 192
    mul-int/2addr v2, v0

    .line 193
    add-int/2addr p1, v2

    .line 194
    div-int/2addr v1, p1

    .line 195
    :goto_0
    if-gez v1, :cond_3

    .line 196
    .line 197
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->o:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 198
    .line 199
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->v()I

    .line 200
    .line 201
    .line 202
    move-result p0

    .line 203
    return p0

    .line 204
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->o:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 205
    .line 206
    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->v()I

    .line 207
    .line 208
    .line 209
    move-result p1

    .line 210
    if-ge p1, v1, :cond_4

    .line 211
    .line 212
    return v3

    .line 213
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->o:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 214
    .line 215
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->v()I

    .line 216
    .line 217
    .line 218
    move-result p0

    .line 219
    sub-int/2addr p0, v1

    .line 220
    return p0

    .line 221
    :cond_5
    :goto_1
    return v3
.end method

.method private x(Lcom/android/launcher3/n0$a;I[F)V
    .locals 3

    .line 1
    new-instance p0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    .line 15
    .line 16
    invoke-virtual {p2, p0}, Lcom/android/launcher3/BubbleTextView;->d0(Landroid/graphics/Rect;)V

    .line 17
    .line 18
    .line 19
    iget-object p2, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 20
    .line 21
    invoke-virtual {p2}, Lcom/android/launcher3/dragndrop/v;->getInitialScale()F

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/v;->getLastTouchX()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    int-to-float v1, v1

    .line 36
    mul-float/2addr v1, p2

    .line 37
    const/high16 v2, 0x40000000    # 2.0f

    .line 38
    .line 39
    div-float/2addr v1, v2

    .line 40
    float-to-int v1, v1

    .line 41
    sub-int/2addr v0, v1

    .line 42
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/android/launcher3/dragndrop/v;->getLastTouchY()I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    int-to-float p0, p0

    .line 53
    mul-float/2addr p0, p2

    .line 54
    div-float/2addr p0, v2

    .line 55
    float-to-int p0, p0

    .line 56
    sub-int/2addr p1, p0

    .line 57
    const/4 p0, 0x0

    .line 58
    aput p2, p3, p0

    .line 59
    .line 60
    const/4 p0, 0x1

    .line 61
    int-to-float p2, v0

    .line 62
    aput p2, p3, p0

    .line 63
    .line 64
    const/4 p0, 0x2

    .line 65
    int-to-float p1, p1

    .line 66
    aput p1, p3, p0

    .line 67
    .line 68
    return-void
.end method

.method private y(I[F)V
    .locals 6

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->L()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 11
    .line 12
    iget v1, v0, Lcom/android/launcher3/r4;->U:I

    .line 13
    .line 14
    rem-int/2addr p1, v1

    .line 15
    iget-object v0, v0, Lcom/android/launcher3/F1;->K0:[I

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    aget v0, v0, v1

    .line 19
    .line 20
    div-int v2, p1, v0

    .line 21
    .line 22
    rem-int v0, p1, v0

    .line 23
    .line 24
    const/16 v3, 0x8

    .line 25
    .line 26
    const/4 v4, 0x1

    .line 27
    if-lt p1, v3, :cond_0

    .line 28
    .line 29
    iget p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->D:I

    .line 30
    .line 31
    iget v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->B:I

    .line 32
    .line 33
    mul-int/lit8 v2, v0, 0x2

    .line 34
    .line 35
    add-int/2addr v2, p1

    .line 36
    iget p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->C:I

    .line 37
    .line 38
    mul-int/lit8 v3, p0, 0x2

    .line 39
    .line 40
    add-int/2addr v2, v3

    .line 41
    int-to-float v2, v2

    .line 42
    aput v2, p2, v1

    .line 43
    .line 44
    mul-int/lit8 v0, v0, 0x2

    .line 45
    .line 46
    add-int/2addr p1, v0

    .line 47
    mul-int/lit8 p0, p0, 0x2

    .line 48
    .line 49
    add-int/2addr p1, p0

    .line 50
    int-to-float p0, p1

    .line 51
    aput p0, p2, v4

    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    iget p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->D:I

    .line 55
    .line 56
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->B:I

    .line 57
    .line 58
    mul-int v5, v0, v3

    .line 59
    .line 60
    add-int/2addr v5, p1

    .line 61
    iget p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->C:I

    .line 62
    .line 63
    mul-int/2addr v0, p0

    .line 64
    add-int/2addr v5, v0

    .line 65
    int-to-float v0, v5

    .line 66
    aput v0, p2, v1

    .line 67
    .line 68
    mul-int/2addr v3, v2

    .line 69
    add-int/2addr p1, v3

    .line 70
    mul-int/2addr v2, p0

    .line 71
    add-int/2addr p1, v2

    .line 72
    int-to-float p0, p1

    .line 73
    aput p0, p2, v4

    .line 74
    .line 75
    return-void
.end method


# virtual methods
.method public D()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_3

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->getDragInfo()Lc1/a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->getDragInfo()Lc1/a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v0, v0, Lc1/a;->e:Landroid/view/View;

    .line 31
    .line 32
    instance-of v0, v0, Lcom/android/launcher3/widget/T;

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    return v1

    .line 37
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->getDragInfo()Lc1/a;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/4 v2, 0x1

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->getDragInfo()Lc1/a;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v0, v0, Lc1/a;->e:Landroid/view/View;

    .line 61
    .line 62
    instance-of v0, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 63
    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->getDragInfo()Lc1/a;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget-object v0, v0, Lc1/a;->e:Landroid/view/View;

    .line 77
    .line 78
    check-cast v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 79
    .line 80
    iget-object v0, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 81
    .line 82
    if-eqz v0, :cond_2

    .line 83
    .line 84
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 85
    .line 86
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->getDragInfo()Lc1/a;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object v0, v0, Lc1/a;->e:Landroid/view/View;

    .line 95
    .line 96
    check-cast v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 97
    .line 98
    iget-object v0, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 99
    .line 100
    iget v0, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 101
    .line 102
    if-ne v0, v2, :cond_1

    .line 103
    .line 104
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 105
    .line 106
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getDragInfo()Lc1/a;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    iget-object p0, p0, Lc1/a;->e:Landroid/view/View;

    .line 115
    .line 116
    check-cast p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 117
    .line 118
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 119
    .line 120
    iget p0, p0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 121
    .line 122
    if-eq p0, v2, :cond_2

    .line 123
    .line 124
    :cond_1
    return v1

    .line 125
    :cond_2
    return v2

    .line 126
    :cond_3
    return v1
.end method

.method public F()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->U()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->i()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->k:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    :goto_0
    if-ge v1, v0, :cond_0

    .line 24
    .line 25
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->k:Ljava/util/List;

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    add-int/lit8 v1, v1, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->n:Lcom/android/launcher3/iconarrange/l;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->n:Lcom/android/launcher3/iconarrange/l;

    .line 40
    .line 41
    new-instance v1, Lcom/android/launcher3/iconarrange/MenuIconArrange$a;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Lcom/android/launcher3/iconarrange/MenuIconArrange$a;-><init>(Lcom/android/launcher3/iconarrange/MenuIconArrange;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lcom/android/launcher3/iconarrange/l;->h(Lcom/android/launcher3/iconarrange/l$b;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iput v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->G:I

    .line 60
    .line 61
    return-void
.end method

.method public G(Lcom/android/launcher3/n0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->C(Lcom/android/launcher3/n0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public H()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

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
    iput v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->r:I

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

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
    iput v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->s:I

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

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
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

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
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->r:I

    .line 46
    .line 47
    iget-object v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

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
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->s:I

    .line 57
    .line 58
    iget-object v4, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

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
    iget-object v4, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 68
    .line 69
    invoke-virtual {v4}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-virtual {v4}, Lcom/android/launcher3/h0;->T0()Z

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    if-eqz v4, :cond_0

    .line 78
    .line 79
    iget-object v4, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 80
    .line 81
    invoke-virtual {v4}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    iget v4, v4, Lcom/android/launcher3/h0;->U0:I

    .line 86
    .line 87
    iget v5, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->q:I

    .line 88
    .line 89
    mul-int/lit8 v5, v5, 0x2

    .line 90
    .line 91
    add-int/2addr v5, v1

    .line 92
    div-int/2addr v4, v5

    .line 93
    iput v4, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->H:I

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_0
    iget-object v4, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 97
    .line 98
    invoke-virtual {v4}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    iget v4, v4, Lcom/android/launcher3/h0;->T0:I

    .line 103
    .line 104
    iget v5, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->q:I

    .line 105
    .line 106
    mul-int/lit8 v5, v5, 0x2

    .line 107
    .line 108
    add-int/2addr v5, v0

    .line 109
    div-int/2addr v4, v5

    .line 110
    iput v4, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->H:I

    .line 111
    .line 112
    :goto_0
    iget-object v4, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 113
    .line 114
    invoke-virtual {v4}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    const v5, 0x7f0704ab

    .line 119
    .line 120
    .line 121
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 122
    .line 123
    .line 124
    move-result v4

    .line 125
    mul-int/lit8 v4, v4, 0x2

    .line 126
    .line 127
    sub-int v5, v0, v4

    .line 128
    .line 129
    int-to-float v5, v5

    .line 130
    int-to-float v2, v2

    .line 131
    div-float/2addr v5, v2

    .line 132
    sub-int v4, v1, v4

    .line 133
    .line 134
    int-to-float v4, v4

    .line 135
    int-to-float v3, v3

    .line 136
    div-float/2addr v4, v3

    .line 137
    cmpg-float v6, v5, v4

    .line 138
    .line 139
    if-gez v6, :cond_1

    .line 140
    .line 141
    iput v5, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->F:F

    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_1
    iput v4, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->F:F

    .line 145
    .line 146
    :goto_1
    iget v4, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->F:F

    .line 147
    .line 148
    mul-float/2addr v2, v4

    .line 149
    float-to-int v2, v2

    .line 150
    sub-int v2, v0, v2

    .line 151
    .line 152
    div-int/lit8 v2, v2, 0x2

    .line 153
    .line 154
    iput v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->t:I

    .line 155
    .line 156
    mul-float/2addr v4, v3

    .line 157
    float-to-int v3, v4

    .line 158
    sub-int v3, v1, v3

    .line 159
    .line 160
    div-int/lit8 v3, v3, 0x2

    .line 161
    .line 162
    iput v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->u:I

    .line 163
    .line 164
    mul-int/lit8 v2, v2, 0x2

    .line 165
    .line 166
    sub-int/2addr v0, v2

    .line 167
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->r:I

    .line 168
    .line 169
    div-int/2addr v0, v2

    .line 170
    iput v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->v:I

    .line 171
    .line 172
    mul-int/lit8 v3, v3, 0x2

    .line 173
    .line 174
    sub-int/2addr v1, v3

    .line 175
    iget v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->s:I

    .line 176
    .line 177
    div-int/2addr v1, v0

    .line 178
    iput v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->w:I

    .line 179
    .line 180
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 181
    .line 182
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    iget v0, v0, Lcom/android/launcher3/h0;->B1:I

    .line 187
    .line 188
    iput v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->x:I

    .line 189
    .line 190
    iget v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->v:I

    .line 191
    .line 192
    int-to-float v0, v0

    .line 193
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->F:F

    .line 194
    .line 195
    mul-float/2addr v0, v2

    .line 196
    float-to-int v0, v0

    .line 197
    sub-int/2addr v1, v0

    .line 198
    div-int/lit8 v1, v1, 0x2

    .line 199
    .line 200
    iput v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->y:I

    .line 201
    .line 202
    const/4 v0, 0x0

    .line 203
    iput v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->z:I

    .line 204
    .line 205
    return-void
.end method

.method public I(Lcom/android/launcher3/n0$a;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->v(Lcom/android/launcher3/n0$a;)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    new-instance v1, Lcom/android/launcher3/util/t0;

    .line 16
    .line 17
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->r:I

    .line 18
    .line 19
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->s:I

    .line 20
    .line 21
    invoke-direct {v1, v2, v3}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 22
    .line 23
    .line 24
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->r:I

    .line 25
    .line 26
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->s:I

    .line 27
    .line 28
    invoke-direct {p0, v2, v3, v1, v0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->A(IILcom/android/launcher3/util/t0;I)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->E:I

    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    if-ge v0, p0, :cond_0

    .line 36
    .line 37
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 38
    .line 39
    instance-of v0, v0, Lcom/android/launcher3/Workspace;

    .line 40
    .line 41
    if-nez v0, :cond_0

    .line 42
    .line 43
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-gt p1, p0, :cond_0

    .line 52
    .line 53
    const/4 p0, 0x0

    .line 54
    :cond_0
    return p0
.end method

.method public J(Lcom/android/launcher3/n0$a;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->A:Z

    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->h:Landroid/os/Handler;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->o:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->s()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    .line 18
    iget p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->M:I

    .line 19
    .line 20
    sub-int/2addr p0, p1

    .line 21
    invoke-virtual {v1, p0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public K(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onViewExisted-icon arrange "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "MenuIconArrange"

    .line 19
    .line 20
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->c2()Lcom/android/launcher3/helper/a;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Lcom/android/launcher3/helper/a;->e()V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 33
    .line 34
    const v0, 0x7f0b0303

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lcom/android/launcher3/statemanager/h;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    check-cast p1, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    invoke-virtual {p1, v0}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->setTopBarVisible(Z)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->R()V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->r1()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_0

    .line 61
    .line 62
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->w()Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-nez p1, :cond_0

    .line 67
    .line 68
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->i3()V

    .line 75
    .line 76
    .line 77
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 78
    .line 79
    invoke-static {p1, v0}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;Z)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->R1()Lcom/android/launcher3/DropTargetBar;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p1, v0}, Lcom/android/launcher3/DropTargetBar;->c(Z)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    new-instance p1, Lcom/android/launcher3/iconarrange/i;

    .line 98
    .line 99
    invoke-direct {p1}, Lcom/android/launcher3/iconarrange/i;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public M()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->K:Z

    .line 2
    .line 3
    return p0
.end method

.method public O(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->n:Lcom/android/launcher3/iconarrange/l;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public P(Z)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p1, 0x0

    .line 15
    :goto_0
    const v0, 0x7f0b03aa

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public Q()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_0

    .line 9
    .line 10
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Landroid/view/View;->invalidate()V

    .line 17
    .line 18
    .line 19
    add-int/lit8 v1, v1, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void
.end method

.method public R()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Lcom/android/launcher3/dragndrop/j;->O(Lcom/android/launcher3/n0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public U()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method V(Lcom/android/launcher3/n0$a;)V
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-direct/range {p0 .. p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->w(Lcom/android/launcher3/n0$a;)I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    iget-object v3, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->o:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 10
    .line 11
    invoke-virtual {v3}, Landroidx/recyclerview/widget/LinearLayoutManager;->s()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-ltz v2, :cond_9

    .line 16
    .line 17
    if-gez v3, :cond_0

    .line 18
    .line 19
    goto/16 :goto_7

    .line 20
    .line 21
    :cond_0
    sub-int/2addr v2, v3

    .line 22
    const/4 v3, 0x2

    .line 23
    new-array v4, v3, [I

    .line 24
    .line 25
    iget-object v5, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 26
    .line 27
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    invoke-direct/range {p0 .. p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->v(Lcom/android/launcher3/n0$a;)I

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    invoke-virtual {v5, v6}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    new-instance v6, Lcom/android/launcher3/util/t0;

    .line 40
    .line 41
    iget v7, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->r:I

    .line 42
    .line 43
    iget v8, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->s:I

    .line 44
    .line 45
    invoke-direct {v6, v7, v8}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 46
    .line 47
    .line 48
    iget v7, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->r:I

    .line 49
    .line 50
    iget v8, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->s:I

    .line 51
    .line 52
    invoke-direct {v0, v7, v8, v6, v5}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->A(IILcom/android/launcher3/util/t0;I)I

    .line 53
    .line 54
    .line 55
    move-result v7

    .line 56
    iput v7, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->E:I

    .line 57
    .line 58
    iget-object v7, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 59
    .line 60
    invoke-virtual {v7}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 61
    .line 62
    .line 63
    move-result-object v7

    .line 64
    invoke-virtual {v7}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 65
    .line 66
    .line 67
    move-result v7

    .line 68
    iget-object v8, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 69
    .line 70
    const/16 v9, -0x64

    .line 71
    .line 72
    invoke-virtual {v8, v9, v5}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 73
    .line 74
    .line 75
    move-result-object v8

    .line 76
    if-eqz v8, :cond_1

    .line 77
    .line 78
    invoke-virtual {v8, v4}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    .line 79
    .line 80
    .line 81
    invoke-direct {v0, v8}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->E(Landroid/view/View;)V

    .line 82
    .line 83
    .line 84
    :cond_1
    iget v8, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->E:I

    .line 85
    .line 86
    const/4 v10, 0x1

    .line 87
    const/4 v11, 0x0

    .line 88
    if-ge v8, v10, :cond_3

    .line 89
    .line 90
    aget v11, v4, v11

    .line 91
    .line 92
    aget v2, v4, v10

    .line 93
    .line 94
    iget-object v4, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 95
    .line 96
    iget v5, v4, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 97
    .line 98
    if-ne v5, v3, :cond_2

    .line 99
    .line 100
    iget v4, v4, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 101
    .line 102
    iget v5, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->I:I

    .line 103
    .line 104
    mul-int/2addr v4, v5

    .line 105
    div-int/2addr v5, v3

    .line 106
    add-int/2addr v4, v5

    .line 107
    int-to-float v4, v4

    .line 108
    iget-object v5, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 109
    .line 110
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    iget v5, v5, Lcom/android/launcher3/X3;->O:F

    .line 115
    .line 116
    mul-float/2addr v4, v5

    .line 117
    float-to-int v4, v4

    .line 118
    iget-object v5, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 119
    .line 120
    invoke-virtual {v5}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    div-int/2addr v5, v3

    .line 125
    sub-int/2addr v4, v5

    .line 126
    iget-object v5, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 127
    .line 128
    iget v5, v5, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 129
    .line 130
    iget v6, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->J:I

    .line 131
    .line 132
    mul-int/2addr v5, v6

    .line 133
    div-int/2addr v6, v3

    .line 134
    add-int/2addr v5, v6

    .line 135
    int-to-float v5, v5

    .line 136
    iget-object v6, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 137
    .line 138
    invoke-virtual {v6}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 139
    .line 140
    .line 141
    move-result-object v6

    .line 142
    iget v6, v6, Lcom/android/launcher3/X3;->O:F

    .line 143
    .line 144
    mul-float/2addr v5, v6

    .line 145
    float-to-int v5, v5

    .line 146
    iget-object v6, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 147
    .line 148
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 149
    .line 150
    .line 151
    move-result v6

    .line 152
    div-int/2addr v6, v3

    .line 153
    sub-int/2addr v5, v6

    .line 154
    goto :goto_0

    .line 155
    :cond_2
    iget-object v5, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 156
    .line 157
    iget v4, v4, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 158
    .line 159
    invoke-virtual {v5, v9, v4}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    iget-object v5, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 164
    .line 165
    iget v6, v5, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 166
    .line 167
    iget v5, v5, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 168
    .line 169
    invoke-virtual {v4, v6, v5}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    check-cast v4, Lcom/android/launcher3/BubbleTextView;

    .line 174
    .line 175
    iget-object v5, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 176
    .line 177
    iget v5, v5, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 178
    .line 179
    iget v6, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->I:I

    .line 180
    .line 181
    mul-int/2addr v5, v6

    .line 182
    div-int/2addr v6, v3

    .line 183
    add-int/2addr v5, v6

    .line 184
    int-to-float v5, v5

    .line 185
    iget-object v6, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 186
    .line 187
    invoke-virtual {v6}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 188
    .line 189
    .line 190
    move-result-object v6

    .line 191
    iget v6, v6, Lcom/android/launcher3/X3;->O:F

    .line 192
    .line 193
    mul-float/2addr v5, v6

    .line 194
    float-to-int v5, v5

    .line 195
    iget-object v6, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 196
    .line 197
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 198
    .line 199
    .line 200
    move-result v6

    .line 201
    div-int/2addr v6, v3

    .line 202
    sub-int/2addr v5, v6

    .line 203
    iget-object v6, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 204
    .line 205
    iget v6, v6, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 206
    .line 207
    iget v7, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->J:I

    .line 208
    .line 209
    mul-int/2addr v6, v7

    .line 210
    iget-object v7, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 211
    .line 212
    invoke-virtual {v7}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 213
    .line 214
    .line 215
    move-result-object v7

    .line 216
    iget v7, v7, Lcom/android/launcher3/h0;->B1:I

    .line 217
    .line 218
    div-int/2addr v7, v3

    .line 219
    add-int/2addr v6, v7

    .line 220
    invoke-virtual {v4}, Landroid/widget/TextView;->getPaddingTop()I

    .line 221
    .line 222
    .line 223
    move-result v4

    .line 224
    add-int/2addr v6, v4

    .line 225
    int-to-float v4, v6

    .line 226
    iget-object v6, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 227
    .line 228
    invoke-virtual {v6}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 229
    .line 230
    .line 231
    move-result-object v6

    .line 232
    iget v6, v6, Lcom/android/launcher3/X3;->O:F

    .line 233
    .line 234
    mul-float/2addr v4, v6

    .line 235
    float-to-int v4, v4

    .line 236
    iget-object v6, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 237
    .line 238
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 239
    .line 240
    .line 241
    move-result v6

    .line 242
    div-int/2addr v6, v3

    .line 243
    sub-int/2addr v4, v6

    .line 244
    move/from16 v23, v5

    .line 245
    .line 246
    move v5, v4

    .line 247
    move/from16 v4, v23

    .line 248
    .line 249
    :goto_0
    iget-object v6, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 250
    .line 251
    invoke-virtual {v6}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 252
    .line 253
    .line 254
    move-result-object v6

    .line 255
    iget v6, v6, Lcom/android/launcher3/X3;->O:F

    .line 256
    .line 257
    iget-object v7, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 258
    .line 259
    invoke-virtual {v7}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 260
    .line 261
    .line 262
    move-result-object v7

    .line 263
    iget v7, v7, Lcom/android/launcher3/X3;->O:F

    .line 264
    .line 265
    invoke-direct {v0, v10}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->X(I)V

    .line 266
    .line 267
    .line 268
    move/from16 v17, v6

    .line 269
    .line 270
    move/from16 v18, v7

    .line 271
    .line 272
    goto/16 :goto_6

    .line 273
    .line 274
    :cond_3
    new-array v8, v3, [I

    .line 275
    .line 276
    invoke-virtual {v6, v8, v10, v10}, Lcom/android/launcher3/util/t0;->c([III)Z

    .line 277
    .line 278
    .line 279
    move-result v6

    .line 280
    if-eqz v6, :cond_8

    .line 281
    .line 282
    invoke-direct/range {p0 .. p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->v(Lcom/android/launcher3/n0$a;)I

    .line 283
    .line 284
    .line 285
    move-result v6

    .line 286
    if-ne v7, v6, :cond_5

    .line 287
    .line 288
    aget v2, v4, v11

    .line 289
    .line 290
    aget v4, v4, v10

    .line 291
    .line 292
    iget-object v6, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 293
    .line 294
    iget v6, v6, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 295
    .line 296
    if-ne v6, v3, :cond_4

    .line 297
    .line 298
    aget v6, v8, v11

    .line 299
    .line 300
    iget v7, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->I:I

    .line 301
    .line 302
    mul-int/2addr v6, v7

    .line 303
    div-int/2addr v7, v3

    .line 304
    add-int/2addr v6, v7

    .line 305
    int-to-float v6, v6

    .line 306
    iget-object v7, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 307
    .line 308
    invoke-virtual {v7}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 309
    .line 310
    .line 311
    move-result-object v7

    .line 312
    iget v7, v7, Lcom/android/launcher3/X3;->O:F

    .line 313
    .line 314
    mul-float/2addr v6, v7

    .line 315
    float-to-int v6, v6

    .line 316
    iget-object v7, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 317
    .line 318
    invoke-virtual {v7}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 319
    .line 320
    .line 321
    move-result v7

    .line 322
    div-int/2addr v7, v3

    .line 323
    sub-int/2addr v6, v7

    .line 324
    aget v7, v8, v10

    .line 325
    .line 326
    iget v9, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->J:I

    .line 327
    .line 328
    mul-int/2addr v7, v9

    .line 329
    div-int/2addr v9, v3

    .line 330
    add-int/2addr v7, v9

    .line 331
    int-to-float v7, v7

    .line 332
    iget-object v9, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 333
    .line 334
    invoke-virtual {v9}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 335
    .line 336
    .line 337
    move-result-object v9

    .line 338
    iget v9, v9, Lcom/android/launcher3/X3;->O:F

    .line 339
    .line 340
    mul-float/2addr v7, v9

    .line 341
    float-to-int v7, v7

    .line 342
    iget-object v9, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 343
    .line 344
    invoke-virtual {v9}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 345
    .line 346
    .line 347
    move-result v9

    .line 348
    div-int/2addr v9, v3

    .line 349
    :goto_1
    sub-int/2addr v7, v9

    .line 350
    goto :goto_2

    .line 351
    :cond_4
    aget v6, v8, v11

    .line 352
    .line 353
    iget v7, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->I:I

    .line 354
    .line 355
    mul-int/2addr v6, v7

    .line 356
    div-int/2addr v7, v3

    .line 357
    add-int/2addr v6, v7

    .line 358
    int-to-float v6, v6

    .line 359
    iget-object v7, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 360
    .line 361
    invoke-virtual {v7}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 362
    .line 363
    .line 364
    move-result-object v7

    .line 365
    iget v7, v7, Lcom/android/launcher3/X3;->O:F

    .line 366
    .line 367
    mul-float/2addr v6, v7

    .line 368
    float-to-int v6, v6

    .line 369
    iget-object v7, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 370
    .line 371
    invoke-virtual {v7}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 372
    .line 373
    .line 374
    move-result v7

    .line 375
    div-int/2addr v7, v3

    .line 376
    sub-int/2addr v6, v7

    .line 377
    aget v7, v8, v10

    .line 378
    .line 379
    iget v9, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->J:I

    .line 380
    .line 381
    mul-int/2addr v7, v9

    .line 382
    iget-object v9, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 383
    .line 384
    invoke-virtual {v9}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 385
    .line 386
    .line 387
    move-result-object v9

    .line 388
    iget v9, v9, Lcom/android/launcher3/h0;->B1:I

    .line 389
    .line 390
    div-int/2addr v9, v3

    .line 391
    add-int/2addr v7, v9

    .line 392
    iget-object v9, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 393
    .line 394
    invoke-virtual {v9}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 395
    .line 396
    .line 397
    move-result-object v9

    .line 398
    iget v9, v9, Lcom/android/launcher3/X3;->s:I

    .line 399
    .line 400
    add-int/2addr v7, v9

    .line 401
    int-to-float v7, v7

    .line 402
    iget-object v9, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 403
    .line 404
    invoke-virtual {v9}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 405
    .line 406
    .line 407
    move-result-object v9

    .line 408
    iget v9, v9, Lcom/android/launcher3/X3;->O:F

    .line 409
    .line 410
    mul-float/2addr v7, v9

    .line 411
    float-to-int v7, v7

    .line 412
    iget-object v9, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 413
    .line 414
    invoke-virtual {v9}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 415
    .line 416
    .line 417
    move-result v9

    .line 418
    div-int/2addr v9, v3

    .line 419
    goto :goto_1

    .line 420
    :goto_2
    iget-object v9, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 421
    .line 422
    invoke-virtual {v9}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 423
    .line 424
    .line 425
    move-result-object v9

    .line 426
    iget v9, v9, Lcom/android/launcher3/X3;->O:F

    .line 427
    .line 428
    iget-object v12, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 429
    .line 430
    invoke-virtual {v12}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 431
    .line 432
    .line 433
    move-result-object v12

    .line 434
    iget v12, v12, Lcom/android/launcher3/X3;->O:F

    .line 435
    .line 436
    goto/16 :goto_5

    .line 437
    .line 438
    :cond_5
    iget-object v6, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 439
    .line 440
    invoke-virtual {v6, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 441
    .line 442
    .line 443
    move-result-object v2

    .line 444
    invoke-virtual {v2, v4}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 445
    .line 446
    .line 447
    aget v2, v4, v11

    .line 448
    .line 449
    aget v4, v4, v10

    .line 450
    .line 451
    iget-object v6, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 452
    .line 453
    iget v7, v6, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 454
    .line 455
    if-ne v7, v3, :cond_7

    .line 456
    .line 457
    iget-object v7, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 458
    .line 459
    iget v6, v6, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 460
    .line 461
    invoke-virtual {v7, v9, v6}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 462
    .line 463
    .line 464
    move-result-object v6

    .line 465
    iget-object v7, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 466
    .line 467
    iget v9, v7, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 468
    .line 469
    iget v7, v7, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 470
    .line 471
    invoke-virtual {v6, v9, v7}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 472
    .line 473
    .line 474
    move-result-object v6

    .line 475
    check-cast v6, Lcom/android/launcher3/folder/FolderIcon;

    .line 476
    .line 477
    iget v7, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->s:I

    .line 478
    .line 479
    const/4 v9, 0x6

    .line 480
    const/high16 v12, 0x40000000    # 2.0f

    .line 481
    .line 482
    if-ne v7, v9, :cond_6

    .line 483
    .line 484
    aget v7, v8, v11

    .line 485
    .line 486
    iget v9, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->v:I

    .line 487
    .line 488
    mul-int/2addr v7, v9

    .line 489
    div-int/2addr v9, v3

    .line 490
    add-int/2addr v7, v9

    .line 491
    iget-object v9, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 492
    .line 493
    invoke-virtual {v9}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 494
    .line 495
    .line 496
    move-result v9

    .line 497
    div-int/2addr v9, v3

    .line 498
    sub-int/2addr v7, v9

    .line 499
    aget v9, v8, v10

    .line 500
    .line 501
    iget v13, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->w:I

    .line 502
    .line 503
    mul-int/2addr v9, v13

    .line 504
    div-int/2addr v13, v3

    .line 505
    add-int/2addr v9, v13

    .line 506
    iget-object v13, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 507
    .line 508
    invoke-virtual {v13}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 509
    .line 510
    .line 511
    move-result v13

    .line 512
    iget-object v14, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 513
    .line 514
    invoke-virtual {v14}, Lcom/android/launcher3/dragndrop/v;->getDragRegionTop()I

    .line 515
    .line 516
    .line 517
    move-result v14

    .line 518
    mul-int/2addr v14, v3

    .line 519
    sub-int/2addr v13, v14

    .line 520
    div-int/2addr v13, v3

    .line 521
    sub-int/2addr v9, v13

    .line 522
    iget v13, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->u:I

    .line 523
    .line 524
    add-int/2addr v9, v13

    .line 525
    iget-object v13, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 526
    .line 527
    invoke-virtual {v13}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 528
    .line 529
    .line 530
    move-result v13

    .line 531
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getHeight()I

    .line 532
    .line 533
    .line 534
    move-result v6

    .line 535
    sub-int/2addr v13, v6

    .line 536
    int-to-float v6, v13

    .line 537
    div-float/2addr v6, v12

    .line 538
    float-to-double v12, v6

    .line 539
    invoke-static {v12, v13}, Ljava/lang/Math;->ceil(D)D

    .line 540
    .line 541
    .line 542
    move-result-wide v12

    .line 543
    double-to-int v6, v12

    .line 544
    sub-int/2addr v9, v6

    .line 545
    sub-int/2addr v9, v3

    .line 546
    goto :goto_3

    .line 547
    :cond_6
    aget v7, v8, v11

    .line 548
    .line 549
    iget v9, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->v:I

    .line 550
    .line 551
    mul-int/2addr v7, v9

    .line 552
    div-int/2addr v9, v3

    .line 553
    add-int/2addr v7, v9

    .line 554
    iget-object v9, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 555
    .line 556
    invoke-virtual {v9}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 557
    .line 558
    .line 559
    move-result v9

    .line 560
    div-int/2addr v9, v3

    .line 561
    sub-int/2addr v7, v9

    .line 562
    aget v9, v8, v10

    .line 563
    .line 564
    iget v13, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->w:I

    .line 565
    .line 566
    mul-int/2addr v9, v13

    .line 567
    div-int/2addr v13, v3

    .line 568
    add-int/2addr v9, v13

    .line 569
    iget-object v13, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 570
    .line 571
    invoke-virtual {v13}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 572
    .line 573
    .line 574
    move-result v13

    .line 575
    iget-object v14, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 576
    .line 577
    invoke-virtual {v14}, Lcom/android/launcher3/dragndrop/v;->getDragRegionTop()I

    .line 578
    .line 579
    .line 580
    move-result v14

    .line 581
    mul-int/2addr v14, v3

    .line 582
    sub-int/2addr v13, v14

    .line 583
    div-int/2addr v13, v3

    .line 584
    sub-int/2addr v9, v13

    .line 585
    iget v13, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->u:I

    .line 586
    .line 587
    add-int/2addr v9, v13

    .line 588
    iget-object v13, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 589
    .line 590
    invoke-virtual {v13}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 591
    .line 592
    .line 593
    move-result v13

    .line 594
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getHeight()I

    .line 595
    .line 596
    .line 597
    move-result v6

    .line 598
    sub-int/2addr v13, v6

    .line 599
    int-to-float v6, v13

    .line 600
    div-float/2addr v6, v12

    .line 601
    float-to-double v12, v6

    .line 602
    invoke-static {v12, v13}, Ljava/lang/Math;->ceil(D)D

    .line 603
    .line 604
    .line 605
    move-result-wide v12

    .line 606
    double-to-int v6, v12

    .line 607
    sub-int/2addr v9, v6

    .line 608
    add-int/lit8 v9, v9, 0x3

    .line 609
    .line 610
    :goto_3
    move v6, v7

    .line 611
    move v7, v9

    .line 612
    goto :goto_4

    .line 613
    :cond_7
    aget v6, v8, v11

    .line 614
    .line 615
    iget v7, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->v:I

    .line 616
    .line 617
    mul-int/2addr v6, v7

    .line 618
    div-int/2addr v7, v3

    .line 619
    add-int/2addr v6, v7

    .line 620
    iget-object v7, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 621
    .line 622
    invoke-virtual {v7}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 623
    .line 624
    .line 625
    move-result v7

    .line 626
    div-int/2addr v7, v3

    .line 627
    sub-int/2addr v6, v7

    .line 628
    aget v7, v8, v10

    .line 629
    .line 630
    iget v9, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->w:I

    .line 631
    .line 632
    mul-int/2addr v7, v9

    .line 633
    div-int/2addr v9, v3

    .line 634
    add-int/2addr v7, v9

    .line 635
    iget-object v9, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 636
    .line 637
    invoke-virtual {v9}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 638
    .line 639
    .line 640
    move-result v9

    .line 641
    div-int/2addr v9, v3

    .line 642
    sub-int/2addr v7, v9

    .line 643
    iget v9, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->u:I

    .line 644
    .line 645
    add-int/2addr v7, v9

    .line 646
    :goto_4
    iget v9, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->F:F

    .line 647
    .line 648
    move v12, v9

    .line 649
    :goto_5
    iget-object v13, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 650
    .line 651
    aget v11, v8, v11

    .line 652
    .line 653
    iput v11, v13, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 654
    .line 655
    aget v8, v8, v10

    .line 656
    .line 657
    iput v8, v13, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 658
    .line 659
    iput v5, v13, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 660
    .line 661
    move v11, v2

    .line 662
    move v2, v4

    .line 663
    move v4, v6

    .line 664
    move v5, v7

    .line 665
    move/from16 v17, v9

    .line 666
    .line 667
    move/from16 v18, v12

    .line 668
    .line 669
    goto :goto_6

    .line 670
    :cond_8
    const/4 v6, 0x0

    .line 671
    move/from16 v17, v6

    .line 672
    .line 673
    move/from16 v18, v17

    .line 674
    .line 675
    move v2, v11

    .line 676
    move v4, v2

    .line 677
    move v5, v4

    .line 678
    :goto_6
    new-array v3, v3, [I

    .line 679
    .line 680
    iget-object v6, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 681
    .line 682
    invoke-virtual {v6, v3}, Landroid/widget/FrameLayout;->getLocationOnScreen([I)V

    .line 683
    .line 684
    .line 685
    iget-object v3, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 686
    .line 687
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 688
    .line 689
    .line 690
    move-result-object v12

    .line 691
    iget-object v13, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 692
    .line 693
    add-int v14, v11, v4

    .line 694
    .line 695
    add-int v15, v2, v5

    .line 696
    .line 697
    new-instance v2, Lcom/android/launcher3/iconarrange/j;

    .line 698
    .line 699
    invoke-direct {v2, v0, v1}, Lcom/android/launcher3/iconarrange/j;-><init>(Lcom/android/launcher3/iconarrange/MenuIconArrange;Lcom/android/launcher3/n0$a;)V

    .line 700
    .line 701
    .line 702
    const/16 v21, 0x12c

    .line 703
    .line 704
    const/16 v22, 0x0

    .line 705
    .line 706
    const/high16 v16, 0x3f800000    # 1.0f

    .line 707
    .line 708
    const/16 v20, 0x0

    .line 709
    .line 710
    move-object/from16 v19, v2

    .line 711
    .line 712
    invoke-virtual/range {v12 .. v22}, Lcom/android/launcher3/dragndrop/DragLayer;->g(Lcom/android/launcher3/dragndrop/v;IIFFFLjava/lang/Runnable;IILandroid/view/View;)V

    .line 713
    .line 714
    .line 715
    :cond_9
    :goto_7
    return-void
.end method

.method public b(Landroid/graphics/Rect;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const v1, 0x7f07097f

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    float-to-int v0, v0

    .line 15
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->T0()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const/4 v2, 0x0

    .line 26
    const v3, 0x7fffffff

    .line 27
    .line 28
    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    :cond_0
    iput v2, p1, Landroid/graphics/Rect;->top:I

    .line 50
    .line 51
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    iget p0, p0, Lcom/android/launcher3/h0;->T0:I

    .line 58
    .line 59
    sub-int/2addr p0, v0

    .line 60
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 61
    .line 62
    iput v3, p1, Landroid/graphics/Rect;->right:I

    .line 63
    .line 64
    iput v3, p1, Landroid/graphics/Rect;->bottom:I

    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    iput v2, p1, Landroid/graphics/Rect;->left:I

    .line 68
    .line 69
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iget v1, v1, Lcom/android/launcher3/h0;->W0:I

    .line 76
    .line 77
    sub-int/2addr v1, v0

    .line 78
    iput v1, p1, Landroid/graphics/Rect;->top:I

    .line 79
    .line 80
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    iget p0, p0, Lcom/android/launcher3/h0;->V0:I

    .line 87
    .line 88
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 89
    .line 90
    iput v3, p1, Landroid/graphics/Rect;->bottom:I

    .line 91
    .line 92
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public computeScroll()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->L:Landroid/widget/OverScroller;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->L:Landroid/widget/OverScroller;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrX()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->g:I

    .line 16
    .line 17
    sub-int/2addr v0, v1

    .line 18
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->T0()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    const/4 v2, 0x0

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 32
    .line 33
    invoke-virtual {v1, v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 38
    .line 39
    invoke-virtual {v1, v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 40
    .line 41
    .line 42
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->L:Landroid/widget/OverScroller;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrX()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iput v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->g:I

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 51
    .line 52
    .line 53
    :cond_1
    invoke-super {p0}, Landroid/widget/FrameLayout;->computeScroll()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public f(ILandroid/view/animation/Interpolator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic getDropView()Landroid/view/View;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/n0;->getDropView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getPreviewIconShrinkFactor()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->F:F

    .line 2
    .line 3
    return p0
.end method

.method public getSelectedItemIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->G:I

    .line 2
    .line 3
    return p0
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Lcom/android/launcher3/dragndrop/j;->h(Lcom/android/launcher3/n0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->Q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->k:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->k:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->H:I

    .line 14
    .line 15
    if-le v0, v1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->n:Lcom/android/launcher3/iconarrange/l;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->n:Lcom/android/launcher3/iconarrange/l;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->k:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    const/4 v1, 0x1

    .line 32
    sub-int/2addr p0, v1

    .line 33
    invoke-virtual {v0, p0, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeInserted(II)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public l(Lcom/android/launcher3/n0$a;)V
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->v(Lcom/android/launcher3/n0$a;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->o:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->s()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-ltz p1, :cond_2

    .line 12
    .line 13
    if-gez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    .line 18
    sub-int v0, p1, v0

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 27
    .line 28
    const v2, 0x7f04049a

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    invoke-static {v1, v2, v3}, Lcom/android/launcher3/util/F2;->f(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iput p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->M:I

    .line 43
    .line 44
    :cond_2
    :goto_0
    return-void
.end method

.method public m(Lcom/android/launcher3/n0$a;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/4 v2, 0x1

    .line 28
    invoke-virtual {v1, v2}, Lcom/android/launcher3/menu/c;->z(Z)V

    .line 29
    .line 30
    .line 31
    new-instance v1, Lcom/android/launcher3/util/t0;

    .line 32
    .line 33
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->r:I

    .line 34
    .line 35
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->s:I

    .line 36
    .line 37
    invoke-direct {v1, v2, v3}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 38
    .line 39
    .line 40
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->r:I

    .line 41
    .line 42
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->s:I

    .line 43
    .line 44
    invoke-direct {p0, v2, v3, v1, v0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->A(IILcom/android/launcher3/util/t0;I)I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    iput v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->E:I

    .line 49
    .line 50
    iget-object v2, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 51
    .line 52
    iget-object v2, v2, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->E:I

    .line 59
    .line 60
    sub-int/2addr v2, v3

    .line 61
    iget-object v3, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 62
    .line 63
    iget-object v3, v3, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    iget v4, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->E:I

    .line 70
    .line 71
    if-le v3, v4, :cond_0

    .line 72
    .line 73
    invoke-direct {p0, v2}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->X(I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->r(Lcom/android/launcher3/n0$a;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_0
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->t(Lcom/android/launcher3/n0$a;ILcom/android/launcher3/util/t0;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public n(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/folder/FolderIcon;)V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v6, p1

    .line 4
    .line 5
    iget-object v1, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v15, 0x1

    .line 12
    invoke-virtual {v1, v15}, Lcom/android/launcher3/menu/c;->z(Z)V

    .line 13
    .line 14
    .line 15
    new-instance v1, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    new-instance v2, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    iget-object v2, v6, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 26
    .line 27
    iget-object v2, v2, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    .line 28
    .line 29
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-le v3, v4, :cond_0

    .line 38
    .line 39
    new-instance v3, Lcom/android/launcher3/iconarrange/b;

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    invoke-direct {v3, v4, v4, v4}, Lcom/android/launcher3/iconarrange/b;-><init>(FFF)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    invoke-virtual/range {p2 .. p2}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v3}, Lcom/android/launcher3/folder/Folder;->getItemCount()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    const/16 v16, 0x0

    .line 58
    .line 59
    move/from16 v4, v16

    .line 60
    .line 61
    :goto_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    if-ge v4, v5, :cond_1

    .line 66
    .line 67
    iget-object v5, v6, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 68
    .line 69
    iget-object v5, v5, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    .line 70
    .line 71
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    check-cast v5, Lcom/android/launcher3/BubbleTextView;

    .line 76
    .line 77
    invoke-virtual {v5}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    check-cast v5, Lcom/android/launcher3/model/data/y;

    .line 82
    .line 83
    const/4 v7, 0x2

    .line 84
    new-array v8, v7, [I

    .line 85
    .line 86
    new-array v9, v7, [F

    .line 87
    .line 88
    invoke-virtual/range {p2 .. p2}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 89
    .line 90
    .line 91
    move-result-object v10

    .line 92
    iget-object v10, v10, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 93
    .line 94
    iget v10, v10, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 95
    .line 96
    invoke-virtual/range {p2 .. p2}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 97
    .line 98
    .line 99
    move-result-object v11

    .line 100
    iget-object v11, v11, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 101
    .line 102
    iget v11, v11, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 103
    .line 104
    iget-object v12, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 105
    .line 106
    invoke-virtual/range {p2 .. p2}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 107
    .line 108
    .line 109
    move-result-object v13

    .line 110
    iget-object v13, v13, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 111
    .line 112
    iget v13, v13, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 113
    .line 114
    const/16 v14, -0x64

    .line 115
    .line 116
    invoke-virtual {v12, v14, v13}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 117
    .line 118
    .line 119
    move-result-object v12

    .line 120
    invoke-virtual {v12, v8}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    .line 121
    .line 122
    .line 123
    invoke-direct {v0, v12}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->E(Landroid/view/View;)V

    .line 124
    .line 125
    .line 126
    aget v12, v8, v16

    .line 127
    .line 128
    aget v8, v8, v15

    .line 129
    .line 130
    invoke-direct {v0, v3, v9}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->y(I[F)V

    .line 131
    .line 132
    .line 133
    aget v13, v9, v16

    .line 134
    .line 135
    aget v9, v9, v15

    .line 136
    .line 137
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v14

    .line 141
    check-cast v14, Lcom/android/launcher3/iconarrange/b;

    .line 142
    .line 143
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v17

    .line 147
    check-cast v17, Lcom/android/launcher3/BubbleTextView;

    .line 148
    .line 149
    invoke-virtual/range {v17 .. v17}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 150
    .line 151
    .line 152
    move-result-object v17

    .line 153
    move/from16 v18, v7

    .line 154
    .line 155
    aget-object v7, v17, v15

    .line 156
    .line 157
    invoke-virtual {v14, v7}, Lcom/android/launcher3/iconarrange/b;->g(Landroid/graphics/drawable/Drawable;)V

    .line 158
    .line 159
    .line 160
    iget v7, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->I:I

    .line 161
    .line 162
    mul-int/2addr v10, v7

    .line 163
    move/from16 v17, v15

    .line 164
    .line 165
    iget-object v15, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 166
    .line 167
    invoke-virtual {v15}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 168
    .line 169
    .line 170
    move-result-object v15

    .line 171
    iget v15, v15, Lcom/android/launcher3/h0;->B1:I

    .line 172
    .line 173
    sub-int/2addr v7, v15

    .line 174
    div-int/lit8 v7, v7, 0x2

    .line 175
    .line 176
    add-int/2addr v10, v7

    .line 177
    int-to-float v7, v10

    .line 178
    iget-object v10, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 179
    .line 180
    invoke-virtual {v10}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 181
    .line 182
    .line 183
    move-result-object v10

    .line 184
    iget v10, v10, Lcom/android/launcher3/X3;->O:F

    .line 185
    .line 186
    mul-float/2addr v7, v10

    .line 187
    float-to-int v7, v7

    .line 188
    iget v10, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->J:I

    .line 189
    .line 190
    mul-int/2addr v11, v10

    .line 191
    iget-object v10, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 192
    .line 193
    invoke-virtual {v10}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 194
    .line 195
    .line 196
    move-result-object v10

    .line 197
    iget v10, v10, Lcom/android/launcher3/X3;->s:I

    .line 198
    .line 199
    add-int/2addr v11, v10

    .line 200
    int-to-float v10, v11

    .line 201
    iget-object v11, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 202
    .line 203
    invoke-virtual {v11}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 204
    .line 205
    .line 206
    move-result-object v11

    .line 207
    iget v11, v11, Lcom/android/launcher3/X3;->O:F

    .line 208
    .line 209
    mul-float/2addr v10, v11

    .line 210
    float-to-int v10, v10

    .line 211
    const/4 v11, 0x3

    .line 212
    new-array v11, v11, [F

    .line 213
    .line 214
    invoke-direct {v0, v6, v4, v11}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->x(Lcom/android/launcher3/n0$a;I[F)V

    .line 215
    .line 216
    .line 217
    move-object v15, v1

    .line 218
    new-instance v1, Lcom/android/launcher3/iconarrange/c;

    .line 219
    .line 220
    move-object/from16 v19, v2

    .line 221
    .line 222
    iget-object v2, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 223
    .line 224
    move/from16 v20, v3

    .line 225
    .line 226
    move v3, v4

    .line 227
    invoke-virtual/range {p2 .. p2}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 228
    .line 229
    .line 230
    move-result-object v4

    .line 231
    move-object/from16 v21, v1

    .line 232
    .line 233
    aget v1, v11, v17

    .line 234
    .line 235
    float-to-int v1, v1

    .line 236
    move/from16 v22, v1

    .line 237
    .line 238
    aget v1, v11, v18

    .line 239
    .line 240
    float-to-int v1, v1

    .line 241
    add-int/2addr v12, v7

    .line 242
    float-to-int v7, v13

    .line 243
    add-int/2addr v12, v7

    .line 244
    add-int/2addr v8, v10

    .line 245
    float-to-int v7, v9

    .line 246
    add-int/2addr v8, v7

    .line 247
    const v7, 0x3f8f5c29    # 1.12f

    .line 248
    .line 249
    .line 250
    aget v9, v11, v16

    .line 251
    .line 252
    mul-float/2addr v9, v7

    .line 253
    iget v7, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->F:F

    .line 254
    .line 255
    iget-object v10, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 256
    .line 257
    invoke-virtual {v10}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 258
    .line 259
    .line 260
    move-result-object v10

    .line 261
    iget v10, v10, Lcom/android/launcher3/X3;->O:F

    .line 262
    .line 263
    mul-float v13, v7, v10

    .line 264
    .line 265
    move-object v7, v14

    .line 266
    const/16 v14, 0x12c

    .line 267
    .line 268
    move v11, v8

    .line 269
    move v10, v12

    .line 270
    move/from16 v8, v22

    .line 271
    .line 272
    move v12, v9

    .line 273
    move v9, v1

    .line 274
    move-object/from16 v1, v21

    .line 275
    .line 276
    invoke-direct/range {v1 .. v14}, Lcom/android/launcher3/iconarrange/c;-><init>(Lcom/android/launcher3/C2;ILcom/android/launcher3/folder/Folder;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;Lcom/android/launcher3/iconarrange/b;IIIIFFI)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {v7, v1}, Lcom/android/launcher3/iconarrange/b;->f(Lcom/android/launcher3/iconarrange/c;)V

    .line 280
    .line 281
    .line 282
    add-int/lit8 v1, v20, 0x1

    .line 283
    .line 284
    add-int/lit8 v4, v3, 0x1

    .line 285
    .line 286
    move-object/from16 v6, p1

    .line 287
    .line 288
    move v3, v1

    .line 289
    move-object v1, v15

    .line 290
    move/from16 v15, v17

    .line 291
    .line 292
    move-object/from16 v2, v19

    .line 293
    .line 294
    goto/16 :goto_1

    .line 295
    .line 296
    :cond_1
    move-object v15, v1

    .line 297
    invoke-direct {v0, v15}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->W(Ljava/util/ArrayList;)V

    .line 298
    .line 299
    .line 300
    return-void
.end method

.method public o(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/folder/Folder;)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v6, p1

    .line 4
    .line 5
    move-object/from16 v4, p2

    .line 6
    .line 7
    if-nez v4, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v1, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v15, 0x1

    .line 17
    invoke-virtual {v1, v15}, Lcom/android/launcher3/menu/c;->z(Z)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    new-instance v2, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iget-object v2, v6, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    .line 33
    .line 34
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    if-le v3, v5, :cond_1

    .line 43
    .line 44
    new-instance v3, Lcom/android/launcher3/iconarrange/b;

    .line 45
    .line 46
    const/4 v5, 0x0

    .line 47
    invoke-direct {v3, v5, v5, v5}, Lcom/android/launcher3/iconarrange/b;-><init>(FFF)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    invoke-virtual {v4}, Lcom/android/launcher3/folder/Folder;->getItemCount()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    iget-object v5, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 59
    .line 60
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    invoke-virtual {v5}, Lcom/android/launcher3/q4;->a0()Z

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    const/16 v16, 0x0

    .line 69
    .line 70
    if-eqz v5, :cond_3

    .line 71
    .line 72
    if-nez v3, :cond_3

    .line 73
    .line 74
    invoke-virtual {v4}, Lcom/android/launcher3/folder/Folder;->getContent()Lcom/android/launcher3/folder/FolderPagedView;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    invoke-virtual {v5}, Lcom/android/launcher3/folder/FolderPagedView;->getGridCountX()I

    .line 79
    .line 80
    .line 81
    move-result v7

    .line 82
    invoke-virtual {v5}, Lcom/android/launcher3/folder/FolderPagedView;->getGridCountY()I

    .line 83
    .line 84
    .line 85
    move-result v8

    .line 86
    mul-int/2addr v7, v8

    .line 87
    invoke-virtual {v5}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 88
    .line 89
    .line 90
    move-result v8

    .line 91
    mul-int/2addr v8, v7

    .line 92
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 93
    .line 94
    .line 95
    move-result v9

    .line 96
    add-int/2addr v9, v3

    .line 97
    if-le v9, v8, :cond_3

    .line 98
    .line 99
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 100
    .line 101
    .line 102
    move-result v9

    .line 103
    add-int/2addr v9, v3

    .line 104
    sub-int/2addr v9, v8

    .line 105
    div-int v8, v9, v7

    .line 106
    .line 107
    rem-int/2addr v9, v7

    .line 108
    if-eqz v9, :cond_2

    .line 109
    .line 110
    move v7, v15

    .line 111
    goto :goto_1

    .line 112
    :cond_2
    move/from16 v7, v16

    .line 113
    .line 114
    :goto_1
    add-int/2addr v8, v7

    .line 115
    move/from16 v7, v16

    .line 116
    .line 117
    :goto_2
    if-ge v7, v8, :cond_3

    .line 118
    .line 119
    invoke-virtual {v5}, Lcom/android/launcher3/folder/FolderPagedView;->c0()Lcom/android/launcher3/CellLayout;

    .line 120
    .line 121
    .line 122
    add-int/lit8 v7, v7, 0x1

    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_3
    move/from16 v5, v16

    .line 126
    .line 127
    :goto_3
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 128
    .line 129
    .line 130
    move-result v7

    .line 131
    if-ge v5, v7, :cond_4

    .line 132
    .line 133
    iget-object v7, v6, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 134
    .line 135
    iget-object v7, v7, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    .line 136
    .line 137
    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v7

    .line 141
    check-cast v7, Lcom/android/launcher3/BubbleTextView;

    .line 142
    .line 143
    invoke-virtual {v7}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v7

    .line 147
    check-cast v7, Lcom/android/launcher3/model/data/y;

    .line 148
    .line 149
    invoke-virtual {v4}, Lcom/android/launcher3/folder/Folder;->getContent()Lcom/android/launcher3/folder/FolderPagedView;

    .line 150
    .line 151
    .line 152
    move-result-object v8

    .line 153
    invoke-virtual {v8}, Lcom/android/launcher3/folder/FolderPagedView;->getCurrentCellLayout()Lcom/android/launcher3/CellLayout;

    .line 154
    .line 155
    .line 156
    move-result-object v8

    .line 157
    invoke-direct {v0, v4, v8, v3}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->B(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/CellLayout;I)[I

    .line 158
    .line 159
    .line 160
    move-result-object v8

    .line 161
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v9

    .line 165
    check-cast v9, Lcom/android/launcher3/iconarrange/b;

    .line 166
    .line 167
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v10

    .line 171
    check-cast v10, Lcom/android/launcher3/BubbleTextView;

    .line 172
    .line 173
    invoke-virtual {v10}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 174
    .line 175
    .line 176
    move-result-object v10

    .line 177
    aget-object v10, v10, v15

    .line 178
    .line 179
    invoke-virtual {v9, v10}, Lcom/android/launcher3/iconarrange/b;->g(Landroid/graphics/drawable/Drawable;)V

    .line 180
    .line 181
    .line 182
    const/4 v10, 0x3

    .line 183
    new-array v10, v10, [F

    .line 184
    .line 185
    invoke-direct {v0, v6, v5, v10}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->x(Lcom/android/launcher3/n0$a;I[F)V

    .line 186
    .line 187
    .line 188
    move-object v11, v1

    .line 189
    new-instance v1, Lcom/android/launcher3/iconarrange/c;

    .line 190
    .line 191
    move-object v12, v2

    .line 192
    iget-object v2, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 193
    .line 194
    aget v13, v10, v15

    .line 195
    .line 196
    float-to-int v13, v13

    .line 197
    const/4 v14, 0x2

    .line 198
    aget v14, v10, v14

    .line 199
    .line 200
    float-to-int v14, v14

    .line 201
    move-object/from16 v17, v10

    .line 202
    .line 203
    aget v10, v8, v16

    .line 204
    .line 205
    aget v8, v8, v15

    .line 206
    .line 207
    aget v17, v17, v16

    .line 208
    .line 209
    const v18, 0x3f8f5c29    # 1.12f

    .line 210
    .line 211
    .line 212
    mul-float v18, v18, v17

    .line 213
    .line 214
    move/from16 v19, v3

    .line 215
    .line 216
    move v3, v5

    .line 217
    move-object v5, v7

    .line 218
    move-object v7, v9

    .line 219
    move v9, v14

    .line 220
    const/16 v14, 0x12c

    .line 221
    .line 222
    move/from16 v20, v15

    .line 223
    .line 224
    move-object v15, v11

    .line 225
    move v11, v8

    .line 226
    move v8, v13

    .line 227
    move/from16 v13, v17

    .line 228
    .line 229
    move-object/from16 v17, v12

    .line 230
    .line 231
    move/from16 v12, v18

    .line 232
    .line 233
    invoke-direct/range {v1 .. v14}, Lcom/android/launcher3/iconarrange/c;-><init>(Lcom/android/launcher3/C2;ILcom/android/launcher3/folder/Folder;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;Lcom/android/launcher3/iconarrange/b;IIIIFFI)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v7, v1}, Lcom/android/launcher3/iconarrange/b;->f(Lcom/android/launcher3/iconarrange/c;)V

    .line 237
    .line 238
    .line 239
    add-int/lit8 v1, v19, 0x1

    .line 240
    .line 241
    add-int/lit8 v5, v3, 0x1

    .line 242
    .line 243
    move-object/from16 v6, p1

    .line 244
    .line 245
    move-object/from16 v4, p2

    .line 246
    .line 247
    move v3, v1

    .line 248
    move-object v1, v15

    .line 249
    move-object/from16 v2, v17

    .line 250
    .line 251
    move/from16 v15, v20

    .line 252
    .line 253
    goto :goto_3

    .line 254
    :cond_4
    move-object v15, v1

    .line 255
    invoke-direct {v0, v15}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->W(Ljava/util/ArrayList;)V

    .line 256
    .line 257
    .line 258
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->H()V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->o:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->U(I)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->n:Lcom/android/launcher3/iconarrange/l;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    instance-of p1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;

    .line 40
    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->N0:Z

    .line 62
    .line 63
    if-eqz p0, :cond_0

    .line 64
    .line 65
    const p0, 0x7f0c00bf

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    const p0, 0x7f0c00be

    .line 70
    .line 71
    .line 72
    :goto_0
    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getInteger(I)I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    int-to-float p0, p0

    .line 77
    invoke-static {p0}, Lcom/android/launcher3/N5;->i(F)I

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    iput p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 82
    .line 83
    :cond_1
    return-void
.end method

.method protected onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->j:Landroid/content/Context;

    .line 5
    .line 6
    const v1, 0x7f0e0148

    .line 7
    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    const v1, 0x7f0b0301

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 29
    .line 30
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->j:Landroid/content/Context;

    .line 33
    .line 34
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->o:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->T0()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->U(I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->o:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 57
    .line 58
    .line 59
    new-instance v0, Lcom/android/launcher3/iconarrange/l;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->k:Ljava/util/List;

    .line 62
    .line 63
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 64
    .line 65
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/iconarrange/l;-><init>(Ljava/util/List;Lcom/android/launcher3/C2;)V

    .line 66
    .line 67
    .line 68
    iput-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->n:Lcom/android/launcher3/iconarrange/l;

    .line 69
    .line 70
    new-instance v0, Lcom/android/launcher3/iconarrange/m;

    .line 71
    .line 72
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->k:Ljava/util/List;

    .line 73
    .line 74
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 75
    .line 76
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/iconarrange/m;-><init>(Ljava/util/List;Landroid/content/Context;)V

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 80
    .line 81
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 85
    .line 86
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->n:Lcom/android/launcher3/iconarrange/l;

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 89
    .line 90
    .line 91
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_1

    .line 96
    .line 97
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 98
    .line 99
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    instance-of v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout$b;

    .line 104
    .line 105
    if-eqz v0, :cond_1

    .line 106
    .line 107
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 108
    .line 109
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$b;

    .line 114
    .line 115
    const/4 v1, -0x1

    .line 116
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->i:I

    .line 117
    .line 118
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 123
    .line 124
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    iget-boolean v2, v2, Lcom/android/launcher3/h0;->N0:Z

    .line 129
    .line 130
    if-eqz v2, :cond_0

    .line 131
    .line 132
    const v2, 0x7f0c00bf

    .line 133
    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_0
    const v2, 0x7f0c00be

    .line 137
    .line 138
    .line 139
    :goto_0
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    int-to-float v1, v1

    .line 144
    invoke-static {v1}, Lcom/android/launcher3/N5;->i(F)I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 149
    .line 150
    :cond_1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-eqz v0, :cond_2

    .line 159
    .line 160
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 161
    .line 162
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    instance-of v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout$b;

    .line 167
    .line 168
    if-eqz v0, :cond_2

    .line 169
    .line 170
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 171
    .line 172
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout$b;

    .line 177
    .line 178
    const/4 v0, -0x2

    .line 179
    iput v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 180
    .line 181
    :cond_2
    return-void
.end method

.method public p(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onViewEntered-icon arrange"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "MenuIconArrange"

    .line 19
    .line 20
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->c2()Lcom/android/launcher3/helper/a;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v0, "help_icon_arrange"

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lcom/android/launcher3/helper/a;->q(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->Q()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    const v1, 0x7f0b0303

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, v1}, Lcom/android/launcher3/statemanager/h;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->setTopBarVisible(Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->i()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->r1()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->A0()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->k()V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public r(Lcom/android/launcher3/n0$a;)V
    .locals 36

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v6, p1

    .line 4
    .line 5
    const/4 v15, 0x1

    .line 6
    iput-boolean v15, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->K:Z

    .line 7
    .line 8
    new-instance v1, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object v2, v6, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    .line 16
    .line 17
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    const/4 v5, 0x0

    .line 26
    if-le v3, v4, :cond_0

    .line 27
    .line 28
    new-instance v3, Lcom/android/launcher3/iconarrange/b;

    .line 29
    .line 30
    invoke-direct {v3, v5, v5, v5}, Lcom/android/launcher3/iconarrange/b;-><init>(FFF)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    new-instance v3, Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 40
    .line 41
    .line 42
    new-instance v7, Lcom/android/launcher3/util/t0;

    .line 43
    .line 44
    iget v4, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->r:I

    .line 45
    .line 46
    iget v8, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->s:I

    .line 47
    .line 48
    invoke-direct {v7, v4, v8}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 49
    .line 50
    .line 51
    iget v10, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->r:I

    .line 52
    .line 53
    iget v11, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->s:I

    .line 54
    .line 55
    const/4 v12, 0x0

    .line 56
    const/4 v8, 0x0

    .line 57
    const/4 v9, 0x0

    .line 58
    invoke-virtual/range {v7 .. v12}, Lcom/android/launcher3/util/t0;->e(IIIIZ)V

    .line 59
    .line 60
    .line 61
    move-object v4, v7

    .line 62
    const/4 v7, 0x0

    .line 63
    const/16 v16, 0x0

    .line 64
    .line 65
    move/from16 v22, v5

    .line 66
    .line 67
    move/from16 v23, v22

    .line 68
    .line 69
    move v8, v7

    .line 70
    move/from16 v17, v8

    .line 71
    .line 72
    move/from16 v18, v17

    .line 73
    .line 74
    move/from16 v19, v18

    .line 75
    .line 76
    move/from16 v20, v19

    .line 77
    .line 78
    move/from16 v21, v20

    .line 79
    .line 80
    move-object/from16 v24, v16

    .line 81
    .line 82
    :goto_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 83
    .line 84
    .line 85
    move-result v9

    .line 86
    if-ge v8, v9, :cond_9

    .line 87
    .line 88
    iget-object v9, v6, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 89
    .line 90
    iget-object v9, v9, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    .line 91
    .line 92
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v9

    .line 96
    check-cast v9, Lcom/android/launcher3/BubbleTextView;

    .line 97
    .line 98
    invoke-virtual {v9}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v9

    .line 102
    check-cast v9, Lcom/android/launcher3/model/data/y;

    .line 103
    .line 104
    iget v10, v9, Lcom/android/launcher3/model/data/y;->container:I

    .line 105
    .line 106
    const/4 v14, 0x2

    .line 107
    if-lez v10, :cond_8

    .line 108
    .line 109
    move v10, v7

    .line 110
    :goto_2
    iget-object v5, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 111
    .line 112
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    invoke-virtual {v5}, Lcom/android/launcher3/G4;->j()Ljava/util/ArrayList;

    .line 117
    .line 118
    .line 119
    move-result-object v5

    .line 120
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    if-ge v10, v5, :cond_3

    .line 125
    .line 126
    iget-object v5, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 127
    .line 128
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 129
    .line 130
    .line 131
    move-result-object v5

    .line 132
    invoke-virtual {v5}, Lcom/android/launcher3/G4;->j()Ljava/util/ArrayList;

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v5

    .line 140
    check-cast v5, Lcom/android/launcher3/folder/Folder;

    .line 141
    .line 142
    iget-object v5, v5, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 143
    .line 144
    iget v5, v5, Lcom/android/launcher3/model/data/y;->id:I

    .line 145
    .line 146
    const v26, 0x3f8f5c29    # 1.12f

    .line 147
    .line 148
    .line 149
    iget v11, v9, Lcom/android/launcher3/model/data/y;->container:I

    .line 150
    .line 151
    if-ne v5, v11, :cond_2

    .line 152
    .line 153
    iget-object v5, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 154
    .line 155
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 156
    .line 157
    .line 158
    move-result-object v5

    .line 159
    invoke-virtual {v5}, Lcom/android/launcher3/G4;->j()Ljava/util/ArrayList;

    .line 160
    .line 161
    .line 162
    move-result-object v5

    .line 163
    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    check-cast v5, Lcom/android/launcher3/folder/Folder;

    .line 168
    .line 169
    iget-object v5, v5, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 170
    .line 171
    iget v5, v5, Lcom/android/launcher3/model/data/y;->id:I

    .line 172
    .line 173
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 174
    .line 175
    .line 176
    move-result-object v5

    .line 177
    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    if-nez v5, :cond_1

    .line 182
    .line 183
    iget-object v5, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 184
    .line 185
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 186
    .line 187
    .line 188
    move-result-object v5

    .line 189
    invoke-virtual {v5}, Lcom/android/launcher3/G4;->j()Ljava/util/ArrayList;

    .line 190
    .line 191
    .line 192
    move-result-object v5

    .line 193
    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v5

    .line 197
    check-cast v5, Lcom/android/launcher3/folder/Folder;

    .line 198
    .line 199
    iget-object v5, v5, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 200
    .line 201
    iget v5, v5, Lcom/android/launcher3/model/data/y;->id:I

    .line 202
    .line 203
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 204
    .line 205
    .line 206
    move-result-object v5

    .line 207
    iget-object v11, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 208
    .line 209
    invoke-virtual {v11}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 210
    .line 211
    .line 212
    move-result-object v11

    .line 213
    invoke-virtual {v11}, Lcom/android/launcher3/G4;->j()Ljava/util/ArrayList;

    .line 214
    .line 215
    .line 216
    move-result-object v11

    .line 217
    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v11

    .line 221
    check-cast v11, Lcom/android/launcher3/folder/Folder;

    .line 222
    .line 223
    invoke-virtual {v11}, Lcom/android/launcher3/folder/Folder;->getItemCount()I

    .line 224
    .line 225
    .line 226
    move-result v11

    .line 227
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 228
    .line 229
    .line 230
    move-result-object v11

    .line 231
    invoke-virtual {v3, v5, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    goto :goto_3

    .line 235
    :cond_1
    iget-object v5, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 236
    .line 237
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 238
    .line 239
    .line 240
    move-result-object v5

    .line 241
    invoke-virtual {v5}, Lcom/android/launcher3/G4;->j()Ljava/util/ArrayList;

    .line 242
    .line 243
    .line 244
    move-result-object v5

    .line 245
    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    move-result-object v5

    .line 249
    check-cast v5, Lcom/android/launcher3/folder/Folder;

    .line 250
    .line 251
    iget-object v5, v5, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 252
    .line 253
    iget v5, v5, Lcom/android/launcher3/model/data/y;->id:I

    .line 254
    .line 255
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 256
    .line 257
    .line 258
    move-result-object v5

    .line 259
    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object v5

    .line 263
    check-cast v5, Ljava/lang/Integer;

    .line 264
    .line 265
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 266
    .line 267
    .line 268
    move-result v5

    .line 269
    iget-object v11, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 270
    .line 271
    invoke-virtual {v11}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 272
    .line 273
    .line 274
    move-result-object v11

    .line 275
    invoke-virtual {v11}, Lcom/android/launcher3/G4;->j()Ljava/util/ArrayList;

    .line 276
    .line 277
    .line 278
    move-result-object v11

    .line 279
    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    move-result-object v11

    .line 283
    check-cast v11, Lcom/android/launcher3/folder/Folder;

    .line 284
    .line 285
    iget-object v11, v11, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 286
    .line 287
    iget v11, v11, Lcom/android/launcher3/model/data/y;->id:I

    .line 288
    .line 289
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 290
    .line 291
    .line 292
    move-result-object v11

    .line 293
    add-int/2addr v5, v15

    .line 294
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 295
    .line 296
    .line 297
    move-result-object v5

    .line 298
    invoke-virtual {v3, v11, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    .line 300
    .line 301
    :goto_3
    iget-object v5, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 302
    .line 303
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 304
    .line 305
    .line 306
    move-result-object v5

    .line 307
    invoke-virtual {v5}, Lcom/android/launcher3/G4;->j()Ljava/util/ArrayList;

    .line 308
    .line 309
    .line 310
    move-result-object v5

    .line 311
    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object v5

    .line 315
    check-cast v5, Lcom/android/launcher3/folder/Folder;

    .line 316
    .line 317
    iget-object v5, v5, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 318
    .line 319
    iget v5, v5, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 320
    .line 321
    iget-object v11, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 322
    .line 323
    invoke-virtual {v11}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 324
    .line 325
    .line 326
    move-result-object v11

    .line 327
    invoke-virtual {v11}, Lcom/android/launcher3/G4;->j()Ljava/util/ArrayList;

    .line 328
    .line 329
    .line 330
    move-result-object v11

    .line 331
    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 332
    .line 333
    .line 334
    move-result-object v11

    .line 335
    check-cast v11, Lcom/android/launcher3/folder/Folder;

    .line 336
    .line 337
    iget-object v11, v11, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 338
    .line 339
    iget v11, v11, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 340
    .line 341
    iget-object v12, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 342
    .line 343
    invoke-virtual {v12}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 344
    .line 345
    .line 346
    move-result-object v12

    .line 347
    invoke-virtual {v12}, Lcom/android/launcher3/G4;->j()Ljava/util/ArrayList;

    .line 348
    .line 349
    .line 350
    move-result-object v12

    .line 351
    invoke-virtual {v12, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 352
    .line 353
    .line 354
    move-result-object v12

    .line 355
    check-cast v12, Lcom/android/launcher3/folder/Folder;

    .line 356
    .line 357
    iget-object v12, v12, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 358
    .line 359
    iget v12, v12, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 360
    .line 361
    new-array v13, v14, [F

    .line 362
    .line 363
    move/from16 v29, v15

    .line 364
    .line 365
    iget-object v15, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 366
    .line 367
    invoke-virtual {v15}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 368
    .line 369
    .line 370
    move-result-object v15

    .line 371
    invoke-virtual {v15}, Lcom/android/launcher3/G4;->j()Ljava/util/ArrayList;

    .line 372
    .line 373
    .line 374
    move-result-object v15

    .line 375
    invoke-virtual {v15, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 376
    .line 377
    .line 378
    move-result-object v15

    .line 379
    check-cast v15, Lcom/android/launcher3/folder/Folder;

    .line 380
    .line 381
    iget-object v15, v15, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 382
    .line 383
    iget v15, v15, Lcom/android/launcher3/model/data/y;->id:I

    .line 384
    .line 385
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 386
    .line 387
    .line 388
    move-result-object v15

    .line 389
    invoke-virtual {v3, v15}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 390
    .line 391
    .line 392
    move-result-object v15

    .line 393
    check-cast v15, Ljava/lang/Integer;

    .line 394
    .line 395
    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    .line 396
    .line 397
    .line 398
    move-result v15

    .line 399
    invoke-direct {v0, v15, v13}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->y(I[F)V

    .line 400
    .line 401
    .line 402
    aget v22, v13, v7

    .line 403
    .line 404
    aget v23, v13, v29

    .line 405
    .line 406
    iget-object v13, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 407
    .line 408
    invoke-virtual {v13}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 409
    .line 410
    .line 411
    move-result-object v13

    .line 412
    invoke-virtual {v13}, Lcom/android/launcher3/G4;->j()Ljava/util/ArrayList;

    .line 413
    .line 414
    .line 415
    move-result-object v13

    .line 416
    invoke-virtual {v13, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 417
    .line 418
    .line 419
    move-result-object v10

    .line 420
    move-object/from16 v24, v10

    .line 421
    .line 422
    check-cast v24, Lcom/android/launcher3/folder/Folder;

    .line 423
    .line 424
    move/from16 v19, v5

    .line 425
    .line 426
    move/from16 v20, v11

    .line 427
    .line 428
    move/from16 v21, v12

    .line 429
    .line 430
    move/from16 v17, v29

    .line 431
    .line 432
    goto :goto_4

    .line 433
    :cond_2
    move/from16 v29, v15

    .line 434
    .line 435
    add-int/lit8 v10, v10, 0x1

    .line 436
    .line 437
    goto/16 :goto_2

    .line 438
    .line 439
    :cond_3
    move/from16 v29, v15

    .line 440
    .line 441
    const v26, 0x3f8f5c29    # 1.12f

    .line 442
    .line 443
    .line 444
    :goto_4
    if-nez v17, :cond_6

    .line 445
    .line 446
    iget-object v5, v4, Lcom/android/launcher3/util/t0;->c:[[Z

    .line 447
    .line 448
    aget-object v5, v5, v7

    .line 449
    .line 450
    aget-boolean v5, v5, v7

    .line 451
    .line 452
    if-nez v5, :cond_4

    .line 453
    .line 454
    iget-object v5, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 455
    .line 456
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 457
    .line 458
    .line 459
    move-result-object v5

    .line 460
    invoke-virtual {v5}, Lcom/android/launcher3/Workspace;->O0()Lcom/android/launcher3/util/z0;

    .line 461
    .line 462
    .line 463
    move-result-object v5

    .line 464
    invoke-virtual {v5}, Lcom/android/launcher3/util/z0;->getArray()Lcom/android/launcher3/util/x0;

    .line 465
    .line 466
    .line 467
    move-result-object v5

    .line 468
    invoke-virtual {v5, v7}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 469
    .line 470
    .line 471
    move-result v18

    .line 472
    :cond_4
    new-array v5, v14, [I

    .line 473
    .line 474
    move/from16 v10, v29

    .line 475
    .line 476
    invoke-virtual {v4, v5, v10, v10}, Lcom/android/launcher3/util/t0;->c([III)Z

    .line 477
    .line 478
    .line 479
    move-result v11

    .line 480
    if-eqz v11, :cond_5

    .line 481
    .line 482
    aget v11, v5, v7

    .line 483
    .line 484
    aget v5, v5, v10

    .line 485
    .line 486
    iput v11, v9, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 487
    .line 488
    iput v5, v9, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 489
    .line 490
    iget-object v12, v4, Lcom/android/launcher3/util/t0;->c:[[Z

    .line 491
    .line 492
    aget-object v12, v12, v11

    .line 493
    .line 494
    aput-boolean v10, v12, v5

    .line 495
    .line 496
    move/from16 v21, v5

    .line 497
    .line 498
    move/from16 v20, v11

    .line 499
    .line 500
    move/from16 v5, v18

    .line 501
    .line 502
    :goto_5
    const/16 v11, -0x64

    .line 503
    .line 504
    goto :goto_6

    .line 505
    :cond_5
    iget-object v5, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 506
    .line 507
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 508
    .line 509
    .line 510
    move-result-object v5

    .line 511
    invoke-virtual {v5}, Lcom/android/launcher3/Workspace;->A0()V

    .line 512
    .line 513
    .line 514
    invoke-virtual {v0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->k()V

    .line 515
    .line 516
    .line 517
    iget-object v5, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 518
    .line 519
    const/16 v10, -0xc9

    .line 520
    .line 521
    const/16 v11, -0x64

    .line 522
    .line 523
    invoke-virtual {v5, v11, v10}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 524
    .line 525
    .line 526
    move-result-object v5

    .line 527
    invoke-virtual {v5}, Lcom/android/launcher3/CellLayout;->getOccupied()Lcom/android/launcher3/util/t0;

    .line 528
    .line 529
    .line 530
    move-result-object v5

    .line 531
    invoke-virtual {v5, v4}, Lcom/android/launcher3/util/t0;->b(Lcom/android/launcher3/util/t0;)V

    .line 532
    .line 533
    .line 534
    iget-object v5, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 535
    .line 536
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 537
    .line 538
    .line 539
    move-result-object v5

    .line 540
    invoke-virtual {v5}, Lcom/android/launcher3/Workspace;->O0()Lcom/android/launcher3/util/z0;

    .line 541
    .line 542
    .line 543
    move-result-object v5

    .line 544
    invoke-virtual {v5}, Lcom/android/launcher3/util/z0;->getArray()Lcom/android/launcher3/util/x0;

    .line 545
    .line 546
    .line 547
    move-result-object v5

    .line 548
    invoke-virtual {v5, v7}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 549
    .line 550
    .line 551
    move-result v5

    .line 552
    iput v7, v9, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 553
    .line 554
    iput v7, v9, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 555
    .line 556
    iget-object v10, v4, Lcom/android/launcher3/util/t0;->c:[[Z

    .line 557
    .line 558
    aget-object v10, v10, v7

    .line 559
    .line 560
    const/16 v29, 0x1

    .line 561
    .line 562
    aput-boolean v29, v10, v7

    .line 563
    .line 564
    move/from16 v20, v7

    .line 565
    .line 566
    move/from16 v21, v20

    .line 567
    .line 568
    goto :goto_5

    .line 569
    :goto_6
    iput v11, v9, Lcom/android/launcher3/model/data/y;->container:I

    .line 570
    .line 571
    iput v5, v9, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 572
    .line 573
    move v15, v5

    .line 574
    move/from16 v18, v15

    .line 575
    .line 576
    move-object/from16 v24, v16

    .line 577
    .line 578
    const/4 v5, 0x0

    .line 579
    const/4 v10, 0x0

    .line 580
    goto :goto_7

    .line 581
    :cond_6
    const/16 v11, -0x64

    .line 582
    .line 583
    move/from16 v15, v19

    .line 584
    .line 585
    move/from16 v5, v22

    .line 586
    .line 587
    move/from16 v10, v23

    .line 588
    .line 589
    :goto_7
    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 590
    .line 591
    .line 592
    move-result-object v12

    .line 593
    check-cast v12, Lcom/android/launcher3/iconarrange/b;

    .line 594
    .line 595
    new-array v13, v14, [I

    .line 596
    .line 597
    move/from16 v28, v7

    .line 598
    .line 599
    iget-object v7, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 600
    .line 601
    invoke-virtual {v7, v11, v15}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 602
    .line 603
    .line 604
    move-result-object v7

    .line 605
    invoke-virtual {v7, v13}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    .line 606
    .line 607
    .line 608
    invoke-direct {v0, v7}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->E(Landroid/view/View;)V

    .line 609
    .line 610
    .line 611
    aget v7, v13, v28

    .line 612
    .line 613
    const/16 v29, 0x1

    .line 614
    .line 615
    aget v11, v13, v29

    .line 616
    .line 617
    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 618
    .line 619
    .line 620
    move-result-object v13

    .line 621
    check-cast v13, Lcom/android/launcher3/BubbleTextView;

    .line 622
    .line 623
    invoke-virtual {v13}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 624
    .line 625
    .line 626
    move-result-object v13

    .line 627
    aget-object v13, v13, v29

    .line 628
    .line 629
    invoke-virtual {v12, v13}, Lcom/android/launcher3/iconarrange/b;->g(Landroid/graphics/drawable/Drawable;)V

    .line 630
    .line 631
    .line 632
    iget v13, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->I:I

    .line 633
    .line 634
    mul-int v19, v20, v13

    .line 635
    .line 636
    move/from16 v30, v14

    .line 637
    .line 638
    iget-object v14, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 639
    .line 640
    invoke-virtual {v14}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 641
    .line 642
    .line 643
    move-result-object v14

    .line 644
    iget v14, v14, Lcom/android/launcher3/h0;->B1:I

    .line 645
    .line 646
    sub-int/2addr v13, v14

    .line 647
    div-int/lit8 v13, v13, 0x2

    .line 648
    .line 649
    add-int v13, v19, v13

    .line 650
    .line 651
    int-to-float v13, v13

    .line 652
    iget-object v14, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 653
    .line 654
    invoke-virtual {v14}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 655
    .line 656
    .line 657
    move-result-object v14

    .line 658
    iget v14, v14, Lcom/android/launcher3/X3;->O:F

    .line 659
    .line 660
    mul-float/2addr v13, v14

    .line 661
    float-to-int v13, v13

    .line 662
    iget v14, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->J:I

    .line 663
    .line 664
    mul-int v14, v14, v21

    .line 665
    .line 666
    move-object/from16 v31, v1

    .line 667
    .line 668
    iget-object v1, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 669
    .line 670
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 671
    .line 672
    .line 673
    move-result-object v1

    .line 674
    iget v1, v1, Lcom/android/launcher3/X3;->s:I

    .line 675
    .line 676
    add-int/2addr v14, v1

    .line 677
    int-to-float v1, v14

    .line 678
    iget-object v14, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 679
    .line 680
    invoke-virtual {v14}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 681
    .line 682
    .line 683
    move-result-object v14

    .line 684
    iget v14, v14, Lcom/android/launcher3/X3;->O:F

    .line 685
    .line 686
    mul-float/2addr v1, v14

    .line 687
    float-to-int v1, v1

    .line 688
    const/4 v14, 0x3

    .line 689
    new-array v14, v14, [F

    .line 690
    .line 691
    invoke-direct {v0, v6, v8, v14}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->x(Lcom/android/launcher3/n0$a;I[F)V

    .line 692
    .line 693
    .line 694
    move/from16 v19, v1

    .line 695
    .line 696
    new-instance v1, Lcom/android/launcher3/iconarrange/c;

    .line 697
    .line 698
    move-object/from16 v22, v2

    .line 699
    .line 700
    iget-object v2, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 701
    .line 702
    move-object/from16 v23, v1

    .line 703
    .line 704
    const/16 v29, 0x1

    .line 705
    .line 706
    aget v1, v14, v29

    .line 707
    .line 708
    float-to-int v1, v1

    .line 709
    move/from16 v27, v1

    .line 710
    .line 711
    aget v1, v14, v30

    .line 712
    .line 713
    float-to-int v1, v1

    .line 714
    add-int/2addr v7, v13

    .line 715
    float-to-int v13, v5

    .line 716
    add-int/2addr v7, v13

    .line 717
    add-int v11, v11, v19

    .line 718
    .line 719
    float-to-int v13, v10

    .line 720
    add-int/2addr v11, v13

    .line 721
    aget v13, v14, v28

    .line 722
    .line 723
    mul-float v13, v13, v26

    .line 724
    .line 725
    if-eqz v17, :cond_7

    .line 726
    .line 727
    iget v14, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->F:F

    .line 728
    .line 729
    :goto_8
    move/from16 v19, v1

    .line 730
    .line 731
    goto :goto_9

    .line 732
    :cond_7
    const/high16 v14, 0x3f800000    # 1.0f

    .line 733
    .line 734
    goto :goto_8

    .line 735
    :goto_9
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 736
    .line 737
    .line 738
    move-result-object v1

    .line 739
    iget v1, v1, Lcom/android/launcher3/X3;->O:F

    .line 740
    .line 741
    mul-float/2addr v14, v1

    .line 742
    move v1, v10

    .line 743
    move v10, v7

    .line 744
    move-object v7, v12

    .line 745
    move v12, v13

    .line 746
    move v13, v14

    .line 747
    const/16 v14, 0x12c

    .line 748
    .line 749
    move-object/from16 v25, v23

    .line 750
    .line 751
    move/from16 v23, v1

    .line 752
    .line 753
    move-object/from16 v1, v25

    .line 754
    .line 755
    move-object/from16 v34, v4

    .line 756
    .line 757
    move/from16 v32, v15

    .line 758
    .line 759
    move-object/from16 v33, v22

    .line 760
    .line 761
    move-object/from16 v4, v24

    .line 762
    .line 763
    move/from16 v35, v28

    .line 764
    .line 765
    move-object/from16 v15, v31

    .line 766
    .line 767
    const/16 v25, 0x0

    .line 768
    .line 769
    move-object/from16 v31, v3

    .line 770
    .line 771
    move/from16 v22, v5

    .line 772
    .line 773
    move v3, v8

    .line 774
    move-object v5, v9

    .line 775
    move/from16 v9, v19

    .line 776
    .line 777
    move/from16 v8, v27

    .line 778
    .line 779
    invoke-direct/range {v1 .. v14}, Lcom/android/launcher3/iconarrange/c;-><init>(Lcom/android/launcher3/C2;ILcom/android/launcher3/folder/Folder;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;Lcom/android/launcher3/iconarrange/b;IIIIFFI)V

    .line 780
    .line 781
    .line 782
    invoke-virtual {v7, v1}, Lcom/android/launcher3/iconarrange/b;->f(Lcom/android/launcher3/iconarrange/c;)V

    .line 783
    .line 784
    .line 785
    move/from16 v19, v32

    .line 786
    .line 787
    const/16 v29, 0x1

    .line 788
    .line 789
    goto/16 :goto_a

    .line 790
    .line 791
    :cond_8
    move-object v15, v1

    .line 792
    move-object/from16 v33, v2

    .line 793
    .line 794
    move-object/from16 v31, v3

    .line 795
    .line 796
    move-object/from16 v34, v4

    .line 797
    .line 798
    move/from16 v25, v5

    .line 799
    .line 800
    move/from16 v35, v7

    .line 801
    .line 802
    move v3, v8

    .line 803
    move-object v5, v9

    .line 804
    move/from16 v30, v14

    .line 805
    .line 806
    const v26, 0x3f8f5c29    # 1.12f

    .line 807
    .line 808
    .line 809
    invoke-virtual {v15, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 810
    .line 811
    .line 812
    move-result-object v1

    .line 813
    move-object v7, v1

    .line 814
    check-cast v7, Lcom/android/launcher3/iconarrange/b;

    .line 815
    .line 816
    move/from16 v1, v30

    .line 817
    .line 818
    new-array v2, v1, [I

    .line 819
    .line 820
    iget-object v1, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 821
    .line 822
    iget v4, v5, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 823
    .line 824
    const/16 v11, -0x64

    .line 825
    .line 826
    invoke-virtual {v1, v11, v4}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 827
    .line 828
    .line 829
    move-result-object v1

    .line 830
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    .line 831
    .line 832
    .line 833
    invoke-direct {v0, v1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->E(Landroid/view/View;)V

    .line 834
    .line 835
    .line 836
    aget v1, v2, v35

    .line 837
    .line 838
    const/16 v29, 0x1

    .line 839
    .line 840
    aget v2, v2, v29

    .line 841
    .line 842
    move-object/from16 v4, v33

    .line 843
    .line 844
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 845
    .line 846
    .line 847
    move-result-object v8

    .line 848
    check-cast v8, Lcom/android/launcher3/BubbleTextView;

    .line 849
    .line 850
    invoke-virtual {v8}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 851
    .line 852
    .line 853
    move-result-object v8

    .line 854
    aget-object v8, v8, v29

    .line 855
    .line 856
    invoke-virtual {v7, v8}, Lcom/android/launcher3/iconarrange/b;->g(Landroid/graphics/drawable/Drawable;)V

    .line 857
    .line 858
    .line 859
    iget v8, v5, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 860
    .line 861
    iget v9, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->I:I

    .line 862
    .line 863
    mul-int/2addr v8, v9

    .line 864
    iget-object v10, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 865
    .line 866
    invoke-virtual {v10}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 867
    .line 868
    .line 869
    move-result-object v10

    .line 870
    iget v10, v10, Lcom/android/launcher3/h0;->B1:I

    .line 871
    .line 872
    sub-int/2addr v9, v10

    .line 873
    const/16 v30, 0x2

    .line 874
    .line 875
    div-int/lit8 v9, v9, 0x2

    .line 876
    .line 877
    add-int/2addr v8, v9

    .line 878
    int-to-float v8, v8

    .line 879
    iget-object v9, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 880
    .line 881
    invoke-virtual {v9}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 882
    .line 883
    .line 884
    move-result-object v9

    .line 885
    iget v9, v9, Lcom/android/launcher3/X3;->O:F

    .line 886
    .line 887
    mul-float/2addr v8, v9

    .line 888
    float-to-int v8, v8

    .line 889
    iget v9, v5, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 890
    .line 891
    iget v10, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->J:I

    .line 892
    .line 893
    mul-int/2addr v9, v10

    .line 894
    iget-object v10, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 895
    .line 896
    invoke-virtual {v10}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 897
    .line 898
    .line 899
    move-result-object v10

    .line 900
    iget v10, v10, Lcom/android/launcher3/X3;->s:I

    .line 901
    .line 902
    add-int/2addr v9, v10

    .line 903
    int-to-float v9, v9

    .line 904
    iget-object v10, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 905
    .line 906
    invoke-virtual {v10}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 907
    .line 908
    .line 909
    move-result-object v10

    .line 910
    iget v10, v10, Lcom/android/launcher3/X3;->O:F

    .line 911
    .line 912
    mul-float/2addr v9, v10

    .line 913
    float-to-int v9, v9

    .line 914
    const/4 v14, 0x3

    .line 915
    new-array v10, v14, [F

    .line 916
    .line 917
    invoke-direct {v0, v6, v3, v10}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->x(Lcom/android/launcher3/n0$a;I[F)V

    .line 918
    .line 919
    .line 920
    move v11, v1

    .line 921
    new-instance v1, Lcom/android/launcher3/iconarrange/c;

    .line 922
    .line 923
    move v12, v2

    .line 924
    iget-object v2, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 925
    .line 926
    const/16 v29, 0x1

    .line 927
    .line 928
    aget v13, v10, v29

    .line 929
    .line 930
    float-to-int v13, v13

    .line 931
    const/16 v30, 0x2

    .line 932
    .line 933
    aget v14, v10, v30

    .line 934
    .line 935
    float-to-int v14, v14

    .line 936
    add-int/2addr v8, v11

    .line 937
    add-int v11, v12, v9

    .line 938
    .line 939
    aget v9, v10, v35

    .line 940
    .line 941
    mul-float v12, v9, v26

    .line 942
    .line 943
    move v10, v8

    .line 944
    move v8, v13

    .line 945
    move v13, v9

    .line 946
    move v9, v14

    .line 947
    const/16 v14, 0x12c

    .line 948
    .line 949
    const/4 v4, 0x0

    .line 950
    invoke-direct/range {v1 .. v14}, Lcom/android/launcher3/iconarrange/c;-><init>(Lcom/android/launcher3/C2;ILcom/android/launcher3/folder/Folder;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;Lcom/android/launcher3/iconarrange/b;IIIIFFI)V

    .line 951
    .line 952
    .line 953
    invoke-virtual {v7, v1}, Lcom/android/launcher3/iconarrange/b;->f(Lcom/android/launcher3/iconarrange/c;)V

    .line 954
    .line 955
    .line 956
    :goto_a
    add-int/lit8 v8, v3, 0x1

    .line 957
    .line 958
    move-object/from16 v6, p1

    .line 959
    .line 960
    move-object v1, v15

    .line 961
    move/from16 v5, v25

    .line 962
    .line 963
    move/from16 v15, v29

    .line 964
    .line 965
    move-object/from16 v3, v31

    .line 966
    .line 967
    move-object/from16 v2, v33

    .line 968
    .line 969
    move-object/from16 v4, v34

    .line 970
    .line 971
    move/from16 v7, v35

    .line 972
    .line 973
    goto/16 :goto_1

    .line 974
    .line 975
    :cond_9
    move-object v15, v1

    .line 976
    invoke-direct {v0, v15}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->W(Ljava/util/ArrayList;)V

    .line 977
    .line 978
    .line 979
    return-void
.end method

.method s(Lcom/android/launcher3/n0$a;ILcom/android/launcher3/util/t0;)V
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v6, p1

    .line 4
    .line 5
    move-object/from16 v15, p3

    .line 6
    .line 7
    new-instance v1, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v2, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v2, v6, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    .line 20
    .line 21
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    if-le v3, v4, :cond_0

    .line 30
    .line 31
    new-instance v3, Lcom/android/launcher3/iconarrange/b;

    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    invoke-direct {v3, v4, v4, v4}, Lcom/android/launcher3/iconarrange/b;-><init>(FFF)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-direct/range {p0 .. p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->w(Lcom/android/launcher3/n0$a;)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    iget-object v4, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->o:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 46
    .line 47
    invoke-virtual {v4}, Landroidx/recyclerview/widget/LinearLayoutManager;->s()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-ltz v3, :cond_4

    .line 52
    .line 53
    if-gez v4, :cond_1

    .line 54
    .line 55
    goto/16 :goto_4

    .line 56
    .line 57
    :cond_1
    sub-int/2addr v3, v4

    .line 58
    const/4 v4, 0x2

    .line 59
    new-array v5, v4, [I

    .line 60
    .line 61
    iget-object v7, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 62
    .line 63
    invoke-virtual {v7, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-virtual {v3, v5}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 68
    .line 69
    .line 70
    const/16 v16, 0x0

    .line 71
    .line 72
    aget v17, v5, v16

    .line 73
    .line 74
    const/4 v3, 0x1

    .line 75
    aget v18, v5, v3

    .line 76
    .line 77
    move/from16 v5, v16

    .line 78
    .line 79
    move v7, v5

    .line 80
    move v8, v7

    .line 81
    :goto_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 82
    .line 83
    .line 84
    move-result v9

    .line 85
    if-ge v5, v9, :cond_3

    .line 86
    .line 87
    iget-object v9, v6, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 88
    .line 89
    iget-object v9, v9, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-virtual {v9, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v9

    .line 95
    check-cast v9, Lcom/android/launcher3/BubbleTextView;

    .line 96
    .line 97
    invoke-virtual {v9}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v9

    .line 101
    check-cast v9, Lcom/android/launcher3/model/data/y;

    .line 102
    .line 103
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v10

    .line 107
    check-cast v10, Lcom/android/launcher3/iconarrange/b;

    .line 108
    .line 109
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v11

    .line 113
    check-cast v11, Lcom/android/launcher3/BubbleTextView;

    .line 114
    .line 115
    invoke-virtual {v11}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 116
    .line 117
    .line 118
    move-result-object v11

    .line 119
    aget-object v11, v11, v3

    .line 120
    .line 121
    invoke-virtual {v10, v11}, Lcom/android/launcher3/iconarrange/b;->g(Landroid/graphics/drawable/Drawable;)V

    .line 122
    .line 123
    .line 124
    new-array v11, v4, [I

    .line 125
    .line 126
    invoke-virtual {v15, v11, v3, v3}, Lcom/android/launcher3/util/t0;->c([III)Z

    .line 127
    .line 128
    .line 129
    move-result v12

    .line 130
    if-eqz v12, :cond_2

    .line 131
    .line 132
    aget v7, v11, v16

    .line 133
    .line 134
    iget v8, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->v:I

    .line 135
    .line 136
    mul-int/2addr v7, v8

    .line 137
    iget v8, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->y:I

    .line 138
    .line 139
    add-int/2addr v7, v8

    .line 140
    iget v8, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->t:I

    .line 141
    .line 142
    add-int/2addr v7, v8

    .line 143
    aget v8, v11, v3

    .line 144
    .line 145
    iget v12, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->w:I

    .line 146
    .line 147
    mul-int/2addr v8, v12

    .line 148
    iget v12, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->z:I

    .line 149
    .line 150
    add-int/2addr v8, v12

    .line 151
    iget v12, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->u:I

    .line 152
    .line 153
    add-int/2addr v8, v12

    .line 154
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v12

    .line 158
    check-cast v12, Lcom/android/launcher3/BubbleTextView;

    .line 159
    .line 160
    invoke-virtual {v12}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v12

    .line 164
    check-cast v12, Lcom/android/launcher3/model/data/y;

    .line 165
    .line 166
    aget v13, v11, v16

    .line 167
    .line 168
    iput v13, v12, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 169
    .line 170
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v12

    .line 174
    check-cast v12, Lcom/android/launcher3/BubbleTextView;

    .line 175
    .line 176
    invoke-virtual {v12}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object v12

    .line 180
    check-cast v12, Lcom/android/launcher3/model/data/y;

    .line 181
    .line 182
    aget v13, v11, v3

    .line 183
    .line 184
    iput v13, v12, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 185
    .line 186
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v12

    .line 190
    check-cast v12, Lcom/android/launcher3/BubbleTextView;

    .line 191
    .line 192
    invoke-virtual {v12}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object v12

    .line 196
    check-cast v12, Lcom/android/launcher3/model/data/y;

    .line 197
    .line 198
    move/from16 v13, p2

    .line 199
    .line 200
    iput v13, v12, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 201
    .line 202
    iget-object v12, v15, Lcom/android/launcher3/util/t0;->c:[[Z

    .line 203
    .line 204
    aget v14, v11, v16

    .line 205
    .line 206
    aget-object v12, v12, v14

    .line 207
    .line 208
    aget v11, v11, v3

    .line 209
    .line 210
    aput-boolean v3, v12, v11

    .line 211
    .line 212
    :goto_2
    move/from16 v19, v7

    .line 213
    .line 214
    move/from16 v20, v8

    .line 215
    .line 216
    goto :goto_3

    .line 217
    :cond_2
    move/from16 v13, p2

    .line 218
    .line 219
    goto :goto_2

    .line 220
    :goto_3
    const/4 v7, 0x3

    .line 221
    new-array v7, v7, [F

    .line 222
    .line 223
    invoke-direct {v0, v6, v5, v7}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->x(Lcom/android/launcher3/n0$a;I[F)V

    .line 224
    .line 225
    .line 226
    move-object v8, v1

    .line 227
    new-instance v1, Lcom/android/launcher3/iconarrange/c;

    .line 228
    .line 229
    move-object v11, v2

    .line 230
    iget-object v2, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 231
    .line 232
    aget v12, v7, v3

    .line 233
    .line 234
    float-to-int v12, v12

    .line 235
    aget v14, v7, v4

    .line 236
    .line 237
    float-to-int v14, v14

    .line 238
    move-object/from16 v21, v7

    .line 239
    .line 240
    move-object v7, v10

    .line 241
    add-int v10, v17, v19

    .line 242
    .line 243
    move-object/from16 v22, v11

    .line 244
    .line 245
    add-int v11, v18, v20

    .line 246
    .line 247
    const v23, 0x3f8f5c29    # 1.12f

    .line 248
    .line 249
    .line 250
    aget v21, v21, v16

    .line 251
    .line 252
    mul-float v21, v21, v23

    .line 253
    .line 254
    iget v13, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->F:F

    .line 255
    .line 256
    move/from16 v23, v3

    .line 257
    .line 258
    move v3, v5

    .line 259
    move-object v5, v9

    .line 260
    move v9, v14

    .line 261
    const/16 v14, 0x12c

    .line 262
    .line 263
    move/from16 v24, v4

    .line 264
    .line 265
    const/4 v4, 0x0

    .line 266
    move-object v15, v8

    .line 267
    move v8, v12

    .line 268
    move/from16 v12, v21

    .line 269
    .line 270
    invoke-direct/range {v1 .. v14}, Lcom/android/launcher3/iconarrange/c;-><init>(Lcom/android/launcher3/C2;ILcom/android/launcher3/folder/Folder;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;Lcom/android/launcher3/iconarrange/b;IIIIFFI)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v7, v1}, Lcom/android/launcher3/iconarrange/b;->f(Lcom/android/launcher3/iconarrange/c;)V

    .line 274
    .line 275
    .line 276
    add-int/lit8 v5, v3, 0x1

    .line 277
    .line 278
    move-object/from16 v6, p1

    .line 279
    .line 280
    move-object v1, v15

    .line 281
    move/from16 v7, v19

    .line 282
    .line 283
    move/from16 v8, v20

    .line 284
    .line 285
    move-object/from16 v2, v22

    .line 286
    .line 287
    move/from16 v3, v23

    .line 288
    .line 289
    move/from16 v4, v24

    .line 290
    .line 291
    move-object/from16 v15, p3

    .line 292
    .line 293
    goto/16 :goto_1

    .line 294
    .line 295
    :cond_3
    move-object v15, v1

    .line 296
    invoke-direct {v0, v15}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->W(Ljava/util/ArrayList;)V

    .line 297
    .line 298
    .line 299
    :cond_4
    :goto_4
    return-void
.end method

.method public setIconArrangeCurrentPage(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eq v0, p1, :cond_0

    .line 12
    .line 13
    iput p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->G:I

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->n:Lcom/android/launcher3/iconarrange/l;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public setResetCheckState(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->K:Z

    .line 2
    .line 3
    return-void
.end method

.method public setTopBarStatus(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    const v0, 0x7f0b0303

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/statemanager/h;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->setTopBarVisible(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public t(Lcom/android/launcher3/n0$a;ILcom/android/launcher3/util/t0;)V
    .locals 26

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v6, p1

    .line 4
    .line 5
    move/from16 v15, p2

    .line 6
    .line 7
    move-object/from16 v1, p3

    .line 8
    .line 9
    new-instance v2, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v3, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object v3, v6, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 20
    .line 21
    iget-object v3, v3, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    .line 22
    .line 23
    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    if-le v4, v5, :cond_0

    .line 32
    .line 33
    new-instance v4, Lcom/android/launcher3/iconarrange/b;

    .line 34
    .line 35
    const/4 v5, 0x0

    .line 36
    invoke-direct {v4, v5, v5, v5}, Lcom/android/launcher3/iconarrange/b;-><init>(FFF)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const/4 v4, 0x2

    .line 44
    new-array v5, v4, [I

    .line 45
    .line 46
    iget-object v7, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 47
    .line 48
    const/16 v8, -0x64

    .line 49
    .line 50
    invoke-virtual {v7, v8, v15}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    invoke-virtual {v7, v5}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    .line 55
    .line 56
    .line 57
    invoke-direct {v0, v7}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->E(Landroid/view/View;)V

    .line 58
    .line 59
    .line 60
    const/16 v16, 0x0

    .line 61
    .line 62
    aget v9, v5, v16

    .line 63
    .line 64
    iget-object v10, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 65
    .line 66
    invoke-virtual {v10}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 67
    .line 68
    .line 69
    move-result-object v10

    .line 70
    invoke-virtual {v10}, Lcom/android/launcher3/V4;->isPageInTransition()Z

    .line 71
    .line 72
    .line 73
    move-result v10

    .line 74
    if-eqz v10, :cond_1

    .line 75
    .line 76
    iget-object v10, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 77
    .line 78
    invoke-virtual {v10}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 79
    .line 80
    .line 81
    move-result-object v10

    .line 82
    iget-object v11, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 83
    .line 84
    invoke-virtual {v11}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 85
    .line 86
    .line 87
    move-result-object v11

    .line 88
    invoke-virtual {v11}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 89
    .line 90
    .line 91
    move-result v11

    .line 92
    invoke-virtual {v10, v11}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 93
    .line 94
    .line 95
    move-result v10

    .line 96
    if-ne v15, v10, :cond_1

    .line 97
    .line 98
    iget-object v9, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 99
    .line 100
    invoke-virtual {v9}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 101
    .line 102
    .line 103
    move-result-object v9

    .line 104
    iget v9, v9, Lcom/android/launcher3/h0;->T0:I

    .line 105
    .line 106
    int-to-float v9, v9

    .line 107
    invoke-virtual {v7}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 108
    .line 109
    .line 110
    move-result v7

    .line 111
    int-to-float v7, v7

    .line 112
    iget-object v10, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 113
    .line 114
    invoke-virtual {v10}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 115
    .line 116
    .line 117
    move-result-object v10

    .line 118
    iget v10, v10, Lcom/android/launcher3/X3;->O:F

    .line 119
    .line 120
    mul-float/2addr v7, v10

    .line 121
    sub-float/2addr v9, v7

    .line 122
    const/high16 v7, 0x40000000    # 2.0f

    .line 123
    .line 124
    div-float/2addr v9, v7

    .line 125
    const/high16 v7, 0x3f000000    # 0.5f

    .line 126
    .line 127
    add-float/2addr v9, v7

    .line 128
    float-to-int v9, v9

    .line 129
    :cond_1
    move/from16 v17, v9

    .line 130
    .line 131
    const/4 v7, 0x1

    .line 132
    aget v18, v5, v7

    .line 133
    .line 134
    move/from16 v5, v16

    .line 135
    .line 136
    move v9, v5

    .line 137
    move v10, v9

    .line 138
    :goto_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 139
    .line 140
    .line 141
    move-result v11

    .line 142
    if-ge v5, v11, :cond_3

    .line 143
    .line 144
    iget-object v11, v6, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 145
    .line 146
    iget-object v11, v11, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    .line 147
    .line 148
    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v11

    .line 152
    check-cast v11, Lcom/android/launcher3/BubbleTextView;

    .line 153
    .line 154
    invoke-virtual {v11}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v11

    .line 158
    check-cast v11, Lcom/android/launcher3/model/data/y;

    .line 159
    .line 160
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v12

    .line 164
    check-cast v12, Lcom/android/launcher3/iconarrange/b;

    .line 165
    .line 166
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v13

    .line 170
    check-cast v13, Lcom/android/launcher3/BubbleTextView;

    .line 171
    .line 172
    invoke-virtual {v13}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 173
    .line 174
    .line 175
    move-result-object v13

    .line 176
    aget-object v13, v13, v7

    .line 177
    .line 178
    invoke-virtual {v12, v13}, Lcom/android/launcher3/iconarrange/b;->g(Landroid/graphics/drawable/Drawable;)V

    .line 179
    .line 180
    .line 181
    new-array v13, v4, [I

    .line 182
    .line 183
    invoke-virtual {v1, v13, v7, v7}, Lcom/android/launcher3/util/t0;->c([III)Z

    .line 184
    .line 185
    .line 186
    move-result v14

    .line 187
    if-eqz v14, :cond_2

    .line 188
    .line 189
    aget v9, v13, v16

    .line 190
    .line 191
    iget v10, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->I:I

    .line 192
    .line 193
    mul-int/2addr v9, v10

    .line 194
    iget-object v14, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 195
    .line 196
    invoke-virtual {v14}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 197
    .line 198
    .line 199
    move-result-object v14

    .line 200
    iget v14, v14, Lcom/android/launcher3/h0;->B1:I

    .line 201
    .line 202
    sub-int/2addr v10, v14

    .line 203
    div-int/2addr v10, v4

    .line 204
    add-int/2addr v9, v10

    .line 205
    int-to-float v9, v9

    .line 206
    iget-object v10, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 207
    .line 208
    invoke-virtual {v10}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 209
    .line 210
    .line 211
    move-result-object v10

    .line 212
    iget v10, v10, Lcom/android/launcher3/X3;->O:F

    .line 213
    .line 214
    mul-float/2addr v9, v10

    .line 215
    float-to-int v9, v9

    .line 216
    aget v10, v13, v7

    .line 217
    .line 218
    iget v14, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->J:I

    .line 219
    .line 220
    mul-int/2addr v10, v14

    .line 221
    iget-object v14, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 222
    .line 223
    invoke-virtual {v14}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 224
    .line 225
    .line 226
    move-result-object v14

    .line 227
    iget v14, v14, Lcom/android/launcher3/X3;->s:I

    .line 228
    .line 229
    add-int/2addr v10, v14

    .line 230
    int-to-float v10, v10

    .line 231
    iget-object v14, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 232
    .line 233
    invoke-virtual {v14}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 234
    .line 235
    .line 236
    move-result-object v14

    .line 237
    iget v14, v14, Lcom/android/launcher3/X3;->O:F

    .line 238
    .line 239
    mul-float/2addr v10, v14

    .line 240
    float-to-int v10, v10

    .line 241
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object v14

    .line 245
    check-cast v14, Lcom/android/launcher3/BubbleTextView;

    .line 246
    .line 247
    invoke-virtual {v14}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object v14

    .line 251
    check-cast v14, Lcom/android/launcher3/model/data/y;

    .line 252
    .line 253
    move/from16 v19, v4

    .line 254
    .line 255
    aget v4, v13, v16

    .line 256
    .line 257
    iput v4, v14, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 258
    .line 259
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object v4

    .line 263
    check-cast v4, Lcom/android/launcher3/BubbleTextView;

    .line 264
    .line 265
    invoke-virtual {v4}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object v4

    .line 269
    check-cast v4, Lcom/android/launcher3/model/data/y;

    .line 270
    .line 271
    aget v14, v13, v7

    .line 272
    .line 273
    iput v14, v4, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 274
    .line 275
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 276
    .line 277
    .line 278
    move-result-object v4

    .line 279
    check-cast v4, Lcom/android/launcher3/BubbleTextView;

    .line 280
    .line 281
    invoke-virtual {v4}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 282
    .line 283
    .line 284
    move-result-object v4

    .line 285
    check-cast v4, Lcom/android/launcher3/model/data/y;

    .line 286
    .line 287
    iput v15, v4, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 288
    .line 289
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 290
    .line 291
    .line 292
    move-result-object v4

    .line 293
    check-cast v4, Lcom/android/launcher3/BubbleTextView;

    .line 294
    .line 295
    invoke-virtual {v4}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 296
    .line 297
    .line 298
    move-result-object v4

    .line 299
    check-cast v4, Lcom/android/launcher3/model/data/y;

    .line 300
    .line 301
    iput v8, v4, Lcom/android/launcher3/model/data/y;->container:I

    .line 302
    .line 303
    iget-object v4, v1, Lcom/android/launcher3/util/t0;->c:[[Z

    .line 304
    .line 305
    aget v14, v13, v16

    .line 306
    .line 307
    aget-object v4, v4, v14

    .line 308
    .line 309
    aget v13, v13, v7

    .line 310
    .line 311
    aput-boolean v7, v4, v13

    .line 312
    .line 313
    :goto_2
    move/from16 v20, v9

    .line 314
    .line 315
    move/from16 v21, v10

    .line 316
    .line 317
    goto :goto_3

    .line 318
    :cond_2
    move/from16 v19, v4

    .line 319
    .line 320
    goto :goto_2

    .line 321
    :goto_3
    const/4 v4, 0x3

    .line 322
    new-array v4, v4, [F

    .line 323
    .line 324
    invoke-direct {v0, v6, v5, v4}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->x(Lcom/android/launcher3/n0$a;I[F)V

    .line 325
    .line 326
    .line 327
    new-instance v1, Lcom/android/launcher3/iconarrange/c;

    .line 328
    .line 329
    move-object v9, v2

    .line 330
    iget-object v2, v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 331
    .line 332
    aget v10, v4, v7

    .line 333
    .line 334
    float-to-int v10, v10

    .line 335
    aget v13, v4, v19

    .line 336
    .line 337
    float-to-int v13, v13

    .line 338
    move v14, v8

    .line 339
    move v8, v10

    .line 340
    add-int v10, v17, v20

    .line 341
    .line 342
    move-object/from16 v22, v3

    .line 343
    .line 344
    move v3, v5

    .line 345
    move-object v5, v11

    .line 346
    add-int v11, v18, v21

    .line 347
    .line 348
    const v23, 0x3f8f5c29    # 1.12f

    .line 349
    .line 350
    .line 351
    aget v4, v4, v16

    .line 352
    .line 353
    mul-float v4, v4, v23

    .line 354
    .line 355
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 356
    .line 357
    .line 358
    move-result-object v7

    .line 359
    iget v7, v7, Lcom/android/launcher3/X3;->O:F

    .line 360
    .line 361
    move/from16 v24, v14

    .line 362
    .line 363
    const/16 v14, 0x12c

    .line 364
    .line 365
    move-object/from16 v25, v9

    .line 366
    .line 367
    move v9, v13

    .line 368
    move v13, v7

    .line 369
    move-object v7, v12

    .line 370
    move v12, v4

    .line 371
    const/4 v4, 0x0

    .line 372
    move-object/from16 v15, v25

    .line 373
    .line 374
    const/16 v23, 0x1

    .line 375
    .line 376
    invoke-direct/range {v1 .. v14}, Lcom/android/launcher3/iconarrange/c;-><init>(Lcom/android/launcher3/C2;ILcom/android/launcher3/folder/Folder;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;Lcom/android/launcher3/iconarrange/b;IIIIFFI)V

    .line 377
    .line 378
    .line 379
    invoke-virtual {v7, v1}, Lcom/android/launcher3/iconarrange/b;->f(Lcom/android/launcher3/iconarrange/c;)V

    .line 380
    .line 381
    .line 382
    add-int/lit8 v5, v3, 0x1

    .line 383
    .line 384
    move-object/from16 v6, p1

    .line 385
    .line 386
    move-object/from16 v1, p3

    .line 387
    .line 388
    move-object v2, v15

    .line 389
    move/from16 v4, v19

    .line 390
    .line 391
    move/from16 v9, v20

    .line 392
    .line 393
    move/from16 v10, v21

    .line 394
    .line 395
    move-object/from16 v3, v22

    .line 396
    .line 397
    move/from16 v7, v23

    .line 398
    .line 399
    move/from16 v8, v24

    .line 400
    .line 401
    move/from16 v15, p2

    .line 402
    .line 403
    goto/16 :goto_1

    .line 404
    .line 405
    :cond_3
    move-object v15, v2

    .line 406
    invoke-direct {v0, v15}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->W(Ljava/util/ArrayList;)V

    .line 407
    .line 408
    .line 409
    return-void
.end method

.method public u(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->p:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->p:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/android/launcher3/iconarrange/b;

    .line 18
    .line 19
    invoke-virtual {v2}, Lcom/android/launcher3/iconarrange/b;->a()Lcom/android/launcher3/iconarrange/c;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->p:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lcom/android/launcher3/iconarrange/b;

    .line 32
    .line 33
    invoke-virtual {v2}, Lcom/android/launcher3/iconarrange/b;->a()Lcom/android/launcher3/iconarrange/c;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2, p1}, Lcom/android/launcher3/iconarrange/c;->b(Landroid/graphics/Canvas;)V

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->p:Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 44
    .line 45
    .line 46
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 47
    .line 48
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2, v0}, Lcom/android/launcher3/menu/c;->z(Z)V

    .line 53
    .line 54
    .line 55
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    return-void
.end method

.method public z(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 5

    .line 1
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p2}, Lcom/android/launcher3/G4;->q()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Landroid/view/View;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1, v0}, Lcom/android/launcher3/Workspace;->K2(Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 50
    .line 51
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-direct {p0, p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->v(Lcom/android/launcher3/n0$a;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    invoke-virtual {p2, v0}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    const/16 v0, -0xc9

    .line 64
    .line 65
    if-ne p2, v0, :cond_1

    .line 66
    .line 67
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 68
    .line 69
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {p2}, Lcom/android/launcher3/Workspace;->O0()Lcom/android/launcher3/util/z0;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-virtual {p2}, Lcom/android/launcher3/util/z0;->getArray()Lcom/android/launcher3/util/x0;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    const/4 v0, 0x0

    .line 82
    invoke-virtual {p2, v0}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 87
    .line 88
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    sget-object v1, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_2

    .line 99
    .line 100
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 101
    .line 102
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->t()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-nez v0, :cond_2

    .line 111
    .line 112
    invoke-virtual {p0, p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->V(Lcom/android/launcher3/n0$a;)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 117
    .line 118
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    const/4 v1, 0x1

    .line 123
    invoke-virtual {v0, v1}, Lcom/android/launcher3/menu/c;->z(Z)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 127
    .line 128
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 133
    .line 134
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-virtual {v1}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    invoke-virtual {v0, v1}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    new-instance v1, Lcom/android/launcher3/util/t0;

    .line 147
    .line 148
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->r:I

    .line 149
    .line 150
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->s:I

    .line 151
    .line 152
    invoke-direct {v1, v2, v3}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 153
    .line 154
    .line 155
    iget v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->r:I

    .line 156
    .line 157
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->s:I

    .line 158
    .line 159
    invoke-direct {p0, v2, v3, v1, p2}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->A(IILcom/android/launcher3/util/t0;I)I

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    iput v2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->E:I

    .line 164
    .line 165
    iget-object v2, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 166
    .line 167
    iget-object v2, v2, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    .line 168
    .line 169
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    iget v3, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->E:I

    .line 174
    .line 175
    sub-int/2addr v2, v3

    .line 176
    iget-object v3, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 177
    .line 178
    iget-object v3, v3, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    .line 179
    .line 180
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 181
    .line 182
    .line 183
    move-result v3

    .line 184
    iget v4, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->E:I

    .line 185
    .line 186
    if-le v3, v4, :cond_3

    .line 187
    .line 188
    invoke-direct {p0, v2}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->X(I)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p0, p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->r(Lcom/android/launcher3/n0$a;)V

    .line 192
    .line 193
    .line 194
    return-void

    .line 195
    :cond_3
    if-ne v0, p2, :cond_4

    .line 196
    .line 197
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange;->m:Lcom/android/launcher3/C2;

    .line 198
    .line 199
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    if-nez v0, :cond_4

    .line 204
    .line 205
    invoke-virtual {p0, p1, p2, v1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->t(Lcom/android/launcher3/n0$a;ILcom/android/launcher3/util/t0;)V

    .line 206
    .line 207
    .line 208
    return-void

    .line 209
    :cond_4
    invoke-virtual {p0, p1, p2, v1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->s(Lcom/android/launcher3/n0$a;ILcom/android/launcher3/util/t0;)V

    .line 210
    .line 211
    .line 212
    return-void
.end method
