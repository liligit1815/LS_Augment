.class Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "TransformFolderIcon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->P0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/BubbleTextView;

.field final synthetic h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;


# direct methods
.method constructor <init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/BubbleTextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$b;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$b;->g:Lcom/android/launcher3/BubbleTextView;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
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
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$b;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {p1, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->F0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Landroid/graphics/drawable/Drawable;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$b;->g:Lcom/android/launcher3/BubbleTextView;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$b;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$b;->g:Lcom/android/launcher3/BubbleTextView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {p1, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->F0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Landroid/graphics/drawable/Drawable;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$b;->g:Lcom/android/launcher3/BubbleTextView;

    .line 20
    .line 21
    const/4 p1, 0x4

    .line 22
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
