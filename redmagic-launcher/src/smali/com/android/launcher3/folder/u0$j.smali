.class Lcom/android/launcher3/folder/u0$j;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PreviewBackground.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/u0;->i0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;ZLcom/android/launcher3/BubbleTextView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Lcom/android/launcher3/BubbleTextView;

.field final synthetic i:Lcom/android/launcher3/CellLayout;

.field final synthetic j:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

.field final synthetic k:Lcom/android/launcher3/folder/u0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/u0;ZLcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/u0$j;->k:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/folder/u0$j;->g:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/folder/u0$j;->h:Lcom/android/launcher3/BubbleTextView;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/folder/u0$j;->i:Lcom/android/launcher3/CellLayout;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/folder/u0$j;->j:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

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
    new-instance p1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v0, "doEndIconToSmallItemsAnim onAnimationEnd isBigToSmall="

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    iget-boolean v0, p0, Lcom/android/launcher3/folder/u0$j;->g:Z

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v0, " text="

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$j;->h:Lcom/android/launcher3/BubbleTextView;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string v0, "PreviewBackground"

    .line 38
    .line 39
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$j;->h:Lcom/android/launcher3/BubbleTextView;

    .line 43
    .line 44
    const/high16 v0, 0x3f800000    # 1.0f

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setAlpha(F)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$j;->k:Lcom/android/launcher3/folder/u0;

    .line 50
    .line 51
    const/4 v0, 0x0

    .line 52
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/u0;->H(Lcom/android/launcher3/folder/u0;Landroid/graphics/drawable/Drawable;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$j;->k:Lcom/android/launcher3/folder/u0;

    .line 56
    .line 57
    invoke-static {p0}, Lcom/android/launcher3/folder/u0;->R(Lcom/android/launcher3/folder/u0;)V

    .line 58
    .line 59
    .line 60
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
    const-string v0, "doEndIconToSmallItemsAnim onAnimationStart isBigToSmall="

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    iget-boolean v0, p0, Lcom/android/launcher3/folder/u0$j;->g:Z

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v0, " text="

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$j;->h:Lcom/android/launcher3/BubbleTextView;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string v0, "PreviewBackground"

    .line 38
    .line 39
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$j;->h:Lcom/android/launcher3/BubbleTextView;

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setAlpha(F)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$j;->k:Lcom/android/launcher3/folder/u0;

    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$j;->i:Lcom/android/launcher3/CellLayout;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$j;->j:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 55
    .line 56
    iget v1, p0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 57
    .line 58
    iget p0, p0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 59
    .line 60
    invoke-static {p1, v0, v1, p0}, Lcom/android/launcher3/folder/u0;->S(Lcom/android/launcher3/folder/u0;Lcom/android/launcher3/CellLayout;II)V

    .line 61
    .line 62
    .line 63
    return-void
.end method
