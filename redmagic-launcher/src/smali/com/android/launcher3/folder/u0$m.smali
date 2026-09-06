.class Lcom/android/launcher3/folder/u0$m;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PreviewBackground.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/u0;->n0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

.field final synthetic i:Lcom/android/launcher3/CellLayout;

.field final synthetic j:Ljava/lang/Runnable;

.field final synthetic k:Lcom/android/launcher3/folder/u0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/u0;ZLcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/CellLayout;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/u0$m;->k:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/folder/u0$m;->g:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/folder/u0$m;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/folder/u0$m;->i:Lcom/android/launcher3/CellLayout;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/folder/u0$m;->j:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 12
    .line 13
    .line 14
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
    const-string p1, "PreviewBackground"

    .line 5
    .line 6
    const-string v0, "doFolderDestroyAnim onAnimationEnd"

    .line 7
    .line 8
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$m;->k:Lcom/android/launcher3/folder/u0;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->R(Lcom/android/launcher3/folder/u0;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$m;->k:Lcom/android/launcher3/folder/u0;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/u0;->I(Lcom/android/launcher3/folder/u0;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$m;->k:Lcom/android/launcher3/folder/u0;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/u0;->H(Lcom/android/launcher3/folder/u0;Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$m;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 29
    .line 30
    const/high16 v0, 0x3f800000    # 1.0f

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$m;->j:Ljava/lang/Runnable;

    .line 36
    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v0, "doFolderDestroyAnim onAnimationStart hideFolderIconDrawable="

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    iget-boolean v0, p0, Lcom/android/launcher3/folder/u0$m;->g:Z

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "PreviewBackground"

    .line 24
    .line 25
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$m;->k:Lcom/android/launcher3/folder/u0;

    .line 29
    .line 30
    iget-boolean v0, p0, Lcom/android/launcher3/folder/u0$m;->g:Z

    .line 31
    .line 32
    xor-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/u0;->I(Lcom/android/launcher3/folder/u0;Z)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$m;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$m;->k:Lcom/android/launcher3/folder/u0;

    .line 44
    .line 45
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$m;->i:Lcom/android/launcher3/CellLayout;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$m;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 50
    .line 51
    iget v1, p0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 52
    .line 53
    iget p0, p0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 54
    .line 55
    invoke-static {p1, v0, v1, p0}, Lcom/android/launcher3/folder/u0;->S(Lcom/android/launcher3/folder/u0;Lcom/android/launcher3/CellLayout;II)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
