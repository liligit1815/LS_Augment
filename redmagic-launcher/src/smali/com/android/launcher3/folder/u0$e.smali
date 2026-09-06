.class Lcom/android/launcher3/folder/u0$e;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PreviewBackground.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/u0;->U(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)Landroid/util/Pair;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

.field final synthetic h:Lcom/android/launcher3/folder/u0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/u0;Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/u0$e;->h:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/folder/u0$e;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

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
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "PreviewBackground"

    .line 5
    .line 6
    const-string v0, "expandFolderForm12To22OnDrop onAnimationEnd"

    .line 7
    .line 8
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$e;->h:Lcom/android/launcher3/folder/u0;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/u0;->I(Lcom/android/launcher3/folder/u0;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$e;->h:Lcom/android/launcher3/folder/u0;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {p1, v1}, Lcom/android/launcher3/folder/u0;->H(Lcom/android/launcher3/folder/u0;Landroid/graphics/drawable/Drawable;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$e;->h:Lcom/android/launcher3/folder/u0;

    .line 24
    .line 25
    invoke-static {p1, v1}, Lcom/android/launcher3/folder/u0;->O(Lcom/android/launcher3/folder/u0;Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$e;->h:Lcom/android/launcher3/folder/u0;

    .line 29
    .line 30
    invoke-static {p1, v1}, Lcom/android/launcher3/folder/u0;->P(Lcom/android/launcher3/folder/u0;Landroid/graphics/drawable/Drawable;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$e;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$e;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const/16 v1, 0xff

    .line 48
    .line 49
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 50
    .line 51
    .line 52
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$e;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->setVisibility(I)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$e;->h:Lcom/android/launcher3/folder/u0;

    .line 58
    .line 59
    invoke-static {p0}, Lcom/android/launcher3/folder/u0;->R(Lcom/android/launcher3/folder/u0;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "PreviewBackground"

    .line 5
    .line 6
    const-string v0, "expandFolderForm12To22OnDrop onAnimationStart"

    .line 7
    .line 8
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$e;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 12
    .line 13
    const/4 p1, 0x4

    .line 14
    invoke-virtual {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
