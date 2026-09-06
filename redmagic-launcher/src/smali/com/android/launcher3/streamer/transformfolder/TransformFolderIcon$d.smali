.class Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$d;
.super Landroid/animation/AnimatorListenerAdapter;
.source "TransformFolderIcon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->R0()V
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
    iput-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$d;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$d;->g:Lcom/android/launcher3/BubbleTextView;

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
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$d;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->F0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Landroid/graphics/drawable/Drawable;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$d;->g:Lcom/android/launcher3/BubbleTextView;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$d;->g:Lcom/android/launcher3/BubbleTextView;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$d;->g:Lcom/android/launcher3/BubbleTextView;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$d;->g:Lcom/android/launcher3/BubbleTextView;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/android/launcher3/BubbleTextView;->getIconSize()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iget-object v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$d;->g:Lcom/android/launcher3/BubbleTextView;

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/android/launcher3/BubbleTextView;->getIconSize()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    invoke-virtual {p1, v0, v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$d;->g:Lcom/android/launcher3/BubbleTextView;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->requestLayout()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$d;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$d;->g:Lcom/android/launcher3/BubbleTextView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p1, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->F0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Landroid/graphics/drawable/Drawable;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$d;->g:Lcom/android/launcher3/BubbleTextView;

    .line 17
    .line 18
    const/4 p1, 0x4

    .line 19
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
