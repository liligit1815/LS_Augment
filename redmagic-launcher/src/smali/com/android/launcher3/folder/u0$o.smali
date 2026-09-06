.class Lcom/android/launcher3/folder/u0$o;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PreviewBackground.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/u0;->k0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

.field final synthetic h:Z

.field final synthetic i:Lcom/android/launcher3/folder/u0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/u0;Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/u0$o;->i:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/folder/u0$o;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/android/launcher3/folder/u0$o;->h:Z

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$o;->i:Lcom/android/launcher3/folder/u0;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/u0;->C(Lcom/android/launcher3/folder/u0;Landroid/animation/ValueAnimator;)V

    .line 8
    .line 9
    .line 10
    iget-boolean p1, p0, Lcom/android/launcher3/folder/u0$o;->h:Z

    .line 11
    .line 12
    if-nez p1, :cond_1

    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$o;->i:Lcom/android/launcher3/folder/u0;

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/u0;->K(Lcom/android/launcher3/folder/u0;Landroid/graphics/drawable/Drawable;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$o;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$o;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const/16 v0, 0xff

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$o;->i:Lcom/android/launcher3/folder/u0;

    .line 39
    .line 40
    invoke-static {p0}, Lcom/android/launcher3/folder/u0;->R(Lcom/android/launcher3/folder/u0;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$o;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$o;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$o;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lc1/b;

    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$o;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    instance-of v0, v0, Lcom/android/launcher3/Hotseat;

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$o;->i:Lcom/android/launcher3/folder/u0;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$o;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-interface {p0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Lcom/android/launcher3/CellLayout;

    .line 57
    .line 58
    invoke-virtual {p1}, Lc1/b;->a()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-virtual {p1}, Lc1/b;->b()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    invoke-static {v0, p0, v1, p1}, Lcom/android/launcher3/folder/u0;->S(Lcom/android/launcher3/folder/u0;Lcom/android/launcher3/CellLayout;II)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$o;->i:Lcom/android/launcher3/folder/u0;

    .line 71
    .line 72
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$o;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 73
    .line 74
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lcom/android/launcher3/CellLayout;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$o;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 85
    .line 86
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 87
    .line 88
    iget v1, p0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 89
    .line 90
    iget p0, p0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 91
    .line 92
    invoke-static {p1, v0, v1, p0}, Lcom/android/launcher3/folder/u0;->S(Lcom/android/launcher3/folder/u0;Lcom/android/launcher3/CellLayout;II)V

    .line 93
    .line 94
    .line 95
    return-void
.end method
