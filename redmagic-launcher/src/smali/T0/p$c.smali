.class LT0/p$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "FolderAnimationManagerMFV.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LT0/p;->U0(Landroid/animation/AnimatorSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

.field final synthetic h:LT0/p;


# direct methods
.method constructor <init>(LT0/p;Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V
    .locals 0

    .line 1
    iput-object p1, p0, LT0/p$c;->h:LT0/p;

    .line 2
    .line 3
    iput-object p2, p0, LT0/p$c;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

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
    .locals 0

    .line 1
    iget-object p1, p0, LT0/p$c;->h:LT0/p;

    .line 2
    .line 3
    invoke-static {p1}, LT0/p;->e0(LT0/p;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, LT0/p$c;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, LT0/p$c;->h:LT0/p;

    .line 2
    .line 3
    invoke-static {p1}, LT0/p;->f0(LT0/p;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x4

    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-static {}, Lx1/O;->F3()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, LT0/p$c;->h:LT0/p;

    .line 17
    .line 18
    invoke-static {p0}, LT0/p;->g0(LT0/p;)Lcom/android/launcher3/folder/FolderIcon;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object p0, p0, LT0/p$c;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    invoke-static {}, Lx1/O;->F3()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    iget-object p0, p0, LT0/p$c;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-void
.end method
