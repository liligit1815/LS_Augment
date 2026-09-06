.class public Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "TransformFolderIconItems.java"


# static fields
.field private static final j:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

.field private h:Ls1/m$a;

.field protected i:Landroid/animation/Animator;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems$a;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 4
    .line 5
    const-string v2, "dotScale"

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems$a;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->j:Landroid/util/Property;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public varargs a([F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->i()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->j:Landroid/util/Property;

    .line 5
    .line 6
    invoke-static {p0, v0, p1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->i:Landroid/animation/Animator;

    .line 11
    .line 12
    new-instance v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems$b;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems$b;-><init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->i:Landroid/animation/Animator;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g1()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->j(Landroid/graphics/Canvas;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public getAllBubbleTextViewChildList()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/BubbleTextView;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    const v0, 0x7f0b062b

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroid/view/ViewGroup;

    .line 27
    .line 28
    const v1, 0x7f0b062c

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Landroid/view/ViewGroup;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-nez v2, :cond_0

    .line 46
    .line 47
    move-object p0, v0

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getVisibility()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_1

    .line 54
    .line 55
    move-object p0, v1

    .line 56
    :cond_1
    :goto_0
    new-instance v0, Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .line 60
    .line 61
    const/4 v1, 0x0

    .line 62
    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-ge v1, v2, :cond_3

    .line 67
    .line 68
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    instance-of v3, v2, Lcom/android/launcher3/BubbleTextView;

    .line 73
    .line 74
    if-eqz v3, :cond_2

    .line 75
    .line 76
    check-cast v2, Lcom/android/launcher3/BubbleTextView;

    .line 77
    .line 78
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    return-object v0
.end method

.method public getTransformFolderDotScale()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

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
    iget p0, p0, Lcom/android/launcher3/folder/FolderIcon;->z:F

    .line 8
    .line 9
    return p0
.end method

.method protected i()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->i:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public j(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_1

    .line 6
    .line 7
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->H()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 12
    .line 13
    iget-boolean v2, v1, Lcom/android/launcher3/folder/FolderIcon;->v:Z

    .line 14
    .line 15
    if-nez v2, :cond_4

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iget v0, v1, Lcom/android/launcher3/folder/FolderIcon;->z:F

    .line 21
    .line 22
    cmpl-float v0, v0, v2

    .line 23
    .line 24
    if-lez v0, :cond_4

    .line 25
    .line 26
    :cond_1
    iget-object v0, v1, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->h:Ls1/m$a;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Lcom/android/launcher3/H5;->B()Lcom/android/launcher3/H5$c;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    sget-object v3, Lcom/android/launcher3/H5$c;->g:Lcom/android/launcher3/H5$c;

    .line 47
    .line 48
    if-ne v1, v3, :cond_2

    .line 49
    .line 50
    const/4 v1, 0x0

    .line 51
    goto :goto_0

    .line 52
    :cond_2
    const/4 v1, 0x1

    .line 53
    :goto_0
    iput v1, v0, Ls1/m$a;->i:I

    .line 54
    .line 55
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->h:Ls1/m$a;

    .line 56
    .line 57
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 58
    .line 59
    iget-object v3, v0, Ls1/m$a;->c:Landroid/graphics/Rect;

    .line 60
    .line 61
    invoke-virtual {v1, v3}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->V0(Landroid/graphics/Rect;)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    iput v1, v0, Ls1/m$a;->n:I

    .line 66
    .line 67
    iput v1, v0, Ls1/m$a;->g:I

    .line 68
    .line 69
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 70
    .line 71
    iget-object v1, v0, Lcom/android/launcher3/folder/FolderIcon;->w:Lk1/b;

    .line 72
    .line 73
    if-eqz v1, :cond_3

    .line 74
    .line 75
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->h:Ls1/m$a;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getNotificationCount()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iput v0, v1, Ls1/m$a;->f:I

    .line 82
    .line 83
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->h:Ls1/m$a;

    .line 84
    .line 85
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 86
    .line 87
    iget v3, v1, Lcom/android/launcher3/folder/FolderIcon;->z:F

    .line 88
    .line 89
    iget-object v1, v1, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/android/launcher3/folder/u0;->w0()F

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    sub-float/2addr v3, v1

    .line 96
    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    iput v1, v0, Ls1/m$a;->d:F

    .line 101
    .line 102
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->h:Ls1/m$a;

    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-static {v1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    iget v1, v1, Lcom/android/launcher3/r4;->V:F

    .line 113
    .line 114
    iput v1, v0, Ls1/m$a;->j:F

    .line 115
    .line 116
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->h:Ls1/m$a;

    .line 117
    .line 118
    sget-object v1, Ls1/m$b;->h:Ls1/m$b;

    .line 119
    .line 120
    iput-object v1, v0, Ls1/m$a;->o:Ls1/m$b;

    .line 121
    .line 122
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 123
    .line 124
    iget-object v0, v0, Lcom/android/launcher3/folder/FolderIcon;->x:Ls1/m;

    .line 125
    .line 126
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->h:Ls1/m$a;

    .line 131
    .line 132
    invoke-virtual {v0, v1, p1, p0}, Ls1/m;->a(Landroid/content/Context;Landroid/graphics/Canvas;Ls1/m$a;)V

    .line 133
    .line 134
    .line 135
    :cond_4
    :goto_1
    return-void
.end method

.method public k()Z
    .locals 1

    .line 1
    const v0, 0x7f0b062c

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Landroid/view/ViewGroup;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getVisibility()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public l(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    const v0, 0x7f0b062b

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroid/view/ViewGroup;

    .line 27
    .line 28
    const v1, 0x7f0b062c

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Landroid/view/ViewGroup;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-nez v2, :cond_0

    .line 46
    .line 47
    move-object p0, v0

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getVisibility()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_1

    .line 54
    .line 55
    move-object p0, v1

    .line 56
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 57
    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-ge v0, v1, :cond_3

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    if-eqz v1, :cond_2

    .line 68
    .line 69
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 74
    .line 75
    invoke-interface {p1, v2, v1}, Lcom/android/launcher3/util/Y0$a;->a(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-eqz v2, :cond_2

    .line 80
    .line 81
    return-object v1

    .line 82
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_3
    const/4 p0, 0x0

    .line 86
    return-object p0
.end method

.method public m(Lcom/android/launcher3/model/data/p;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 16
    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    const v0, 0x7f0b062b

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroid/view/ViewGroup;

    .line 27
    .line 28
    const v1, 0x7f0b062c

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Landroid/view/ViewGroup;

    .line 36
    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    iget v1, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    const/4 v3, 0x1

    .line 45
    if-ne v1, v3, :cond_0

    .line 46
    .line 47
    iget p1, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 48
    .line 49
    if-ne p1, v3, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    move v3, v2

    .line 53
    :goto_0
    const/16 p1, 0x8

    .line 54
    .line 55
    if-eqz v3, :cond_1

    .line 56
    .line 57
    move v1, p1

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    move v1, v2

    .line 60
    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 61
    .line 62
    .line 63
    if-nez v3, :cond_2

    .line 64
    .line 65
    move v2, p1

    .line 66
    :cond_2
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 67
    .line 68
    .line 69
    :cond_3
    return-void
.end method

.method public setPadding(IIII)V
    .locals 0

    .line 1
    return-void
.end method

.method public setTransformFolderDotScale(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lcom/android/launcher3/folder/FolderIcon;->z:F

    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public setTransformFolderIcon(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 2
    .line 3
    return-void
.end method
