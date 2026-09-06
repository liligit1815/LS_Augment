.class Lcom/android/launcher3/folder/u0$h;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PreviewBackground.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/u0;->p0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;Ljava/util/ArrayList;Ljava/util/ArrayList;IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Ljava/util/ArrayList;

.field final synthetic h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

.field final synthetic i:Lcom/android/launcher3/CellLayout;

.field final synthetic j:I

.field final synthetic k:I

.field final synthetic l:Lcom/android/launcher3/folder/u0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/u0;Ljava/util/ArrayList;Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/CellLayout;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/u0$h;->l:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/folder/u0$h;->g:Ljava/util/ArrayList;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/folder/u0$h;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/folder/u0$h;->i:Lcom/android/launcher3/CellLayout;

    .line 8
    .line 9
    iput p5, p0, Lcom/android/launcher3/folder/u0$h;->j:I

    .line 10
    .line 11
    iput p6, p0, Lcom/android/launcher3/folder/u0$h;->k:I

    .line 12
    .line 13
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "PreviewBackground"

    .line 5
    .line 6
    const-string v0, "doTransformFolderIconSizeChangeAnim onAnimationEnd"

    .line 7
    .line 8
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->l:Lcom/android/launcher3/folder/u0;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/u0;->B(Lcom/android/launcher3/folder/u0;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->l:Lcom/android/launcher3/folder/u0;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->n(Lcom/android/launcher3/folder/u0;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->l:Lcom/android/launcher3/folder/u0;

    .line 27
    .line 28
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/u0;->I(Lcom/android/launcher3/folder/u0;Z)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->l:Lcom/android/launcher3/folder/u0;

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-static {p1, v1}, Lcom/android/launcher3/folder/u0;->D(Lcom/android/launcher3/folder/u0;Landroid/graphics/drawable/Drawable;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->l:Lcom/android/launcher3/folder/u0;

    .line 38
    .line 39
    invoke-static {p1, v1}, Lcom/android/launcher3/folder/u0;->E(Lcom/android/launcher3/folder/u0;Landroid/graphics/Rect;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const/16 v2, 0xff

    .line 57
    .line 58
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 59
    .line 60
    .line 61
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 62
    .line 63
    const v2, 0x7f0b0422

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, v2, v1}, Landroid/widget/FrameLayout;->setTag(ILjava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 70
    .line 71
    iget-object p1, p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 72
    .line 73
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->l:Lcom/android/launcher3/folder/u0;

    .line 77
    .line 78
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->R(Lcom/android/launcher3/folder/u0;)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$h;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->z1()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "PreviewBackground"

    .line 5
    .line 6
    const-string v0, "doTransformFolderIconSizeChangeAnim onAnimationStart"

    .line 7
    .line 8
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->l:Lcom/android/launcher3/folder/u0;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->n(Lcom/android/launcher3/folder/u0;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->l:Lcom/android/launcher3/folder/u0;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->n(Lcom/android/launcher3/folder/u0;)Ljava/util/ArrayList;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$h;->g:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 40
    .line 41
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 42
    .line 43
    const v1, 0x7f0b0422

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v1, v0}, Landroid/widget/FrameLayout;->setTag(ILjava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->l:Lcom/android/launcher3/folder/u0;

    .line 50
    .line 51
    const/4 v0, 0x1

    .line 52
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/u0;->I(Lcom/android/launcher3/folder/u0;Z)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->l:Lcom/android/launcher3/folder/u0;

    .line 56
    .line 57
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$h;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 58
    .line 59
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->q(Lcom/android/launcher3/folder/u0;)Lcom/android/launcher3/CellLayout;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {p1, v0, v1}, Lcom/android/launcher3/folder/u0;->T(Lcom/android/launcher3/folder/u0;Lcom/android/launcher3/folder/FolderIcon;Lcom/android/launcher3/CellLayout;)Landroid/graphics/drawable/Drawable;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/u0;->D(Lcom/android/launcher3/folder/u0;Landroid/graphics/drawable/Drawable;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    if-eqz p1, :cond_0

    .line 77
    .line 78
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    const/4 v0, 0x0

    .line 85
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 86
    .line 87
    .line 88
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->l:Lcom/android/launcher3/folder/u0;

    .line 89
    .line 90
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$h;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 91
    .line 92
    iget-object v0, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 93
    .line 94
    iget v0, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 95
    .line 96
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/u0;->L(Lcom/android/launcher3/folder/u0;I)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->l:Lcom/android/launcher3/folder/u0;

    .line 100
    .line 101
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$h;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 102
    .line 103
    iget-object v0, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 104
    .line 105
    iget v0, v0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 106
    .line 107
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/u0;->M(Lcom/android/launcher3/folder/u0;I)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$h;->l:Lcom/android/launcher3/folder/u0;

    .line 111
    .line 112
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$h;->i:Lcom/android/launcher3/CellLayout;

    .line 113
    .line 114
    iget v1, p0, Lcom/android/launcher3/folder/u0$h;->j:I

    .line 115
    .line 116
    iget p0, p0, Lcom/android/launcher3/folder/u0$h;->k:I

    .line 117
    .line 118
    invoke-static {p1, v0, v1, p0}, Lcom/android/launcher3/folder/u0;->S(Lcom/android/launcher3/folder/u0;Lcom/android/launcher3/CellLayout;II)V

    .line 119
    .line 120
    .line 121
    return-void
.end method
