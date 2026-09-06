.class Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$m;
.super Ljava/lang/Object;
.source "TransformFolderIcon.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->Q0(Lcom/android/launcher3/n0$a;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/view/View;

.field final synthetic h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;


# direct methods
.method constructor <init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$m;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$m;->g:Landroid/view/View;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$m;->g:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$m;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    instance-of v0, v0, Lcom/android/launcher3/Hotseat;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$m;->h:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lcom/android/launcher3/folder/u0;->W0(Landroid/graphics/drawable/Drawable;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method
